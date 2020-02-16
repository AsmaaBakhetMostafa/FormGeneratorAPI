using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace FormGenerator.Models.User
{
    

    [Table("TokenLog", Schema = "User")]
    public partial class TokenLog : BaseModel
    {
      

        public int TokenID { get; set; }

        [Required]
        [StringLength(250)]
        public string IP { get; set; }

        [Required]
        [StringLength(250)]
        public string URL { get; set; }

        public bool IsAuthorized { get; set; }



        public virtual Token Token { get; set; }
    }
}
