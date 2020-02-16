using FormGenerator.API.Filters;
using FormGenerator.Data.UnitofWork;
using FormGenerator.Localization.Shared;
using FormGenerator.Localization.User;
using FormGenerator.Services.Helpers;
using FormGenerator.Services.Interfaces.User;

using FormGenerator.ViewModels.UserViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using FormGenerator.ViewModels;
using FormGenerator.Data.Helpers;

namespace FormGenerator.API.Controllers.User
{
    public class UserController : BaseController
    {
       
        private readonly IUserService _userService;
        private IUnitOfWork _unitOfWork;
        private readonly ITokenService _tokenService;
        private readonly IUserRoleService _userRoleService;
        

        public UserController(IUnitOfWork unitOfWork, IUserRoleService userRoleService, IUserService userService, ITokenService tokenService)
        {
            _unitOfWork = unitOfWork;
            _userService = userService;
            _userRoleService = userRoleService;
            _tokenService = tokenService;
        }
      
        

    }
}
