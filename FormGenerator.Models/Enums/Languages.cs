using FormGenerator.Models.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.Models.Enums
{
    public enum Language
    {
        [DescriptionAnnotation("عربى", "Arabic")]
        Arabic = 0,
        [DescriptionAnnotation("انجليزى", "English")]
        English = 1,
        [DescriptionAnnotation("عربى", "Frensh")]
        Frensh = 2,
        [DescriptionAnnotation("ألمانى", "German")]
        German = 3,
        [DescriptionAnnotation("أسبانى", "Spanish")]
        Spanish = 4,
    }
}
