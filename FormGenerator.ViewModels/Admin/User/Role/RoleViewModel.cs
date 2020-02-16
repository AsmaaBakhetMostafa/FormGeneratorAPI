using FormGenerator.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels.User
{
    public class RoleViewModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string RedirectUrl { get; set; }
        public bool IsActive { get; set; }
    }

   
}
