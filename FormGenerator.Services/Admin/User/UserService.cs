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

namespace FormGenerator.Services.User
{
    public class UserService : Repository<FormGenerator.Models.User.User>, IUserService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUserRepository _userRepository;
        private readonly IUserRoleService _userRoleService;


        public UserService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public UserService(IUnitOfWork unitOfWork,  IUserRoleService userRoleService, IUserRepository userRepository) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _userRepository = userRepository;
            _userRoleService = userRoleService;
        }
        
       
    }
}
