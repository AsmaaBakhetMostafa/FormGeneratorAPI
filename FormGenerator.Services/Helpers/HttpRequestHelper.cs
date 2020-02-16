using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.ServiceModel.Channels;
using System.Text;
using System.Threading.Tasks;


namespace FormGenerator.Services.Helpers
{
    public static class HttpRequestHelper
    {
        public static bool IsLocal(this HttpRequestMessage request)
        {
            try
            {
                var isLocal = request.Properties["MS_IsLocal"] as Lazy<bool>;
                return isLocal != null && isLocal.Value;
            }
            catch
            {
                return false;
            }

        }
        public static string GetAddress() {
            var request = HttpContext.Current.Request;
            var address = string.Format("{0}://{1}", request.Url.Scheme, request.Url.Authority);
            return address;
        }
        public static string GetClientIP(this HttpRequestMessage request)
        {
            try
            {
                if (request.Properties.ContainsKey("MS_HttpContext"))
                {
                    return ((HttpContextWrapper)request.Properties["MS_HttpContext"]).Request.UserHostAddress;
                }

                if (request.Properties.ContainsKey(RemoteEndpointMessageProperty.Name))
                {
                    RemoteEndpointMessageProperty prop;
                    prop = (RemoteEndpointMessageProperty)request.Properties[RemoteEndpointMessageProperty.Name];
                    return prop.Address;
                }
            }
            catch
            {

            }


            return null;
        }
        public static string GetClientIP()
        {
            try
            {
                System.Web.HttpRequest request = System.Web.HttpContext.Current.Request;
                string ipAddress = request.ServerVariables["HTTP_X_FORWARDED_FOR"];

                if (!string.IsNullOrEmpty(ipAddress))
                {
                    string[] addresses = ipAddress.Split(',');
                    if (addresses.Length != 0)
                    {
                        return addresses[0];
                    }
                }

                return request.ServerVariables["REMOTE_ADDR"];
            }
            catch
            {
                return "";
            }

        }
        public static string GetUserAgent()
        {
            return HttpContext.Current.Request.UserAgent;
        }
        public static string GetCurrentURL()
        {
            try
            {
                System.Web.HttpRequest request = System.Web.HttpContext.Current.Request;
                return request.Url.AbsoluteUri.ToString();
            }
            catch
            {
                return "";
            }

        }
    }
}
