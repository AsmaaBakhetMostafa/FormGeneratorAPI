using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Web;
using System.Web.Http.ExceptionHandling;
using System.Web.Http.Results;
using FormGenerator.Data.Factory;
using FormGenerator.Data.UnitofWork;
using FormGenerator.Services;
using FormGenerator.ViewModels;

namespace FormGenerator.API.Helpers
{
    public class GlobalExceptionHandler : ExceptionHandler
    {
       // private readonly IApplicationLogService _applicationLogService;
        private IUnitOfWork _unitOfWork;
        public GlobalExceptionHandler()
        {
            _unitOfWork = new UnitOfWork(new DbContextFactory());
          //  _applicationLogService = new ApplicationLogService(_unitOfWork);
        }
        public override void Handle(ExceptionHandlerContext context)
        {
            var resultViewModel = new ResultViewModel();
            resultViewModel.Message = "Error Occurred";
            //var log = context.Exception.ToString();
            var exception = context.Exception;
            string otherInfo = "";
            if (exception != null)
            {
                while (exception.InnerException != null) exception = exception.InnerException;
                 otherInfo = "Message: " + exception.Message + " StackTrace :" + exception.StackTrace + " Sourcec: " + exception.Source ?? "";
            }
            resultViewModel.Message = otherInfo;
                try
            {
                //ApplicationLogCreateViewModel log = new ApplicationLogCreateViewModel();
                //log.Data = "";
                //log.Description = otherInfo;//context.Exception.InnerException.Message;
                //log.IP = FormGenerator.Services.Helpers.HttpRequestHelper.GetClientIP();
                //log.LogTypeID = 1;
                //log.Title = context.Exception.Message;
                //log.URL = context.Request.RequestUri.AbsoluteUri;
                //_applicationLogService.Insert(log);
                //_unitOfWork.Save();
            }
            catch(Exception ex)
            {
                string mess = ex.Message;
            }
          
            var response = context.Request.CreateResponse(HttpStatusCode.Accepted, resultViewModel);
            context.Result = new ResponseMessageResult(response);
            //context.Result
            
            
           


        }
    }
}