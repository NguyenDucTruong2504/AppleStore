using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppleStore.Models;

namespace AppleStore.Controllers
{
    public class CheckOutSucsessController : Controller
    {
        // GET: CheckOutSucsess
        public ActionResult Index()
        {
            /// ---- Lấy giỏ hàng từ session ra để hiển thị lần cuối
            CartShop gh = Session["GioHang"] as CartShop;
            ViewData["Cart"] = gh;
            // -- Xoá Giỏ Hàng Trong Session
            Session["GioHang"] = new CartShop();
            return View();
        }
    }
}