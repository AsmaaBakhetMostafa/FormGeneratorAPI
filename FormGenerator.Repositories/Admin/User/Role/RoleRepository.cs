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
    public class RoleRepository : Repository<Role>, IRoleRepository
    {
        IUnitOfWork _unitOfWork;

        public RoleRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public Role Insert(Role model)
        {
            Add(model);
            return model;
        }
        public void ChangeActivationStatus(Role model)
        {
            SaveIncluded(model, "IsActive");
        }
        public bool IsExist(Role model)
        {
           return Get(x => x.ID != model.ID && (x.NameArabic == model.NameArabic || x.NameEnglish == model.NameEnglish)).Any();
        }
    }
}
