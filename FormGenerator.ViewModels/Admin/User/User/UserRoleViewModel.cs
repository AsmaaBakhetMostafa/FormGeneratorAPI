using FormGenerator.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels.User
{
    public class UserRoleViewModel
    {
        public int UserID { get; set; }
        public int RoleID { get; set; }
    }
    public static class UserRoleViewModelExtension
    {
        public static UserRole ToModel(this UserRoleViewModel viewModel)
        {
            return new UserRole()
            {
               UserID=viewModel.UserID,
               RoleID=viewModel.RoleID
            };
        }
        public static ICollection<UserRole> ToModel(this IEnumerable<UserRoleViewModel> list)
        {
            return list.Select(s => s.ToModel()).ToList();
        }

    }

}
