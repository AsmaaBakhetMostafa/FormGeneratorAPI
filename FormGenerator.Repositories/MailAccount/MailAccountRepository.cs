using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Data.Repository;
using FormGenerator.Data.UnitofWork;
using FormGenerator.Models;

namespace FormGenerator.Repositories
{
    public class MailAccountRepository : Data.Repository.Repository<MailAccount>, IMailAccountRepository
    {
        public MailAccountRepository(IUnitOfWork unitOfWork)
            : base(unitOfWork) { }
        public bool IsExist(MailAccount model)
        {
           return Get(x => x.ID != model.ID && x.Email==model.Email && !x.IsDeleted).Count() > 0;
        }
        public void ChangeActivationStatus(MailAccount model)
        {
            SaveIncluded(model, "IsActive");
        }
    }
}
