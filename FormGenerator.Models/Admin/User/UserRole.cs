using FormGenerator.Models.Enums;
using FormGenerator.Models.Interfaces;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace FormGenerator.Models.User
{
    [Table("User.UserRole")]
    public class UserRole : BaseModel
    {
        [Required]
        [ForeignKey("User")]
        public int UserID { get; set; }

        [Required]
        [ForeignKey("Role")]
        public int RoleID { get; set; }

        public virtual User User { get; set; }
        public virtual Role Role { get; set; }

    }
}