using FormGenerator.Data.Repository;
using FormGenerator.Data.UnitofWork;
using FormGenerator.ViewModels.UserViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using FormGenerator.Data.Extentions;
using FormGenerator.Services.Helpers;
using FormGenerator.Services.Interfaces.User;
using FormGenerator.ViewModels.Enums;
using FormGenerator.Models.Enums;
using FormGenerator.Repositories;
using FormGenerator.ViewModels;
using FormGenerator.Data.Helpers;
using FormGenerator.Models.User;
using FormGenerator.Models.Admin.Form;
using FormGenerator.Services.Interfaces.Form;

namespace FormGenerator.Services.Form
{
    public class FormStructureService : Repository<FormStructure>, IFormStructureService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IFormStructureRepository _formStructureRepository;


        public FormStructureService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
       
    }
}
