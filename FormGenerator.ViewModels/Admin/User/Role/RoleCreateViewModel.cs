using FormGenerator.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FormGenerator.ViewModels.User
{
    public class RoleCreateViewModel
    {
        public int ID { get; set; }
        public string NameArabic { get; set; }
        public string NameEnglish { get; set; }
        public string RedirectUrl { get; set; } = "s";
        public bool IsActive { get; set; }


    }

    public static class RoleViewModelExtension
    {
        public static Role ToModel(this RoleCreateViewModel viewModel)
        {
            return new Role()
            {
                ID=viewModel.ID,
                NameArabic=viewModel.NameArabic,
                NameEnglish = viewModel.NameEnglish,
                RedirectUrl =viewModel.RedirectUrl,
                IsActive=viewModel.IsActive,
                
            };
        }
        public static RoleCreateViewModel ToCreateViewModel(this Role obj)
        {
            return new RoleCreateViewModel()
            {
                ID = obj.ID,
                NameArabic = obj.NameArabic,
                NameEnglish = obj.NameEnglish,
                RedirectUrl = obj.RedirectUrl,
                IsActive=obj.IsActive,
               
            };
        }

    }

}
