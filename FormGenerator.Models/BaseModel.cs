using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Models
{
    public class BaseModel
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public virtual int ID { get; set; }

        public DateTime CreatedDate { get; set; } = DateTime.Now;


        public int CreatedBy { get; set; } = 1;
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public bool IsDeleted { get; set; } = false;
    }
}
