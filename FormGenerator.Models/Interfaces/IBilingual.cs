using FormGenerator.Models.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Models.Interfaces
{
    public interface IBilingual
    {
        int ID { get; set; }
        string NameArabic { get; set; }
        string NameEnglish { get; set; }
    }
}
