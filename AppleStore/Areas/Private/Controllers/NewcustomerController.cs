using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppleStore.Models;

namespace AppleStore.Areas.Private.Controllers
{
    public class NewcustomerController : Controller
    {
        // GET: Private/Newcustomer
        public ActionResult Index()
        {
            List<KhachHang> l = new ShopOnline_DemoEntities1().KhachHangs.OrderBy(x => x.maKH).ToList<KhachHang>();
            ViewData["Dskhachhang"] = l;
            return View();
        }
      
    }
}