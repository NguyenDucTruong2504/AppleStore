using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppleStore.Models;
using System.Data.Entity;


namespace AppleStore.Controllers
{
    public class CheckOutController : Controller
    {
        // GET: CheckOut
        [HttpGet]
        public ActionResult Index()
        {
            // ---- Tạo 1 đối tượng khách với thông tin mới truyền ra cho View
            KhachHang x = new KhachHang();
            // ---- Lấy thông tin đã mua hàng từ Session  và truyền cho View thông qua ViewData
            // ---- Lấy giỏ hàng từ session
            CartShop gh = Session["GioHang"] as CartShop;
            // -- Truyền ra View 
            ViewData["Cart"] = gh;
            return View(x);
        }
        [HttpPost]
        public ActionResult SaveToDataBase(KhachHang x)
        {
            // --- Sử dụng transaction để lưu đông thời dữ liệu trên 3 table khác nhau
            using (var context = new ShopOnline_DemoEntities1())
            {
                using (DbContextTransaction trans = context.Database.BeginTransaction())
                {
                    try
                    {
                        // --- 1.1/- New a customer object and add to Khachhang domain    [Table KhachHang]
                        // --- 1.2/- Update customer info to KhachHang object you have just created before
                        x.maKH = x.soDT;
                        // --- 1.3/- Add customer info to Data model--------------------------------------
                        context.KhachHangs.Add(x);
                        // --- 1.4/- Save to Database-------------[Table KhachHang]-----------------------
                        context.SaveChanges();
                        // --- 2.1/- New an Order object and add to Khachhang domain    [Table KhachHang]
                        DonHang d = new DonHang();
                        // --- 2.2/- Update customer info to KhachHang object you have just created before
                        d.soDH = string.Format("{0:yyMMddhhmm}", DateTime.Now);
                        d.maKH = x.maKH;
                        d.ngayGH = DateTime.Now; d.ngayGH = DateTime.Now.AddDays(2);
                        d.taiKhoan = "admin"; d.diaChiGH = x.diaChi;
                        // --- 2.3/- Add customer info to Data model--------------------------------------
                        context.DonHangs.Add(d);
                        // --- 2.4/- Save to Database-------------[Table KhachHang]-----------------------
                        context.SaveChanges();
                        // --- 3.1/- Get list of Items form CartShop    [Table KhachHang]-----------------
                        CartShop gh = Session["GioHang"] as CartShop;
                        // --- 3.2/- Update customer info to KhachHang object you have just created before
                        foreach (CtDonHang i in gh.SanPhamDC.Values)
                        {
                            i.soDH = d.soDH;
                            context.CtDonHangs.Add(i);
                        }
                        // --- 3.3/- Add customer info to Data model--------------------------------------
                        // --- 3.4/- Save to Database-------------[Table KhachHang]-----------------------
                        context.SaveChanges();
                        // --- 4/- Finish and commit all of action above --------------------------------
                        trans.Commit();
                        // ---  Chuyển về trang thông báo đã đặt hàng thành công 
                        return RedirectToAction("Index", "CheckOutSucsess");
                    }
                    catch (Exception e)
                    {
                        trans.Rollback();
                        string s = e.Message;
                    }
                }
            }

            // --- nếu bị lỗi sẽ chuyển trở về CheckOut
            return RedirectToAction("Index", "CheckOut");
        }
    }
}