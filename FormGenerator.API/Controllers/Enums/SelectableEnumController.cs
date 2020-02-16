using System;
using System.Web.Mvc;
using FormGenerator.Services.Helpers;
using FormGenerator.ViewModels;
using FormGenerator.Models.Enums;

namespace FormGenerator.API.Controllers.Enums
{
    public class SelectableEnumController : BaseController
    {
        public SelectableEnumController()
        {
        }

        [HttpGet]
        public ResultViewModel GetLanguageList()
        {
            return new ResultViewModel(EnumHelper.ToSelectableList<Language>());
        }
    }
}