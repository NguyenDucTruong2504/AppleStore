using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppleStore.Models;

namespace AppleStore.Areas.Private.Controllers
{

    public class NewgoodsController : Controller
    {
        public ActionResult Index()
        {
            List<DonHang> l = new ShopOnline_DemoEntities1().DonHangs.OrderBy(x => x.soDH).ToList<DonHang>();
            ViewData["DsDonHang"] = l;
            return View();

        }
    }
}

//namespace AppleStore.Areas.Private.Controllers
//{
//    public class NewgoodsController : Controller
//    {
//        private static ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
//        private static bool daDuyet;
//        [HttpGet]

//        public ActionResult Index(string IsActive)
//        {
//            daDuyet = IsActive != null && IsActive.Equals("1");
//            CapNhapDuLieuChoGiaoDien();
//            return View();
//        }
//        [HttpPost]
//        public ActionResult Delete(string maDonHang)
//        {
//            //--- B1 : Dùng lệnh để xoá bài viết dựa vào mã bài viết-------------
//            DonHang x = db.DonHangs.Find(maDonHang);
//            db.DonHangs.Remove(x);
//            //--- B2 : Cập nhập Database ----------------------------------------
//            db.SaveChanges();
//            //--- B3 : Hiển thị lại danh sách sau khi xoá------------------------
//            CapNhapDuLieuChoGiaoDien();
//            return View("Index");
//        }
//        [HttpPost]
//        public ActionResult Active(string maDonHang)
//        {
//            //--- B1 : Dùng lệnh để xoá bài viết dựa vào mã bài viết-------------
//            DonHang x = db.DonHangs.Find(maDonHang);
//            x.daKichHoat = !daDuyet;
//            //--- B2 : Cập nhập Database ----------------------------------------
//            db.SaveChanges();
//            //--- B3 : Hiển thị lại danh sách sau khi xoá------------------------
//            CapNhapDuLieuChoGiaoDien();
//            return View("Index");
//        }
//        /// <summary>
//        /// hàm phục vụ cho mục tiêu cập nhập dữ liệu cho View của controller này thông qua ViewData
//        /// </summary>
//        private void CapNhapDuLieuChoGiaoDien()
//        {
//            List<DonHang> l = db.DonHangs.Where(x => x.daKichHoat == daDuyet).ToList<DonHang>();
//            ViewData["DanhSachDH"] = l;
//            ViewBag.tdCuaNut = daDuyet ? " Duyệt Đơn Hàng" : "Xoá Đơn Hàng";
//        }
//    }
//}



