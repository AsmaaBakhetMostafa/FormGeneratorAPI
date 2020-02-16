using FormGenerator.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Models.Admin.Form
{

    [Table("Admin.Form")]
    public class FormStructure : BaseModel, IBilingual, IActive
    {
        public FormStructure()
        {

        }
       
        public string NameArabic { get; set; }
        public string NameEnglish { get; set; }
        public string Decription { get; set; }
        public virtual ICollection<FormFileds> FormFileds { get; set; }
        public bool IsActive { get; set; } = true;

    }
}
