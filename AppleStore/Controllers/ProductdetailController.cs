using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppleStore.Models;

namespace AppleStore.Controllers
{
    public class ProductdetailController : Controller
    {
        // GET: Productdetail
        public ActionResult Index( string maSP)
        {
            ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
            SanPham x = db.SanPhams.Where(z => z.maSP == maSP).First<SanPham>();
            ViewData["SanPhamCanXem"] = x;
            return View();
        }
    }
}