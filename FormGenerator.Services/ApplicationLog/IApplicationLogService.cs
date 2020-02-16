using Halal.Data.Repository;
using Halal.Models;
using Halal.Models.Enums;
using Halal.ViewModels;
using Halal.ViewModels;
using Halal.ViewModels.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Halal.Services
{
    public interface IApplicationLogService : IRepository<ApplicationLog>
    {
      
        void Insert(ApplicationLogCreateViewModel viewModel);
       
        PagingViewModel Search(string title, string orderBy = "ID", bool isAscending = false, int pageIndex = 1, int pageSize = 20, Language language=Language.Arabic);
        

    }
}
