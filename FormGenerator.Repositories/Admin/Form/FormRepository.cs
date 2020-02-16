using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Data.Extentions;
using FormGenerator.Data.Repository;
using FormGenerator.Data.UnitofWork;
using FormGenerator.Models.User;
using FormGenerator.Models.Admin.Form;

namespace FormGenerator.Repositories
{
    public class FormStructureRepository : Repository<FormStructure>, IFormStructureRepository
    {
        IUnitOfWork _unitOfWork;

        public FormStructureRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

    }
}
