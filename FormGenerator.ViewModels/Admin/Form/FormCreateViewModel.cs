using FormGenerator.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Models.Admin.Form;

namespace FormGenerator.ViewModels.Form
{
    public class FormCreateViewModel
    {
        public int ID { get; set; }

        public string NameArabic { get; set; }
        public string NameEnglish { get; set; }
        public string Decription { get; set; }
        public bool IsActive { get; set; }

    }

    public static class FormViewModelExtension
    {
        public static FormStructure ToModel(this FormCreateViewModel viewModel)
        {
            return new FormStructure()
            {
                ID=viewModel.ID,
                NameArabic=viewModel.NameArabic,
                NameEnglish = viewModel.NameEnglish,
                IsActive=viewModel.IsActive,
                Decription= viewModel.Decription
            };
        }
        public static FormCreateViewModel ToCreateViewModel(this FormStructure obj)
        {
            return new FormCreateViewModel()
            {
                ID = obj.ID,
                NameArabic = obj.NameArabic,
                NameEnglish = obj.NameEnglish,
                Decription = obj.Decription,
                IsActive=obj.IsActive,
               
            };
        }

    }

}
