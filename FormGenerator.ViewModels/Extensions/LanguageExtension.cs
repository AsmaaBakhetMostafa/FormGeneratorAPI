using FormGenerator.Models.Interfaces;
using FormGenerator.Models.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.ViewModels.Enums;

namespace FormGenerator.ViewModels.Extensions
{
    public static class LanguageExtension
    {
        public static string GetName(this IBilingual obj, Language language)
        {
            string name = string.Empty;

            switch (language)
            {
                case Language.Arabic:
                    name = obj.NameArabic;
                    break;
                case Language.English:
                    name = obj.NameEnglish;
                    break;
                default:
                    break;
            }

            return name;
        }
    }
}
