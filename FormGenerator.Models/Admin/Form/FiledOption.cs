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
    public class FiledOption : BaseModel, IBilingual, IActive
    {
        public FiledOption()
        {

        }

        public string NameArabic { get; set; }
        public string NameEnglish { get; set; }
        [Required]
        [ForeignKey("FormFiled")]
        public int FormFiledID { get; set; }
        public virtual FormFileds FormFiled { get; set; }
        public bool IsActive { get; set; } = true;

    }
}
