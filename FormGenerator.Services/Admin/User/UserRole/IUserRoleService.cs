using FormGenerator.Data.Repository;
using FormGenerator.Models.User;
using FormGenerator.ViewModels.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Services.Interfaces.User
{
    public interface IUserRoleService
    {
        void Add(ICollection<UserRoleViewModel> roles);
        //IEnumerable<UserRoleViewModel> GetUserRoles(int id);
    }
}
