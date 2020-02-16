using FormGenerator.Data.Factory;
using FormGenerator.Data.UnitofWork;
using FormGenerator.ViewModels.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FormGenerator.Services.Helpers;
using FormGenerator.ViewModels;

namespace FormGenerator.Services.Helpers
{
    public class LogHelper
    {
        
        public static void AddLog(int userID, ApplicationLogType logType, string title="",string description="", string data="")
        {
            try
            {
                //IUnitOfWork _unitOfWork = new UnitOfWork(new DbContextFactory());
                //IApplicationLogService _applicationLogService = new ApplicationLogService(_unitOfWork);
                //_applicationLogService.UserID = userID;
                //ApplicationLogCreateViewModel log = new ApplicationLogCreateViewModel() { Data = data, Description = description, IP = HttpRequestHelper.GetClientIP(), LogTypeID = (int)logType, Title = title, URL = HttpRequestHelper.GetCurrentURL() };
                //_applicationLogService.Insert(log);
                //_unitOfWork.Save();
            }
            catch
            {

            }
            
        }
    }
}
