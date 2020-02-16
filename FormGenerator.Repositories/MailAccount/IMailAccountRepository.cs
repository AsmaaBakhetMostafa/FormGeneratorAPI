using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Data.Repository;
using FormGenerator.Models;
using FormGenerator.Models;

namespace FormGenerator.Repositories
{
    public interface IMailAccountRepository : FormGenerator.Data.Repository.IRepository<MailAccount>
    {
        bool IsExist( MailAccount model);
        void ChangeActivationStatus(MailAccount model);
    }
}
