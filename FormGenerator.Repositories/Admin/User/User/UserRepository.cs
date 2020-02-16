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
    public class UserRepository : Repository<User>, IUserRepository
    {
        IUnitOfWork _unitOfWork;

        public UserRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public bool IsExist(User model)
        {
           return Get(x => x.ID != model.ID && x.Name == model.Name).Any();
        }
        public void ChangeActivationStatus(User model)
        {
            SaveIncluded(model, "IsActive");
        }
    }
}
