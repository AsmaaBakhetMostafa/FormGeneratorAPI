using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Models;
using FormGenerator.Models.Enums;
using FormGenerator.ViewModels.Enums;

namespace FormGenerator.ViewModels
{
    public class MailAccountCreateViewModel
    {
        public int ID { get; set; }

        [Required(ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "RequiredFieldValidation")]
        [MaxLength(250, ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "MaxLengthValidation")]
        public string Email { get; set; }

        [Required(ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "RequiredFieldValidation")]
        [MaxLength(250, ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "MaxLengthValidation")]
        public string Password { get; set; }
        
        public string SMTP { get; set; }
        public bool IsActive { get; set; } = true;
        public bool IsSSL { get; set; } = false;
        
    }
    public static partial class MailAccountExtension
    {
        public static MailAccount ToModel(this MailAccountCreateViewModel viewModel)
        {
            return new MailAccount()
            {
                ID = viewModel.ID,
                Email=viewModel.Email,
                Password=viewModel.Password,
                IsSSL = viewModel.IsSSL,
                SMTP = viewModel.SMTP,
                IsActive =viewModel.IsActive,
               
            };
        }

        public static MailAccountCreateViewModel ToCreateViewModel(this MailAccount obj, Language language = Language.Arabic)
        {
            return new MailAccountCreateViewModel()
            {
                ID = obj.ID,
                Email = obj.Email,
                Password = obj.Password,
                IsSSL = obj.IsSSL,
                SMTP = obj.SMTP,
                IsActive = obj.IsActive,
            };
        }
    }
}
