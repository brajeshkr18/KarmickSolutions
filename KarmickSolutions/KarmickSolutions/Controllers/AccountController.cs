using DemoModel.ViewModel;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using static Utility.Enums;
using KarmickSolutions.Web.Helper;
using DemoService.UserService;
using KarmickSolutions.Utility.Helper;
using DemoService.HomeService;

namespace KarmickSolutions.Controllers
{
    //[HandleError]
    public class AccountController : Controller
    {

        IUserService _userService = new UserService();
        IHomeService _homeService = new HomeService();

        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            if (UserAuthenticate.IsAuthenticated)
            {
                System.Web.HttpContext.Current.Request.Cookies["ES"].Expires = DateTime.Now.AddHours(24);
                if (UserAuthenticate.UserTypeId== (int)UserType.User)
                {
                    return RedirectToAction("Index", "Account");
                }
                if (UserAuthenticate.UserTypeId == (int)UserType.Admin)
                {
                    return RedirectToAction("Dashboard", "Admin");
                }
                else
                return RedirectToAction("Dashboard", "Admin");
            }
            else
            {
                return View();
            }
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    model.PasswordHash = SecurityHelper.CreatePasswordHash(model.Password, "");

                    UserViewModel authenticatedUser = null;
                    authenticatedUser = _userService.LoginAuthentication(model);

                    if (authenticatedUser != null)
                    {
                        string rememberme = (model.RememberMe) ? "true" : "false";
                        UserAuthenticate.AddLoginCookie(authenticatedUser.FirstName + " " + authenticatedUser.LastName, 
                            authenticatedUser.UserType.Name, authenticatedUser.Id.ToString(),
                                     authenticatedUser.UserType.Code, rememberme,authenticatedUser.UserTypeId);
                        if (authenticatedUser.UserType.Name == UserType.Admin.ToString())
                        {
                            return RedirectToAction("Dashboard", "Admin");
                        }
                        else if (authenticatedUser.UserType.Name == UserType.User.ToString())
                        {
                            return RedirectToAction("Index", "Account");
                        }
                        return RedirectToAction("Dashboard", "Admin");

                    }
                    else
                    {
                        ModelState.AddModelError("", "User Not Authenticated ");
                        // ViewBag.ErrorMsg = "Please check your username and password! ";
                    }
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Invalid login attempt");
                }

            }
            return View(model);
        }
        
        public ActionResult LogOff()
        {
            TempData.Keep("result");
            UserAuthenticate.Logout(System.Web.HttpContext.Current);
            return RedirectToAction("Login", "Account");
        }

        public ActionResult Unauthorized()
        {
            UserAuthenticate.Logout(System.Web.HttpContext.Current);
            return View();
        }

        //
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Register(string returnUrl)
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Register(UserViewModel model)
        {
            if (_userService.IsUserExists(model.Email, model.Id.ToString()))
            {
                ModelState.AddModelError("Email", "Email is already taken by someone.");
                return Json(new { IsSuccess = false, Message = "Email is already taken by someone" });
            }
            if (ModelState.IsValid)
            {
                try
                {
                    model.PasswordHash = SecurityHelper.CreatePasswordHash(model.Password, "");
                    bool user = _userService.RegisterUsers(model);
                    if (user)
                    {
                        return Json(new { IsSuccess = true, Message = "Data saved successfully" });
                    }
                    else
                    {
                        return Json(new { IsSuccess = false, Message = "Unable to save data" });
                    }
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                }

            }
            else
            {
                return Json(new { IsSuccess = false, Message = "" });
            }
            return View(model);
        }
        [AllowAnonymous]
        public JsonResult IsUserEmailExists([Bind(Prefix = "UserViewModel.Email")] string Email, 
            [Bind(Prefix = "UserViewModel.Id")] string Id)
        {
        //public JsonResult IsUserEmailExists(string Email, string Id)
        
            return Json(!_userService.IsUserExists(Email, Id), JsonRequestBehavior.AllowGet);
        }


        public ActionResult ResetPassword(string id)
        {
            //Verify the reset password link
            //Find account associated with this link
            //redirect to reset password page
            if (string.IsNullOrWhiteSpace(id))
            {
                return HttpNotFound();
            }
                bool result = _userService.verifyUserExistByCode(id);
                if (result)
                {
                    ResetPasswordViewModel model = new ResetPasswordViewModel();
                    model.ResetCode = id;
                    return View(model);
                }
                else
                {
                    return HttpNotFound();
                }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPassword(ResetPasswordViewModel model)
        {
            var message = "";
            if (ModelState.IsValid)
            {
                  model.NewPassword = SecurityHelper.CreatePasswordHash(model.NewPassword, "");
                  bool user = _userService.SaveUserPassword(model);
                    if (user)
                    {
                        message = "New password updated successfully";
                    }

            }
            else
            {
                message = "Something invalid";
            }
            ViewBag.Message = message;
            return View(model);
        }
        public ActionResult Designation(int DepartmentId)
        {
            var designations = _homeService.GetDesignation(DepartmentId);
            return Json(designations, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Index()
        {
            return View();
        }
    }
}