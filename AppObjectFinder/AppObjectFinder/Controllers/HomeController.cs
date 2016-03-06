using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppObjectFinder.Controllers
{
    public class HomeController:Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Breve Descripción de la propuesta de investigación.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Para mayor información consulte:";

            return View();
        }
    }
}