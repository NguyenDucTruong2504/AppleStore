using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using AppleStore.Models;

namespace AppleStore.Controllers
{
    public class LoginController : Controller
    {
        // GET: Private/Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult index(string Acc, string Pass)
        {
            try
            {
                // -- Đọc thông tin tài khoản từ Database ---

                TaiKhoan ttdn = new ShopOnline_DemoEntities1()
                        .TaiKhoans.Where(x => x.taiKhoan1.Equals(Acc.ToLower()
                        .Trim()) && x.matKhau.Equals(Pass))
                        .First<TaiKhoan>();
                // --- Lấy thông tin từ Database và đăng nhập vào ---

                bool isAuthentic = ttdn != null && ttdn.taiKhoan1.Equals(Acc.ToLower().Trim()) && ttdn.matKhau.Equals(Pass);
                if (isAuthentic)
                {
                    Session["TtDangNhap"] = ttdn;
                    return RedirectToAction("Index", "Dashboard", new { Area = "Private" });
                }
            }
            catch
            {
                ///---Nếu có 1 trang báo lỗi thì chỗ này ReDirect đến trang báo lỗi
            }

            return View();

        }


    }
}