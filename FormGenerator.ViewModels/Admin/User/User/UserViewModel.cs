
using FormGenerator.Models.Enums;
using FormGenerator.Models.User;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.ViewModels.User;

namespace FormGenerator.ViewModels.UserViewModels
{
    public class UserViewModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public bool IsActive { get; set; }
        
        public string AccessToken { get; set; }
        
        public DateTime LastActivity { get; set; }
        public DateTime CreatedDate { get; set; }
        public IEnumerable<UserRoleViewModel> Roles { get; set; }
    }

    public static partial class UserExtension
    {
        public static UserViewModel ToViewModel(this Models.User.User model)
        {
            return new UserViewModel()
            {
                ID = model.ID,
                Mobile = model.Mobile,
                Name = model.Name,
                Email=model.Email,
                IsActive=model.IsActive,
                LastActivity=model.LastActivity,
                CreatedDate=model.CreatedDate,
                Roles=model.Roles.Select(r=>new UserRoleViewModel() {
                    RoleID=r.RoleID,
                    UserID=r.UserID
                }).ToList()
                
            };
        }

        public static IQueryable<UserViewModel> ToViewModel(this IQueryable<Models.User.User> list)
        {
            return list.Select(obj => obj.ToViewModel());
        }
    }
}