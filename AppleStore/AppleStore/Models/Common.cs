using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AppleStore.Models
{
    public class Common
    {
        /// <summary>
        /// Hàm lấy danh sách tất cả các sản phẩm thuộc một loại nào đó
        /// </summary>
        /// <returns></returns>
        public static List<SanPham> getProducts()
        {
            List<SanPham> l = new List<SanPham>();
            // --- Khai báo 1 đối tượng đại diện cho Database
            DbContext cn = new DbContext("name= ShopOnline_DemoEntities1");
            //---- Lấy dữ liệu...
            l = cn.Set<SanPham>().ToList<SanPham>();
            return l;
        }
        public static List<SanPham> getProductsByLoaiSP(int maLoai)
        {
            List<SanPham> l = new List<SanPham>();
            // Khai báo 1 đối tượng đại diện cho Database
            DbContext cn = new DbContext("name= ShopOnline_DemoEntities1");
            // Lấy dữ liệu...
            l = cn.Set<SanPham>().Where(x => x.maLoai == maLoai).OrderByDescending(z => z.ngayDang).ToList<SanPham>();
            return l;
        }
        /// <summary>
        /// Hàm cho lấy ra danh sách các chủng loại hàng hoá
        /// </summary>
        /// <returns></returns>
        public static List<LoaiSP> getCategories()
        {
            return new DbContext("name= ShopOnline_DemoEntities1").Set<LoaiSP>().ToList<LoaiSP>();
        }
        /// <summary>
        /// Lấy ra n bài viết mới nhất từ Database
        /// </summary>
        /// <param name="n"></param>
        /// <returns></returns>
        public static List<BaiViet> getArticles(int n)
        {
            List<BaiViet> l = new List<BaiViet>();
            ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
            l = db.BaiViets.Where(m => m.daDuyet==true).OrderByDescending(bv => bv.ngayDang).Take(n).ToList<BaiViet>();
            return l;
        }
        public static List<TaiKhoan> getAccount()
        {
            List<TaiKhoan> l = new List<TaiKhoan>();
            DbContext cn = new DbContext("name =  ShopOnline_DemoEntities1");
            //--- Láy dữ liệu....
            l = cn.Set<TaiKhoan>().ToList<TaiKhoan>();
            return l;
        }    
        /// <summary>
        /// Phương thức cho phép lấy thông tin của 1 loại sản phẩm dựa vào mã  của sản phẩm đó
        /// </summary>
        /// <param name="maSP">Mã Sản phẩm</param>
        /// <returns>Đối tượng sản phẩm lấy được từ data model</returns>
        public static SanPham getProductsById(string maSP)
        {
            DbContext cn = new DbContext("name= ShopOnline_DemoEntities1");
            return cn.Set<SanPham>().Find(maSP);
        }
        /// <summary>
        /// Lấy tên của SP 
        /// </summary>
        /// <param name="maSP"></param>
        /// <returns></returns>
        public static string GetNameOfProductsById(string maSP)
        {
            DbContext cn = new DbContext("name= ShopOnline_DemoEntities1");
            return cn.Set<SanPham>().Find(maSP).tenSP;

        }
        /// <summary>
        /// Lấy đường dẫn hình đại diện dựa vào mã SP
        /// </summary>
        /// <param name="maSP"></param>
        /// <returns></returns>
        public static string GetImageOfProductsById(string maSP)
        {
            DbContext cn = new DbContext("name= ShopOnline_DemoEntities1");
            return cn.Set<SanPham>().Find(maSP).hinhDD;

        }
        public static List<KhachHang> GetKhachHang()
        {
            List<KhachHang> l = new List<KhachHang>();
            DbContext cn = new DbContext("name =  ShopOnline_DemoEntities1");
            //--- Láy dữ liệu....
            l = cn.Set<KhachHang>().ToList<KhachHang>();
            return l;
        }

    }
}
