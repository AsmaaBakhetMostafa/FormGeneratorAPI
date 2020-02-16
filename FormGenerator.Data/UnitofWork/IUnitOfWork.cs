using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Data.UnitofWork
{
    public interface IUnitOfWork
    {
        DbContext Context { get; }
        int UserID { set; get; }
        int BranchID { set; get; }
        void Save();
        DbContextTransaction BeginTransaction();
    }
}
