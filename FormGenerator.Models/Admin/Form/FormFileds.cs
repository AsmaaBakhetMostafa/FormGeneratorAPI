using FormGenerator.Models.Enums;
using FormGenerator.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Models.Admin.Form
{
    [Table("Admin.Form")]
    public class FormFileds : BaseModel, IBilingual, IActive
    {
        public FormFileds()
        {

        }

        public string NameArabic { get; set; }
        public string NameEnglish { get; set; }

        public FiledType FiledType { get; set; }

        [Required]
        [ForeignKey("FormStructure")]
        public int FormStructureID { get; set; }
        public virtual FormStructure FormStructure { get; set; }
        public bool IsActive { get; set; } = true;

        public virtual ICollection<FiledOption> FiledOption { get; set; }


    }
}
