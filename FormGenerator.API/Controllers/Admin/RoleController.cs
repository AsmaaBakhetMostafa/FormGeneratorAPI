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

namespace FormGenerator.API.Controllers
{
    public class RoleController : BaseController
    {
        private readonly IRoleService _roleService;

        private IUnitOfWork _unitOfWork;

        public RoleController(IUnitOfWork unitOfWork
            , IRoleService roleService
            )
        {
            _unitOfWork = unitOfWork;
            this._roleService = roleService;
        }
        [HttpGet]
        public ResultViewModel Get(string name = "", string orderBy = "ID", bool isAscending = false, int pageIndex = 1, int pageSize = 25)
        {
            return new ResultViewModel(_roleService.Search(name, orderBy, isAscending, pageIndex, pageSize));
        }
    

     

        [HttpGet]
        public ResultViewModel GetList()
        {
            return new ResultViewModel(_roleService.GetList());
        }
     

        [HttpDelete]
        [ValidateViewModel]
        public ResultViewModel DELETE(int id)
        {
            _roleService.Delete(id);
            _unitOfWork.Save();
            return new ResultViewModel(null, Resource.SuccessfullyDeleted);
            
        }


    }
}