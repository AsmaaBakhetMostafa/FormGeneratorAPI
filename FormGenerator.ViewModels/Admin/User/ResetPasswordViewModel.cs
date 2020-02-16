using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels.UserViewModels
{
   public class ResetPasswordViewModel
    {
        
        public int ID { get; set; }
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }

    }
}
