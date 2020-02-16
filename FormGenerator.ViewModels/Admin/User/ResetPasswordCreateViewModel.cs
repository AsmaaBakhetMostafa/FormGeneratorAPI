using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels.UserViewModels
{
   public class ResetPasswordCreateViewModel
    {
        [Required]
        
        [MinLength(6)]
        public string Password { get; set; }
        public string Code { get; set; }

    }
}
