using FormGenerator.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Models.Admin.Form;

namespace FormGenerator.ViewModels.Form
{
    public class FormFiledCreateViewModel
    {
        public int ID { get; set; }

        public string NameArabic { get; set; }
        public string NameEnglish { get; set; }
        public bool IsActive { get; set; }
        public int FormStructureID { get; set; }


    }

    public static class FormFiledViewModelExtension
    {
        public static FormFileds ToModel(this FormFiledCreateViewModel viewModel)
        {
            return new FormFileds()
            {
                ID=viewModel.ID,
                NameArabic=viewModel.NameArabic,
                NameEnglish = viewModel.NameEnglish,
                IsActive=viewModel.IsActive,
                FormStructureID= viewModel.FormStructureID
            };
        }
        public static FormFiledCreateViewModel ToCreateViewModel(this FormFileds obj)
        {
            return new FormFiledCreateViewModel()
            {
                ID = obj.ID,
                NameArabic = obj.NameArabic,
                NameEnglish = obj.NameEnglish,
                IsActive=obj.IsActive,
                FormStructureID= obj.FormStructureID

            };
        }

    }

}
