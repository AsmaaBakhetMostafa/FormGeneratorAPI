using FormGenerator.Data.Factory;
using FormGenerator.Data.UnitofWork;
using FormGenerator.Services.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Controllers;
using FormGenerator.Services.User;

using FormGenerator.Services.Interfaces.User;

using FormGenerator.Data.Helpers;
using FormGenerator.ViewModels;

namespace FormGenerator.API.Filters
{
    public class AuthorizeFilter : System.Web.Http.Filters.ActionFilterAttribute
    {
        private readonly IUserService _userService;
        private IUnitOfWork _unitOfWork;
        private readonly ITokenService _tokenService;
        private object[] _roles;
        //public string Role { get; set; }
        //public Cashier Cashier { get; set; }

        //AuthorizeUserFilter(IUnitOfWork unitOfWork, IUserService userService, ITokenService tokenService)
        //{
        //    _unitOfWork = unitOfWork;
        //    _userService = userService;
        //    _tokenService = tokenService;
        //}
        public AuthorizeFilter(params object[] roles)
        {
            _roles = roles;
            _unitOfWork = new UnitOfWork(new DbContextFactory());
            _userService = new UserService(_unitOfWork);
            _tokenService = new TokenService(_unitOfWork);
        }
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            base.OnActionExecuting(actionContext);
            return;

            string iP = HttpContext.Current.Request.UserHostAddress.ToLower();
            bool allowLocal = false;
            if (!HttpContext.Current.Request.IsLocal || !allowLocal)
            {
                bool isAuthorized = false;
                try
                {
                    string accessTokenHeaderName = "token";
                    if (actionContext.Request.Headers.Any(header => header.Key == accessTokenHeaderName))
                    {
                        string accessToken = actionContext.Request.Headers.GetValues(accessTokenHeaderName).FirstOrDefault();
                        if (!SecurityHelper.IsTokenExpired(accessToken))
                        {
                            int userID = SecurityHelper.GetUserIDFromToken(accessToken);
                          
                        }
                    }



                }
                catch (Exception ex)
                {

                }


                if (!isAuthorized)
                {
                    var resultViewModel = new ResultViewModel();
                    resultViewModel.Success = false;
                    resultViewModel.Message = "Unauthorized";
                    resultViewModel.Authorized = false;
                    actionContext.Response = actionContext.Request.CreateResponse(
                                                                        HttpStatusCode.Unauthorized,
                                                                        resultViewModel,
                                                                        actionContext.ControllerContext.Configuration.Formatters.JsonFormatter);
                    //throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.Unauthorized));
                }
            }

            base.OnActionExecuting(actionContext);
        }
        }
}