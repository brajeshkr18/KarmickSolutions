using DemoModel.ViewModel;
using DemoService.HomeService;
using DemoService.UserService;
using KarmickSolutions.Utility.Helper;
using KarmickSolutions.Web.Helper;
using PagedList;
using System;
using System.Web.Mvc;
using Utility;

namespace KarmickSolutions.Controllers
{
    [CustomAuthorize]
    [RoleAuthorize(AppConstant.RoleAdmin, AppConstant.RoleSuperAdmin)]
    public class UserController : Controller
    {
        IUserService userService = new UserService();
        IHomeService homeService = new HomeService();
        // GET: User

        public ActionResult ManageUsers(int? pageSize, int? page)
        {

            int pageDataSize = (pageSize ?? 10);
            int pageNumber = (page ?? 1);
            ViewBag.PageSize = pageDataSize;
            var user = userService.GetUserList(Convert.ToInt32(UserAuthenticate.LogId),
                Convert.ToInt32(UserAuthenticate.UserTypeId)).ToPagedList(pageNumber, pageDataSize);
            return Request.IsAjaxRequest() ? (ActionResult)PartialView("_Users", user) : View(user);

        }
        [HttpGet]
        public ActionResult AddUser(int data)
        {

            UserViewModel objUser = new UserViewModel();
            if (data != 0)
            {
                objUser = userService.GetUsersDetailsById((int)data);
                ViewBag.GetDesignation = homeService.GetDesignation(objUser.DepartrmentId) ;
                return View(objUser);
            }
            else
            {
                return View();
            }
        }
        [HttpPost]
        public ActionResult AddUser(UserViewModel ObjUser)
        {
            if (ModelState.IsValid)
            {
                ObjUser.PasswordHash = SecurityHelper.CreatePasswordHash(ObjUser.Password,"");
                if (!userService.IsUserExists(ObjUser.Email, ObjUser.Id.ToString()))
                {
                    return Json($"Email {""} is already in use.");
                }
                bool result;
                if (ObjUser.Id == 0)
                    result = userService.SaveUsers(ObjUser);
                else
                    result = userService.UpdateUsers(ObjUser);
                if (result)
                {
                    return RedirectToAction("ManageUsers", new { });
                }
            }
            else
            {
                string error = "";
                //foreach (ModelState modelState in ViewData.ModelState.Values)
                //{
                //    foreach (ModelError errors in modelState.Errors)
                //    {
                //        ModelState.AddModelError("Name", "Name Required");
                //    }
                //}
            }
            return View("AddUser", ObjUser);
        }
        public ActionResult DeletUser(int data)
        {
            bool result;
            if (data != 0)
            {
                result = userService.DeletUser((int)data, Convert.ToInt32(UserAuthenticate.LogId));
                return Json(new { IsSuccess = true, Message = "User Record deleted successfully" });
            }
            else
            {
                return Json(new { IsSuccess = false, Message = "something went wrong. please try again" });
            }
        }
    }
}