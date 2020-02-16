using FormGenerator.Models.Enums;
using FormGenerator.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FormGenerator.Models.User
{
    [Table("User.User")]
    public class User : BaseModel, ISelectableListItem,IActive
    {
        public User()
        {
            Roles = new List<UserRole>();
            Tokens = new List<Token>();
        }

        [Required]
        [MinLength(2), MaxLength(255)]
        public string Name { get; set; }

        [Required]
        [MinLength(2), MaxLength(255)]
        public string Email { get; set; }

        [Required]
        [MinLength(2), MaxLength(255)]
        public string Mobile { get; set; }

        [Required]
        [MinLength(2), MaxLength(255)]
        public string Password { get; set; }

        [Required]
        public DateTime LastActivity { get; set; } = DateTime.Now;
        public bool IsActive { get; set; } = true;
        public bool IsDevelopment { get; set; } = false;
        public virtual ICollection<UserRole> Roles { get; set; }
        public virtual ICollection<Token> Tokens { get; set; }

    }
}