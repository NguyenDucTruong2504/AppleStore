using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppleStore.Models;

namespace AppleStore.Areas.Private.Controllers
{
    public class ArticleController : Controller
    {
        private static ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
        private static bool daDuyet;
        [HttpGet]

        public ActionResult Index( string IsActive)
        {
            daDuyet = IsActive!=null && IsActive.Equals("1");
            CapNhapDuLieuChoGiaoDien();
            return View();
        }
        [HttpPost]
        public ActionResult Delete(string maBaiViet)
        {
            //--- B1 : Dùng lệnh để xoá bài viết dựa vào mã bài viết-------------
            BaiViet x = db.BaiViets.Find(maBaiViet);
            db.BaiViets.Remove(x);
            //--- B2 : Cập nhập Database ----------------------------------------
            db.SaveChanges();
            //--- B3 : Hiển thị lại danh sách sau khi xoá------------------------
            CapNhapDuLieuChoGiaoDien();
            return View("Index");
        }
        [HttpPost]
        public ActionResult Active(string maBaiViet)
        {
            //--- B1 : Dùng lệnh để xoá bài viết dựa vào mã bài viết-------------
            BaiViet x = db.BaiViets.Find(maBaiViet);
            x.daDuyet = !daDuyet;
            //--- B2 : Cập nhập Database ----------------------------------------
            db.SaveChanges();
            //--- B3 : Hiển thị lại danh sách sau khi xoá------------------------
            CapNhapDuLieuChoGiaoDien();
            return View("Index");
        }
        /// <summary>
        /// hàm phục vụ cho mục tiêu cập nhập dữ liệu cho View của controller này thông qua ViewData
        /// </summary>
        private void CapNhapDuLieuChoGiaoDien()
        {
            List<BaiViet> l = db.BaiViets.Where(x => x.daDuyet == daDuyet).ToList<BaiViet>();
            ViewData["DanhSachBV"] = l;
            ViewBag.tdCuaNut = daDuyet ? " Cấm hiển thị" : "Kiểm duyệt bài";
        }
    }
}
