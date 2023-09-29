using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppleStore.Areas.Private.Controllers
{
    public class CategoriesController : Controller
    {
        // GET: Private/Categories
        public ActionResult Index()
        {
            return View();
        }
    }
}