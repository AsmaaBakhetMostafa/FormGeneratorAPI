using FormGenerator.Data.Factory;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using FormGenerator.Data.Helpers;
using System.Net.Http;

namespace FormGenerator.Data.UnitofWork
{
    public class UnitOfWork : IDisposable, IUnitOfWork
    {
        private readonly DbContext _dbContext;
        private bool _disposed;
        public int UserID { set; get; }
        public int BranchID { set; get; }

        public DbContext Context
        {
            get { return _dbContext; }

        }
        public UnitOfWork(IDbContextFactory dbContextFactory)
        {
            //UserID = GetUserId();
            //BranchID = 1;
            SetUserIDAndBranchID();
            _dbContext = dbContextFactory.GetDbContext();
        }
        public void Save()
        {
            try
            {
                _dbContext.SaveChanges();
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
       
        private void SetUserIDAndBranchID()
        {
            try
            {
                string accessTokenHeaderName = "token";
                string accessToken = "";
                if (!HttpContext.Current.Request.Headers.AllKeys.Any(header => header == accessTokenHeaderName))
                    accessToken = "";
                else if (HttpContext.Current.Request.Headers.AllKeys.Any(header => header == accessTokenHeaderName))
                {
                    accessToken = HttpContext.Current.Request.Headers.GetValues(accessTokenHeaderName).First();
                }
                UserID= int.Parse(SecurityHelper.GetUserIDFromToken(accessToken).ToString());
                BranchID = int.Parse(SecurityHelper.GetBranchIDFromToken(accessToken).ToString());

            }
            catch (Exception ex)
            {
                //return 0;
            }
           
        }

        public DbContextTransaction BeginTransaction()
        {
            return Context.Database.CurrentTransaction ?? Context.Database.BeginTransaction();
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();
                }
            }
            _disposed = true;
        }

    }
}
