using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FormGenerator.Services;

namespace FormGenerator.API.Controllers
{
   // [Route("home")]
    public class HomeController : Controller
    {

        public HomeController()
        {

        }

        public ActionResult Index()
        {
            //ViewBag.Title = "Home Page";
         return Redirect("/help");
          //  var order = _orderService.GetOrderById(41);
          //  return View(order);
            return View();
        }
        [Route("api/test")]
        public ActionResult Test()
        {
            throw new Exception("Error");
           //return View();
        }
      
    }
}
