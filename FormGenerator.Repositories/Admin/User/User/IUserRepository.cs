using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Data.Repository;
using FormGenerator.Models.User;

namespace FormGenerator.Repositories
{
    public interface IUserRepository : IRepository<User>
    {
        bool IsExist(User model);
        void ChangeActivationStatus(User model);
    }
    
}
