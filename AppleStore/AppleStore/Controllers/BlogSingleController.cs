using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppleStore.Models;

namespace AppleStore.Controllers
{
    public class BlogSingleController : Controller
    {
        // GET: BlogSingle
        public ActionResult Index(string maBV)
        {
            ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
            BaiViet g = db.BaiViets.Where(b => b.maBV == maBV).First<BaiViet>();
            ViewData["BaiVietCanXem"] = g;
            return View();
        }
    }
}