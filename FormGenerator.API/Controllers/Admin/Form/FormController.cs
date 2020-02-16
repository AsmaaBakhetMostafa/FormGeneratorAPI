using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FormGenerator.API.Filters;
using FormGenerator.Data.UnitofWork;
using FormGenerator.Localization.Shared;
using FormGenerator.Models.Enums;
using FormGenerator.Services;
using FormGenerator.Services.Interfaces.User;
using FormGenerator.ViewModels;
using FormGenerator.ViewModels.User;
using FormGenerator.Models.Admin.Form;
using FormGenerator.Services.Interfaces.Form;

namespace FormGenerator.API.Controllers
{
    public class FormController : BaseController
    {
        private readonly IFormStructureService _formStructureService;

        private IUnitOfWork _unitOfWork;

        public FormController(IUnitOfWork unitOfWork
            , IFormStructureService formStructureService
            )
        {
            _unitOfWork = unitOfWork;
            this._formStructureService = formStructureService;
        }
     
        


    }//end class
}//end namespace