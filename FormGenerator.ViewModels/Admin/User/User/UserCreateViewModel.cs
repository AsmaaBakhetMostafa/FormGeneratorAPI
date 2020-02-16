
using FormGenerator.Models.User;

using System.ComponentModel.DataAnnotations;
using System.Collections;
using FormGenerator.ViewModels.User;
using System.Collections.Generic;

namespace FormGenerator.ViewModels.UserViewModels
{
    public class UserCreateViewModel
    {
        public int ID { get; set; }

        [Required(ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "RequiredFieldValidation")]
        [MaxLength(250, ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "MaxLengthValidation")]
        public string Name { get; set; }

        [Required(ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "RequiredFieldValidation")]
        [MaxLength(250, ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "MaxLengthValidation")]
        public string Email { get; set; }

        [Required(ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "RequiredFieldValidation")]
        [MaxLength(250, ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "MaxLengthValidation")]
        public string Password { get; set; }

        [Required(ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "RequiredFieldValidation")]
        [MaxLength(250, ErrorMessageResourceType = typeof(Localization.Shared.Resource), ErrorMessageResourceName = "MaxLengthValidation")]
        public string Mobile { get; set; }
        
        public ICollection<UserRoleViewModel> Roles { get; set; }

    }

    public static partial class UserExtension
    {
        public static Models.User.User ToModel(this UserCreateViewModel viewModel)
        {
            return new Models.User.User()
            {
                ID = viewModel.ID,
                Email=viewModel.Email,
                Mobile = viewModel.Mobile,
                Password = viewModel.Password,
                Name=viewModel.Name,
                Roles=viewModel.Roles.ToModel(),
                CreatedBy=1
            };
        }

        public static UserCreateViewModel ToCreateViewModel(this Models.User.User viewModel)
        {
            return new UserCreateViewModel()
            {
                ID = viewModel.ID,
                Mobile = viewModel.Mobile,
                Email=viewModel.Email,
                Name=viewModel.Name,
                Password="",
                //Roles=viewModel.Roles
            };
        }
    }
}