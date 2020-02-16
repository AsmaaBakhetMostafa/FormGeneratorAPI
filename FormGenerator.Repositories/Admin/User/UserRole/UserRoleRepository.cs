using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Data.Extentions;
using FormGenerator.Data.Repository;
using FormGenerator.Data.UnitofWork;

using FormGenerator.Models.User;

namespace FormGenerator.Repositories
{
    public class UserRoleRepository : Repository<UserRole>, IUserRoleRepository
    {
        IUnitOfWork _unitOfWork;

        public UserRoleRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
    }
}
