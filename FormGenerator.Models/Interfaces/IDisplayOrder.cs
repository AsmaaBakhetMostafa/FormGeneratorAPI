using FormGenerator.Models.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Models.Interfaces
{
    public interface IDisplayOrder
    {
        int ID { get; set; }
        int DisplayOrder { get; set; }
    }
}
