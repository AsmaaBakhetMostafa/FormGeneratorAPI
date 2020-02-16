namespace FormGenerator.Models
{
    using FormGenerator.Models;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    

    [Table("Mail.MailAccount")]
    public partial class MailAccount : BaseModel
    {
        public MailAccount()
        {
        }

        [Required]
        [StringLength(250)]
        public string Email { get; set; }

        [Required]
        [StringLength(250)]
        public string Password { get; set; }

        [Required]
        [StringLength(250)]
        public string SMTP { get; set; }

        public bool IsSSL { get; set; }

        public bool IsActive { get; set; }

    }
}
