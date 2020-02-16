using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Models.Interfaces
{
    public interface ISelectableListItem
    {
        int ID { get; set; }
        string Name { get; set; }
    }
}
