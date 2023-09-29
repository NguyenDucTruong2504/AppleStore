using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace AppleStore.Models
{
    public class MaHoa
    {
        /// <summary>
        /// Hàm phục vụ cho mục đích mã hoá 1 chuỗi vãn bản gốc dựa vào việc băm dữ liệu bởi SHA256
        /// </summary>
        /// <param name="PlainText">Chuỗi văn bản muốn mã hoá</param>
        /// <returns> Kêt quả  đã mã hoá</returns>
        public static string encryptSHA256(string PlainText)
        {
            string result = "";
            //---  create a SHA256 object ------------------------------
            using(SHA256 bb = SHA256.Create())
            {
                //--- Covert plaintext to a bytes array
                byte [] sourceData = Encoding.UTF8.GetBytes(PlainText);
                //--- Compute Hash and return a byte array -------------
                byte [] hashResult = bb.ComputeHash(sourceData);
                result = BitConverter.ToString(hashResult);
            }  
            return result;
        }
    }
}