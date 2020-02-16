using FormGenerator.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels.Form
{
    public class FormViewModel
    {
        public int ID { get; set; }

        public string Name { get; set; }
        public string Decription { get; set; }
        public bool IsActive { get; set; }

    }


}
