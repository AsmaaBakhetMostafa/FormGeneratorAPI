using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Models.Enums;
using FormGenerator.Models.Interfaces;
using FormGenerator.Models.Shared;
using FormGenerator.ViewModels.Enums;
using FormGenerator.ViewModels;

namespace FormGenerator.Services.Helpers
{
    public static class EnumHelper
    {
        public static List<SelectListItemViewModel> ToSelectableList<T>()
        {
            return
            (from item in Enum.GetValues(typeof(T)).Cast<T>().Select(x => x).ToList()
             select new SelectListItemViewModel
             {
                 ID = Convert.ToInt32(item),
                 Name = DescriptionAnnotation.GetDescription(item, Language.Arabic),
             }).ToList();
        }
    }
}
