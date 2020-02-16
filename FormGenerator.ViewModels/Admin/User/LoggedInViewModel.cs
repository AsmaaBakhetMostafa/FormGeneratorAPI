
using FormGenerator.Models.Enums;
using FormGenerator.Models.User;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels.UserViewModels
{
    public class LoggedInViewModel
    {
        public int ID { get; set; }
        public string AccessToken { get; set; }
        public bool NeedVerification { get; set; } = false;
    }
    
}