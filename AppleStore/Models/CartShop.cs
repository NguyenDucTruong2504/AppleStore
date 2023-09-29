using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppleStore.Models
{
    public class CartShop
    {
        public string MaKH { get; set; }
        public string TaiKhoan { get; set; }
        public DateTime NgayDat { get; set; }
        public DateTime NgayGiao { get; set; }
        public string DiaChi { get; set; }
        public SortedList<string, CtDonHang> SanPhamDC { get; set; }
        /// <summary>
        /// Defaut Constructor
        /// </summary>
        public CartShop()
        {
            this.MaKH = ""; this.TaiKhoan = ""; this.NgayDat = DateTime.Now;
            this.NgayGiao = DateTime.Now.AddDays(2);this.DiaChi = ""; 
            this.SanPhamDC = new SortedList<string,CtDonHang>();
        }
        /// <summary>
        /// Phương thức trả về true nếu không có sản phẩm nà đã chọn mua trong hệ thống
        /// </summary>
        /// <returns></returns>
        public bool IsEmpty()
        {
            return SanPhamDC.Keys.Count == 0;
        }
        /// <summary>
        /// Phương thức thêm 1 sản phẩm đã chọn mua vào giỏ hàng
        /// Có 2 tình huống ....
        /// </summary>
        /// <param name="MaSP"></param>
        public void addItem(string maSP)
        {
            if (SanPhamDC.Keys.Contains(maSP))
            {
                // ---  Chọn đến sản phẩm cần thay đổi số lượng mua có trong giỏ hàng
                CtDonHang x = SanPhamDC.Values[SanPhamDC.IndexOfKey(maSP)];
                // --- Tăng số lượng lên 1
                x.soLuong++;
               

            }  
            else
            {
                // --- Tạo 1  object chi tiết đơn hàng mới
                CtDonHang i = new CtDonHang();
                // ---  Cập nhập thông tin hiện hành từ hệ thống cho đối tượng đó
                i.maSP = maSP;
                i.soLuong = 1;
                // --- Lấy giá bán ; giảm giá từ Data Sản Phẩm
                SanPham z = Common.getProductsById(maSP);
                i.giaBan = z.giaBan;
                i.giamGia = z.giamGia;
                // --- Bỏ vào danh sách các sản phẩm đã chọn  mua trong giỏ hàng của mình
                SanPhamDC.Add(maSP, i);

            }    
        }
        
        /// <summary>
        /// Xoá 1 sản phẩm trong giỏ hàng
        /// </summary>
        /// <param name="maSP"></param>
        public void deleteItem(string masp)
        {
            if(SanPhamDC.Keys.Contains(masp))
                SanPhamDC.Remove(masp);
   
        }
        /// <summary>
        /// Cho phép giảm số lượng hoặc xoá sản phẩm khỏi danh sách của giỏ hàng
        /// </summary>
        /// <param name="masp"></param>
        public void decrease(string masp)
        {
            if (SanPhamDC.Keys.Contains(masp))
            {
                //--- Trỏ đến sản phẩm cần thay đổi số lượng mua trong giỏ hàng
                CtDonHang x = SanPhamDC.Values[SanPhamDC.IndexOfKey(masp)];
                if (x.soLuong > 1)
                    x.soLuong--;
                else
                    deleteItem(masp);
            }  
        }
        /// <summary>
        /// Tính giá trị của 1 mặt hàng trong giỏ hàng
        /// </summary>
        /// <param name="x"></param>
        /// <returns></returns>
        public long moneyOfOneProduct(CtDonHang x)
        {
            return (long)(x.giaBan * x.soLuong - (x.giaBan * x.soLuong * x.giamGia));
        }
        /// <summary>
        /// Tính tổng thành tiền cho toàn bộ giỏ hàng
        /// </summary>
        /// <returns></returns>
        public long totalOfCartShop()
        {
            long kq = 0;
            foreach (CtDonHang i in SanPhamDC.Values)
                kq += moneyOfOneProduct(i); 
            return kq;
        }
    }
}