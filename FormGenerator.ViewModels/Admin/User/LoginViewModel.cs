using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels.UserViewModels
{
   public class LoginViewModel
    {
        [Required]
        [EmailAddress]
        [MinLength(5)]
        public string Email { get; set; }
        [Required]
        [MinLength(5)]
        public string Password { get; set; }
        public int BranchID { get; set; }=1;

    }

    //public static class LoginExtinsion
    //{
    //    public static LoginViewModel Descrypt(this LoginViewModel loginViewModel)
    //    {
    //        return new LoginViewModel() {  Email=Security loginViewModel.Email.Decrypt()};
    //    }
    //}
}
