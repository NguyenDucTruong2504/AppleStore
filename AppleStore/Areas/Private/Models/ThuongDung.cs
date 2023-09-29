using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AppleStore.Models;

namespace AppleStore.Areas.Private.Models
{
    public class ThuongDung
    {
        /// <summary>
        /// Phương thức cho phép đọc thông tin cuả tài khoản đã nhập từ Session
        /// </summary>
        /// <returns></returns>
        public static TaiKhoan GetTaiKhoanHH()
        {
            TaiKhoan kq = new TaiKhoan();
            kq = HttpContext.Current.Session["TtDangNhap"] as TaiKhoan;

            return kq;
        }
        /// <summary>
        ///  Lấy tên của Tài khoản đã đăng nhập trong hệ thống 
        /// </summary>
        /// <returns></returns>
        public static string GetTenTaiKhoan()
        {
            return GetTaiKhoanHH().taiKhoan1;
        }
    }
}