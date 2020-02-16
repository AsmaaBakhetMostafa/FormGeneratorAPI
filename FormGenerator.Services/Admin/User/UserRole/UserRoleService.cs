using FormGenerator.Data.Repository;
using FormGenerator.Data.UnitofWork;
using FormGenerator.Models.User;
using FormGenerator.Services.Interfaces.User;
using FormGenerator.ViewModels.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Repositories;

namespace FormGenerator.Services.User
{
    public class UserRoleService :  IUserRoleService
    {
        private readonly IUserRoleRepository _userRoleRepository;
        public UserRoleService(IUserRoleRepository userRoleRepository,

                IUnitOfWork unitOfWork) : base()
        {
            _userRoleRepository = userRoleRepository;
        }
       
        public void Add(ICollection<UserRoleViewModel> roles)
        {
            int userID = roles.First().UserID;
            var existRoles = _userRoleRepository.GetAll().Where(x => x.UserID == userID && !x.IsDeleted).ToList();
            foreach (var role in existRoles)
            {
                if (roles.Count(x => x.RoleID == role.RoleID) == 0)
                    role.IsDeleted = true;
            }
            foreach (var model in roles)
            {
                if (existRoles.Count(x => x.RoleID == model.RoleID) == 0)
                    _userRoleRepository.Add(model.ToModel());
            }

        }
       
    }
}
