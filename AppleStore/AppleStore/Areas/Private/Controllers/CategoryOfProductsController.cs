using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppleStore.Models;

namespace AppleStore.Areas.Private.Controllers
{
    public class CategoryOfProductsController : Controller
    {
        private static bool isUpdate = false;
        // GET: Private/CategoryOfProducts
        [HttpGet]
        public ActionResult Index()
        {
            List<LoaiSP> l = new ShopOnline_DemoEntities1().LoaiSPs.OrderBy(x => x.tenLoai).ToList<LoaiSP>();
            ViewData["Dsloai"] = l;
            return View();
        }
        [HttpPost]
        public ActionResult Index (LoaiSP x)
        {
            ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
            //--- B1 add LoaiSP object to Data model ------------------------------------
            if (!isUpdate)
                 db.LoaiSPs.Add(x);
            else
            {
                LoaiSP y = db.LoaiSPs.Find(x.maLoai);
                y.tenLoai = x.tenLoai;
                y.ghiChu  = x.ghiChu;
                isUpdate = false;
            }
            db.SaveChanges();       //--- save data model
            // --- Update list to view --------------------------------------------------
            if (ModelState.IsValid)
                ModelState.Clear();
            ViewData["Dsloai"] =  db.LoaiSPs.OrderBy(z => z.tenLoai).ToList<LoaiSP>();
            return View();
        }
        [HttpPost]
        public ActionResult Delete(String ml)
        {
            ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
            int ma = int.Parse(ml);
            // --- B1 : Find LoaiSP object in Data model by maloai ----------------------
            LoaiSP x = db.LoaiSPs.Find(ma);
            // --- B2 :  Remove LoaiSP object in Data model -----------------------------
            db.LoaiSPs.Remove(x);
            //--- B3 : Update to database
            db.SaveChanges();
            //--- B4 : Update data on View
            ViewData["Dsloai"] = db.LoaiSPs.OrderBy(z => z.tenLoai).ToList<LoaiSP>();
            return View("Index");
        }
        public ActionResult Update(String mlcs)
        {
            ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
            int ma = int.Parse(mlcs);
            // --- B1 : Find LoaiSP object in Data model by maloai ----------------------
            LoaiSP x = db.LoaiSPs.Find(ma);
            isUpdate = true;
            //---- ----------------------------------------------------------------------
            ViewData["Dsloai"] = db.LoaiSPs.OrderBy(z => z.tenLoai).ToList<LoaiSP>();
            return View("Index", x);
        }    
    }
}