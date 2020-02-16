using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Data.Repository;
using FormGenerator.Models.User;

namespace FormGenerator.Repositories
{
    public interface IRoleRepository : IRepository<Role>
    {
        Role Insert(Role model);
        bool IsExist(Role model);
        void ChangeActivationStatus(Role model);
    }
}
