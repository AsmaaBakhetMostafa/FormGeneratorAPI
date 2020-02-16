using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels.UserViewModels
{
   public class ChangePasswordCreateViewModel
    {
        [Required]
        
        [MinLength(6),MaxLength(100)]
        public string CurrentPassword { get; set; }
        [Required]

        [MinLength(6), MaxLength(100)]
        public string NewPassword { get; set; }

    }
}
