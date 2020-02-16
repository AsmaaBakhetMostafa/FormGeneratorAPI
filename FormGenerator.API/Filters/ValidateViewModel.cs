
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using FormGenerator.ViewModels;

namespace FormGenerator.API.Filters
{
    public class ValidateViewModelAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            if (!actionContext.ModelState.IsValid)
            {
                var resultViewModel = new ResultViewModel();
                resultViewModel.Success = false;
                resultViewModel.Message = string.Join("; ", actionContext.ModelState.Values
                                                                                       .SelectMany(modelState => modelState.Errors)
                                                                                       .Select(error => error.ErrorMessage));
                actionContext.Response = actionContext.Request.CreateResponse(
                                                                    HttpStatusCode.BadRequest,
                                                                    resultViewModel,
                                                                    actionContext.ControllerContext.Configuration.Formatters.JsonFormatter);

            }
        }
    }
}