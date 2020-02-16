using FormGenerator.Data.Repository;
using FormGenerator.Data.UnitofWork;
using FormGenerator.Models.User;
using FormGenerator.ViewModels.Enums;
using FormGenerator.ViewModels.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Data.Extentions;
using FormGenerator.Services.Interfaces.User;
using FormGenerator.Repositories;
using FormGenerator.ViewModels;
using FormGenerator.Models.Enums;

namespace FormGenerator.Services.User
{
    public class RoleService :IRoleService
    {
        IUnitOfWork _unitOfWork;
      
        private readonly IRoleRepository _roleRepository;


        public RoleService(IUnitOfWork unitOfWork,
       
            IRoleRepository roleRepository) : base()
        {
            _unitOfWork = unitOfWork;
          
            _roleRepository = roleRepository;

        }

        public PagingViewModel Search(string name, string orderBy = "ID", bool isAscending = false, int pageIndex = 1, int pageSize = 25, Language language=Language.Arabic)
        {
            var query = _roleRepository.GetAll().Where(item => !item.IsDeleted );//&& !item.IsDevelopment

            if (!string.IsNullOrEmpty(name))
                query = query.Where(item =>  item.NameArabic.Contains(name));

            int records = query.Count();
            if (records <= pageSize || pageIndex <= 0) pageIndex = 1;
            int pages = (int)Math.Ceiling((double)records / pageSize);
            int excludedRows = (pageIndex - 1) * pageSize;

            List<RoleViewModel> result = new List<RoleViewModel>();
            var roles = query.Select(item => new RoleViewModel()
            {
                ID = item.ID,
                IsActive=item.IsActive,
                Name = (language == Language.Arabic) ? item.NameArabic : item.NameEnglish,
                RedirectUrl =item.RedirectUrl                
            }).OrderByPropertyName(orderBy, isAscending);

            result = roles.Skip(excludedRows).Take(pageSize).ToList();
            return new PagingViewModel() { PageIndex = pageIndex, PageSize = pageSize, Result = result, Records = records, Pages = pages };
        }

        public RoleViewModel GetById(int id, Language language=Language.Arabic)
        {
            return _roleRepository.GetAll().Where(item => !item.IsDeleted).Select(item => new RoleViewModel()
            {
                ID = item.ID,
                Name = item.NameArabic,
                RedirectUrl = item.RedirectUrl
            }).FirstOrDefault();
        }
        public void ChangeActivationStatus(ActivateViewModel model)
        {
            _roleRepository.ChangeActivationStatus(model.ToModel<Role>());
        }
        public IEnumerable<RoleViewModel> GetList(Language language=Language.Arabic)
        {
            return _roleRepository.GetAll().Where(item => !item.IsDeleted).Select(
                 item => new RoleViewModel()
                 {
                     ID = item.ID,
                     Name =(language==Language.Arabic)?item.NameArabic: item.NameEnglish,
                     RedirectUrl = item.RedirectUrl
                 }
                 );
        }

        public bool IsExists(RoleCreateViewModel viewModel)
        {
            return _roleRepository.GetAll().Where(item => !item.IsDeleted && item.ID != viewModel.ID).Any(dept => dept.NameArabic == viewModel.NameArabic);
        }

        //public void Insert(RoleCreateViewModel viewModel)
        //{
        //    var model = viewModel.ToModel();
        //    Role role= _roleRepository.Insert(model);
        //    foreach(var action in viewModel.Actions)
        //    {
        //         action.RoleID = role.ID;
        //        _roleActionService.Add(action);
        //    }

        //}

        //public void Update(RoleCreateViewModel viewModel)
        //{
        //    var model = viewModel.ToModel();
        //    model.Actions = null;
        //    _roleRepository.SaveExcluded(model, "IsDevelopment");
        //}

        public void Delete(int id)
        {
            _roleRepository.Remove(id);

        }
    }
}
