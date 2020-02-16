using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels.UserViewModels
{
   public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [MinLength(5)]
        public string Email { get; set; }
      
    }
}
