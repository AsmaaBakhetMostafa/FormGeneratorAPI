using Halal.Data.Repository;
using Halal.Data.UnitofWork;

using Halal.Models.Enums;
using Halal.ViewModels;
using Halal.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using Halal.Data.Extentions;
using Halal.Models;
using Halal.Services;
using Halal.ViewModels;
using Halal.ViewModels.Enums;

namespace Halal.Services
{
    public class ApplicationLogService : Repository<ApplicationLog>, IApplicationLogService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ApplicationLogService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
       
        
        public void Insert(ApplicationLogCreateViewModel viewModel)
        {
            Add(viewModel.ToModel());
        }
       
       

       
        public  void AddLog(int userID, int logType, string title, Exception exception, string data)
        {
             ApplicationLog log = new ApplicationLog() { CreatedBy = userID, CreatedDate = DateTime.Now, Data = data, Description = (exception != null) ? exception.Message : "", IP = "d", LogTypeID = logType, Title = title, URL = "aa" };

        }

        public PagingViewModel Search(string title, string orderBy = "ID", bool isAscending = false, int pageIndex = 1, int pageSize = 20, Language language = Language.Arabic)
        {
            throw new NotImplementedException();
        }
    }
}
