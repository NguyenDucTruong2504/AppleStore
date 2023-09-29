using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppleStore.Models;
namespace AppleStore.Controllers
{
    public class StoreController : Controller
    {
        // GET: Store
        public ActionResult Index()
        {
            return View();

        }
        public ActionResult AddToCart(string maSP)
        {
            //--- Lấy giỏ hàng từ Sesstion ra
            CartShop gh = Session["GioHang"] as CartShop;
            // --- Thêm sản phẩm vừa chọn mua  vào giỏ hàng
            gh.addItem(maSP);
            //-- Cập nhập lại giỏ hàng vào trong Session
            Session["GioHang"] = gh;
            return View("Index");
        }
    }
}