using FormGenerator.Data.Repository;
using FormGenerator.Models.User;
using FormGenerator.ViewModels.Enums;
using FormGenerator.ViewModels.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.ViewModels;
using FormGenerator.Models.Enums;

namespace FormGenerator.Services.Interfaces.User
{
    public interface IRoleService 
    {
        PagingViewModel Search(string name, string orderBy = "ID", bool isAscending = false, int pageIndex = 1, int pageSize = 25, Language language=Language.Arabic);
     
        IEnumerable<RoleViewModel> GetList(Language language=Language.Arabic);
        bool IsExists(RoleCreateViewModel viewModel);
       
        void Delete(int id);
      
    }
}
