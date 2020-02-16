using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Halal.Data.Repository;
using Halal.Data.UnitofWork;
using Halal.Models;

namespace Halal.Repositories
{
    public class ApplicationLogRepository : Repository<ApplicationLog>, IApplicationLogRepository
    {
        public ApplicationLogRepository(IUnitOfWork unitOfWork)
            : base(unitOfWork) { }
       

        
       
    }
}
