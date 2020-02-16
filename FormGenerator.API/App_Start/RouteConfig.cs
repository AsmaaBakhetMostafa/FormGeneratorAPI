using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace FormGenerator.API
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
              name: "GetOrderDetailsEmail",
              url: "GetOrderDetails",
              
              defaults: new { controller = "MvcHelper", action = "GetOrderDetails", id = UrlParameter.Optional }
          );
            routes.MapRoute(
              name: "GetWelcomeViewEmail",
              url: "GetWelcomeViewEmail",

              defaults: new { controller = "MvcHelper", action = "GetWelcomeViewEmail", customerId = UrlParameter.Optional }
          );
            routes.MapRoute(
            name: "GetResetPasswordViewEmail",
            url: "GetResetPasswordViewEmail",

            defaults: new { controller = "MvcHelper", action = "GetResetPasswordViewEmail", code = UrlParameter.Optional }
        );
            routes.MapRoute(
          name: "GetChangeEmailView",
          url: "GetChangeEmailView",

          defaults: new { controller = "MvcHelper", action = "GetChangeEmailView", code = UrlParameter.Optional }
      );
            
            routes.MapRoute(
            name: "GetOrderItemViewEmail",
            url: "GetOrderItemViewEmail",

            defaults: new { controller = "MvcHelper", action = "GetOrderItemViewEmail", id = UrlParameter.Optional }
        );
            
            routes.MapRoute(
              name: "GetConfirmationViewEmail",
              url: "GetConfirmationViewEmail",

              defaults: new { controller = "MvcHelper", action = "GetConfirmationViewEmail", customerId = UrlParameter.Optional }
          );
            
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
