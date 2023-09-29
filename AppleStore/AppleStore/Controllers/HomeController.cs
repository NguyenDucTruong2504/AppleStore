using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppleStore.Models;

namespace AppleStore.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            string testMK = MaHoa.encryptSHA256("abc");
            return View();
        }

    }
}