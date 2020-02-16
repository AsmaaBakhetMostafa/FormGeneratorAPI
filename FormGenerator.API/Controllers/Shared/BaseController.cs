
using FormGenerator.Services.Helpers;
using FormGenerator.Models.Enums;
using System.Linq;
using System.Web;
using System.Web.Http;
using FormGenerator.API.Helpers;
using FormGenerator.ViewModels.Enums;
using FormGenerator.Data.Helpers;

namespace FormGenerator.API.Controllers
{
    public class BaseController : ApiController
    {

        public BaseController()
        {
            CultureHelper.CurrentCulture = (int)Language;

        }
        string accessTokenHeaderName = "token";
        public int UserID =>  GetUserId();
        public string AccessToken => GetAccessToken();
        public Language Language => GetLanguageId();
        
        #region Helpers
        private string GetAccessToken()
        {
            string accessToken = "";
            if (Request.IsLocal() && !HttpContext.Current.Request.Headers.AllKeys.Any(header => header == accessTokenHeaderName))
                accessToken = "";
            else if (HttpContext.Current.Request.Headers.AllKeys.Any(header => header == accessTokenHeaderName))
            {
                accessToken = HttpContext.Current.Request.Headers.GetValues(accessTokenHeaderName).First();
               
            }
            return accessToken;

        }
        private int GetUserId()
        {
            string accessToken = "";
            if (!HttpContext.Current.Request.Headers.AllKeys.Any(header => header == accessTokenHeaderName))
                accessToken = "";
             if (HttpContext.Current.Request.Headers.AllKeys.Any(header => header == accessTokenHeaderName))
            {
                accessToken = HttpContext.Current.Request.Headers.GetValues(accessTokenHeaderName).First();
             
            }
            return SecurityHelper.GetUserIDFromToken(accessToken);
            
        }

        private Language GetLanguageId()
        {
            try
            {
                if (HttpContext.Current.Request.Headers.AllKeys.Any(header => header == "language"))
                {
                    if (HttpContext.Current.Request.Headers.GetValues("language").First().ToLower().Trim() == "ar")
                        return Language.Arabic;
                    else
                        return Language.English;
                }
                else
                    return Language.English;

            }
            catch
            {
                return Language.Arabic;
            }

        }

        #endregion

    }
}
