using FormGenerator.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Models.Admin.Form;

namespace FormGenerator.ViewModels.Form
{
    public class FiledOptionCreateViewModel
    {
        public int ID { get; set; }

        public string NameArabic { get; set; }
        public string NameEnglish { get; set; }
        public bool IsActive { get; set; }

    }

    public static class FiledOptionViewModelExtension
    {
        public static FiledOption ToModel(this FiledOptionCreateViewModel viewModel)
        {
            return new FiledOption()
            {
                ID=viewModel.ID,
                NameArabic=viewModel.NameArabic,
                NameEnglish = viewModel.NameEnglish,
                IsActive=viewModel.IsActive,
            };
        }
        public static FiledOptionCreateViewModel ToCreateViewModel(this FiledOption obj)
        {
            return new FiledOptionCreateViewModel()
            {
                ID = obj.ID,
                NameArabic = obj.NameArabic,
                NameEnglish = obj.NameEnglish,
                IsActive=obj.IsActive,
               
            };
        }

    }

}
