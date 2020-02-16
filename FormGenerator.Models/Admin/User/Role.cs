using FormGenerator.Models.Enums;
using FormGenerator.Models.Interfaces;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace FormGenerator.Models.User
{
    [Table("User.Role")]
    public class Role : BaseModel, IBilingual,IActive
    {
        public Role()
        {
            Users = new List<UserRole>();
        }
        [Required]
        [MinLength(2), MaxLength(255)]
        public string NameArabic { get; set; }

        [Required]
        [MinLength(2), MaxLength(255)]
        public string NameEnglish { get; set; }

        [Required]
        [MinLength(2), MaxLength(255)]
        public string RedirectUrl { get; set; }
        public bool IsActive { get; set; }
        public bool IsDevelopment { get; set; } = false;
        public virtual ICollection<UserRole> Users { get; set; }

    }
}