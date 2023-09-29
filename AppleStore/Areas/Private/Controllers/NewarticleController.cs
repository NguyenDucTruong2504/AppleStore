using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using AppleStore.Models;
using AppleStore.Areas.Private.Models;
using System.IO;


namespace AppleStore.Areas.Private.Controllers
{
    public class NewarticleController : Controller
    {
        public void DangBaiViet()
        {
            List<BaiViet> bv = new ShopOnline_DemoEntities1().BaiViets.OrderBy(x => x.tenBV).ToList<BaiViet>();
            ViewData["DangBaiViet"] = bv;
        }
        [HttpGet]
        // GET: PrivatePages/DangBaiViet
        public ActionResult Index()
        {

            //------khai bao
            BaiViet e = new BaiViet();
            ShopOnline_DemoEntities1 sh = new ShopOnline_DemoEntities1();
            //-- mac dinh cho 1 so cai
            e.daDuyet = false;
            e.ngayDang = DateTime.Now;
            e.soLanDoc = 0;
            //--lay tai khoan tu TtDangNhap
            e.taiKhoan = ThuongDung.GetTenTaiKhoan();
            e.loaiTin = "QC";
            //---đưa đường dẫn của hình qua bên ngoài view
            ViewBag.htHinh = "/Materials/images/a11.jpg";
            //---------
            DangBaiViet();
            return View(e);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(BaiViet e, HttpPostedFileBase hinhBaiViet)
        {
            try
            {
                ShopOnline_DemoEntities1 sh = new ShopOnline_DemoEntities1();
                e.daDuyet = false;
                e.ngayDang = DateTime.Now;
                e.taiKhoan = ThuongDung.GetTenTaiKhoan();
                e.soLanDoc = 0;
                e.loaiTin = "QC";
                e.maBV = string.Format("{0:ddMMyyhhmm}", DateTime.Now);
                if (hinhBaiViet != null)
                {
                    //----lưu hình vào thư mục bài viết UwU
                    string virPath = "~/Materials/images/"; //-- đường dẫn ảo đi đến thư mục bài viết chứa ảnh
                    string phyPath = Server.MapPath("~/" + virPath); //- Sever.MapPath chỉ ổ đĩa sever tự chọn + đường dẫn vật lí
                    string moRong = Path.GetExtension(hinhBaiViet.FileName); //- phần đuôi của hình (.jpg) or (.png).v.v......
                    string fileName = "hBV" + e.maBV + moRong;
                    //---------lưu dựa vào đường dẫn----------------
                    hinhBaiViet.SaveAs(phyPath + fileName); //--lưu dựa vào đường dẫn vật lí sever chứa web
                                                            //--nhận đường dẫn truy cập tới hình đã lưu dữ dựa vào domain
                    e.hinhDD = virPath + fileName; //-đường dẫn ảo theo domain
                                                   //---cập nhật hình vừa đăng lên giao diện
                    ViewBag.htHinh = e.hinhDD;
                }
                else { e.hinhDD = ""; }
                //-------thêm dữ liệu 
                sh.BaiViets.Add(e);
                //---lưu dữ liệu vừa thêm vào dataabase
                sh.SaveChanges();
                //--- nếu đăng bài thành công thì chuyển đến trang duyệt bài 
                return RedirectToAction("Index", "Article");
            }
            catch
            {
                //---nếu không đăng thì 
                return View(e);
            }
        }
    }

}
