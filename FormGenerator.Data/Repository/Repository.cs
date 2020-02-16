using FormGenerator.Data.Factory;
using FormGenerator.Data.UnitofWork;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading.Tasks;
using FormGenerator.Data.Extentions;
using FormGenerator.Models;

namespace FormGenerator.Data.Repository
{
    public class Repository<Entity> : IRepository<Entity> where Entity : BaseModel
    {
        protected readonly DbSet<Entity> dbSet;
        protected readonly DbContext context;

        protected string[] defaultExcludedEditProperties = new string[]
        { "CreatedDate", "CreatedBy", "IsDeleted" };
        protected string[] defaultExcludedDeleteProperties = new string[]
        { "CreatedDate", "CreatedBy" };

        public int UserID { get; set; }
        public Repository(IUnitOfWork unitOfWork)
        {
            context = unitOfWork.Context;
            dbSet = context.Set<Entity>();
            UserID = unitOfWork.UserID;
            string d = ";;";
        }

        public virtual IQueryable<Entity> Get(Expression<Func<Entity, bool>> filter = null, Func<IQueryable<Entity>, IOrderedQueryable<Entity>> orderBy = null,
            string includeProperties = "")
        {
            IQueryable<Entity> query = dbSet;

            if (filter != null)
            {
                query = query.Where(filter);
            }

            if (!String.IsNullOrWhiteSpace(includeProperties))
            {
                foreach (var includeProperty in includeProperties.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
                {
                    query = query.Include(includeProperty);
                }
            }

            if (orderBy != null)
            {
                return orderBy(query).AsQueryable();
            }
            else
            {
                return query.AsQueryable();
            }
        }
        public virtual Entity Add(Entity entity)
        {
            entity.CreatedBy = UserID;
            entity.CreatedDate = DateTime.Now;
            return dbSet.Add(entity);
        }
        public virtual IEnumerable<Entity> AddRange(IEnumerable<Entity> entityList)
        {
            foreach (Entity entity in entityList)
                Add(entity);
            return entityList;
        }



        public virtual Entity EditIncludedProperties(Entity entity, string[] inudedProperties)
        {
            dbSet.Attach(entity);
            context.Configuration.ValidateOnSaveEnabled = false;
            foreach (var name in inudedProperties)
            {
                context.Entry(entity).Property(name).IsModified = true;
            }
            var takenProp = context.Entry<Entity>(entity).CurrentValues.PropertyNames.Except(inudedProperties);
            foreach (var name in takenProp)
            {
                context.Entry(entity).Property(name).IsModified = false;
            }
            entity.UpdatedBy = UserID;
            entity.UpdatedDate = DateTime.Now;
            return entity;
        }




        public virtual Entity EditByID(int entityID)
        {
            return Edit(dbSet.FirstOrDefault(T => T.ID == entityID));
        }

        public virtual Entity Edit(Entity entity)
        {
            if (defaultExcludedEditProperties.Any())
            {
                var oldEntity = context.Set<Entity>().Local.Where(e => e.ID == entity.ID).FirstOrDefault();
                if (oldEntity != null)
                    context.Entry<Entity>(oldEntity).State = EntityState.Detached;

                dbSet.Attach(entity);
                context.Configuration.ValidateOnSaveEnabled = false;
                foreach (var name in defaultExcludedEditProperties)
                {
                    context.Entry(entity).Property(name).IsModified = false;
                }
                var takenProp = context.Entry<Entity>(entity).CurrentValues.PropertyNames.Except(defaultExcludedEditProperties);
                entity.UpdatedBy = UserID;
                entity.UpdatedDate = DateTime.Now;
                foreach (var name in takenProp)
                {
                    context.Entry(entity).Property(name).IsModified = true;
                }
                
            }
            else
            {
                entity.UpdatedBy = UserID;
                entity.UpdatedDate = DateTime.Now;
                context.Entry<Entity>(entity).State = EntityState.Modified;
            }
            return entity;
        }
        public virtual void DeleteRange(IEnumerable<int> ids)
        {
            foreach (var id in ids)
            {
                Remove(id);
            }
        }

        public virtual void EditRange(IEnumerable<Entity> entityList)
        {
            foreach (Entity entity in entityList)
                Edit(entity);
        }
        public virtual void Remove(int id)
        {
            Entity entity = dbSet.Find(id);
            if (defaultExcludedDeleteProperties.Any())
            {
                dbSet.Attach(entity);
                context.Configuration.ValidateOnSaveEnabled = false;
                foreach (var name in defaultExcludedEditProperties)
                {
                    context.Entry(entity).Property(name).IsModified = false;
                }
                var takenProp = context.Entry<Entity>(entity).CurrentValues.PropertyNames.Except(defaultExcludedDeleteProperties);
                foreach (var name in takenProp)
                {
                    context.Entry(entity).Property(name).IsModified = true;
                }
                entity.UpdatedBy = UserID;
                entity.UpdatedDate = DateTime.Now;
                entity.IsDeleted = true;
            }
            else
            {
                entity.UpdatedBy = UserID;
                entity.UpdatedDate = DateTime.Now;
                entity.IsDeleted = true;
                context.Entry<Entity>(entity).State = EntityState.Modified;
            }
        }

        public virtual void RemoveRange(IEnumerable<int> entityList)
        {
            foreach (int entity in entityList)
                Remove(entity);
        }

        public virtual Entity GetById(int id)
        {
            return dbSet.Where(entity => !entity.IsDeleted && entity.ID == id).FirstOrDefault();
        }
        public async Task<Entity> GetByIdAsync(params object[] id)
        {
            return await dbSet.FindAsync(id);
        }
        public virtual void Save(Entity entity)
        {
            context.Entry<Entity>(entity).State = EntityState.Modified;
        }
        public virtual void SaveExcluded(Entity entity, params string[] excludedProperties)
        {
            if (excludedProperties.Any())
            {

                dbSet.Attach(entity);
                context.Configuration.ValidateOnSaveEnabled = false;
                foreach (var name in excludedProperties)
                {
                    context.Entry(entity).Property(name).IsModified = false;
                }
                var takenProp = context.Entry<Entity>(entity).CurrentValues.PropertyNames.Except(excludedProperties);
                foreach (var name in takenProp)
                {

                    context.Entry(entity).Property(name).IsModified = true;
                }
            }
            else
            {
                context.Entry<Entity>(entity).State = EntityState.Modified;
            }
        }
        public virtual void SaveIncluded(Entity entity, params string[] included)
        {
            if (included.Any())
            {
                var entry = context.Entry(entity);
                if(entry.State== EntityState.Detached)
                    dbSet.Attach(entity);
                context.Configuration.ValidateOnSaveEnabled = false;
                foreach (var name in included)
                {
                    context.Entry(entity).Property(name).IsModified = true;
                }
                var excludedProps = context.Entry<Entity>(entity).CurrentValues.PropertyNames.Except(included);
                foreach (var name in excludedProps)
                {
                    context.Entry(entity).Property(name).IsModified = false;
                }
            }
            else
            {
                context.Entry<Entity>(entity).State = EntityState.Modified;
            }
        }
        public virtual IQueryable<Entity> GetAll()
        {
            return dbSet.Where(x=>!x.IsDeleted);
        }
        public async Task<IQueryable<Entity>> GetAllAsync()
        {
            var items = await dbSet.ToListAsync();
            return items.AsQueryable();
        }
        public virtual int GeCount()
        {
            return dbSet.Count();
        }
        public virtual IQueryable<Entity> Find(Expression<Func<Entity, bool>> @where)
        {
            return dbSet.Where(@where);
        }
        public async Task<IQueryable<Entity>> FindAsync(Expression<Func<Entity, bool>> where)
        {
            var items = await dbSet.Where(@where).ToListAsync();
            return items.AsQueryable();
        }
        public virtual Entity Single(Expression<Func<Entity, bool>> @where)
        {
            return dbSet.Single(where) ?? dbSet?.SingleOrDefault(@where); ;
        }
        public virtual Entity First(Expression<Func<Entity, bool>> @where)
        {
            return dbSet?.First(@where) ?? dbSet?.FirstOrDefault(@where);
        }
        public virtual IQueryable<Entity> Skip(Expression<Func<Entity, bool>> order, int skipRows, int? takenRows)
        {
            return takenRows == null ? dbSet.OrderBy(order).Skip(skipRows) :
             dbSet.OrderBy(order).Skip(skipRows).Take(takenRows.Value);
        }
    }
}
