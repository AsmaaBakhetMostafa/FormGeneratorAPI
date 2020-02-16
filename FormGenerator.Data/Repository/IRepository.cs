using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Data.Repository
{
    public interface IRepository<Entity>
    {
        int UserID { get; set; }
        IQueryable<Entity> GetAll();
        Task<IQueryable<Entity>> GetAllAsync();
        Entity GetById(int id);
        Task<Entity> GetByIdAsync(params object[] id);
        Entity Add(Entity entity);
        Entity Edit(Entity entity);
        void Remove(int id);
        int GeCount();
        IQueryable<Entity> Find(Expression<Func<Entity, bool>> where);
        Task<IQueryable<Entity>> FindAsync(Expression<Func<Entity, bool>> where);
        Entity Single(Expression<Func<Entity, bool>> where);
        Entity First(Expression<Func<Entity, bool>> where);
        void SaveIncluded(Entity entity, params string[] includedProperties);
        void SaveExcluded(Entity entity, params string[] excludedProperties);
        IEnumerable<Entity> AddRange(IEnumerable<Entity> entityList);
        void EditRange(IEnumerable<Entity> entityList);
        void DeleteRange(IEnumerable<int> ids);
        void RemoveRange(IEnumerable<int> entityList);
    }
}
