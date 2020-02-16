using FormGenerator.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Models.Enums;
using FormGenerator.ViewModels.Enums;

namespace FormGenerator.ViewModels
{
    public class SelectListItemViewModel : ISelectableListItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public bool Selected { get; set; }
    }

    public static class SelectListViewModelExtension
    {
        public static SelectListItemViewModel ToSelectListItemViewModel(this ISelectableListItem obj)
        {
            return new SelectListItemViewModel
            {
                ID = obj.ID,
                Name = obj.Name,
            };
        }

        public static IEnumerable<SelectListItemViewModel> ToSelectListViewModel(this IQueryable<ISelectableListItem> list)
        {
            return list.Select(obj => obj.ToSelectListItemViewModel());
        }

        public static SelectListItemViewModel ToSelectListItemViewModel(this IBilingual obj,Language language=Language.English)
        {
            return new SelectListItemViewModel
            {
                ID = obj.ID,
                Name =(language==Language.English)?obj.NameEnglish:obj.NameArabic,
            };
        }

        public static IEnumerable<SelectListItemViewModel> ToSelectListViewModel(this IQueryable<IBilingual> list, Language language=Language.Arabic)
        {
            return list.Select(obj => obj.ToSelectListItemViewModel(language));
        }

        public static IEnumerable<SelectListItemViewModel> ToSelectListViewModel(this IEnumerable<IBilingual> list, Language language = Language.Arabic)
        {
            return list.Select(obj => obj.ToSelectListItemViewModel(language));
        }
    }
}
