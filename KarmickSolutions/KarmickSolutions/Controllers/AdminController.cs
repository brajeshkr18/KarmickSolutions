using KarmickSolutions.Web.Helper;
using DemoModel.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using static Utility.Enums;
using Utility;

namespace KarmickSolutions.Controllers
{
    [CustomAuthorize]
    [RoleAuthorize(AppConstant.RoleAdmin,AppConstant.RoleSuperAdmin)]
    public class AdminController : Controller
    {
        // GET: Admin

        public ActionResult Dashboard()
        {
            //List <BookingReqestViewModel> bookings = _bookingService.GetBookingList().ToList();
            //ViewBag.TotalOrder = menuService.GetAllPayment().Count();
            //ViewBag.Totalbooking = bookings.Count();
            //ViewBag.Todaysbooking = bookings.Where(x=>x.Date.Date==DateTime.Now.Date).Count();
            //ViewBag.CreatedToday = bookings.Where(x => x.Date.Date == DateTime.Now.Date).Count();
            return View();
        }
 
        //public ActionResult ManageAlbum(int? pageSize, int? page)
        //{

        //    int pageDataSize = (pageSize ?? 10);
        //    int pageNumber = (page ?? 1);
        //    ViewBag.PageSize = pageDataSize;
        //    var list = menuService.GetAllAlbum().ToPagedList(pageNumber, pageDataSize);
        //    return Request.IsAjaxRequest() ? (ActionResult)PartialView("_Album", list) : View(list);

        //}
        //[HttpGet]
        //public ActionResult AddAlbum(int data)
        //{
        //    AlbumViewModel ObjAlbum = new AlbumViewModel();
        //    if (data != 0)
        //    {
        //        ObjAlbum = menuService.GetAlbumById((int)data);
        //        return View(ObjAlbum);
        //    }
        //    else
        //    {
        //        return View();
        //    }
        //}
        //[HttpPost]
        //public ActionResult AddAlbum(AlbumViewModel ObjAlbum)
        //{
        //    bool result;
        //    if (ObjAlbum.id == 0)
        //        result = menuService.SaveAlbum(ObjAlbum);
        //    else
        //        result = menuService.UpdateAlbum(ObjAlbum);
        //    if (result)
        //    {
        //        return RedirectToAction("ManageAlbum", new { });
        //    }
        //    return View();
        //}
        //[HttpGet]
        //public ActionResult DeleteGalleryImage(int data)
        //{
        //    bool result=false;
        //    if (data != 0)
        //        result = menuService.DeleteGalleryItemById(data, UserAuthenticate.LogId);
        //    if (result)
        //    {
        //        return RedirectToAction("ManageGallery", new { });
        //    }
        //    return View();
        //}
       
       
    }
}