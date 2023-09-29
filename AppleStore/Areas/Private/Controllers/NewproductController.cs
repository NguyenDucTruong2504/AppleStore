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
    public class NewproductController : Controller
    {
        public void DangSanPham()
        {
            List<SanPham> sp = new ShopOnline_DemoEntities1().SanPhams.OrderBy(x => x.tenSP).ToList<SanPham>();
            ViewData["DangSanPham"] = sp;
        }
        [HttpGet]
        // GET: PrivatePages/DangSanPham
        public ActionResult Index()
        {

            //------khai bao
            SanPham o = new SanPham();
            ShopOnline_DemoEntities1 sh = new ShopOnline_DemoEntities1();
            //-- mac dinh cho 1 so cai
            o.daDuyet = false;
            o.ngayDang = DateTime.Now;
            o.dvt = "Chiếc";
            o.nhaSanXuat = "";
            o.giamGia = 0;
            o.giaBan = 0;
            o.maLoai = 0;

            //--lay tai khoan tu TtDangNhap
            o.taiKhoan = ThuongDung.GetTenTaiKhoan();
            //---đưa đường dẫn của hình qua bên ngoài view
            ViewBag.spHinh = "../../../..//Asset/Images/SanPham/iPhone/ipsx.jpg";
            //---------
            DangSanPham();
            return View(o);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(SanPham o, HttpPostedFileBase hhinhSanPham)
        {
            try
            {
                ShopOnline_DemoEntities1 sh = new ShopOnline_DemoEntities1();
                o.daDuyet = false;
                o.ngayDang = DateTime.Now;
                o.dvt = "Chiếc";
                o.nhaSanXuat = "";
                o.giamGia = 0;
                o.giaBan = 0;
                o.maLoai = 0;
                o.taiKhoan = ThuongDung.GetTenTaiKhoan();
                o.maSP = string.Format("{0:ddMMyyhhmm}", DateTime.Now);
                if (hhinhSanPham != null)
                {
                    //----lưu hình vào thư mục bài viết UwU
                    string virPath = "~/Asset/Images/SanPham/"; //-- đường dẫn ảo đi đến thư mục bài viết chứa ảnh
                    string phyPath = Server.MapPath("~/" + virPath); //- Sever.MapPath chỉ ổ đĩa sever tự chọn + đường dẫn vật lí
                    string moRong = Path.GetExtension(hhinhSanPham.FileName); //- phần đuôi của hình (.jpg) or (.png).v.v......
                    string fileName = "hSP" + o.maSP + moRong;
                    //---------lưu dựa vào đường dẫn----------------
                    hhinhSanPham.SaveAs(phyPath + fileName); //--lưu dựa vào đường dẫn vật lí sever chứa web
                                                             //--nhận đường dẫn truy cập tới hình đã lưu dữ dựa vào domain
                    o.hinhDD = virPath + fileName; //-đường dẫn ảo theo domain
                                                   //---cập nhật hình vừa đăng lên giao diện
                    ViewBag.spHinh = o.hinhDD;
                }
                else { o.hinhDD = ""; }
                //-------thêm dữ liệu 
                sh.SanPhams.Add(o);
                //---lưu dữ liệu vừa thêm vào dataabase
                sh.SaveChanges();
                //--- nếu đăng bài thành công thì chuyển đến trang duyệt bài 
                return View(o);
            }
            catch
            {
                //---nếu không đăng thì 
                return View(o);
            }
        }
    }
}

