using CarisBrook.Service.UserService;
using DemoModel.ViewModel;
using DemoService.User;
using IndianLotus.Models;
using PayPal.Api;
using ResturantBooking.Utility.Helper;
using ResturantBooking.Web.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Mvc;
using Utility;

namespace ResturantBooking.Controllers
{

    public class HomeController : Controller
    {
   
        UserService _userService = new UserService();
        HomeService homeService = new HomeService();
        public ActionResult Index()
        
        {
            return View();
        }
        
        public ActionResult contact()
        {
            return View();
        }
        public ActionResult About()
        {
            return View();
        }

       
       
        [HttpPost]
        public ActionResult Login(LoginViewModel loginViewModel)
        {
                try
                {
                    loginViewModel.PasswordHash = SecurityHelper.CreatePasswordHash(loginViewModel.Password, "");
                    UserViewModel authenticatedUser = null;
                    authenticatedUser = _userService.LoginAuthentication(loginViewModel);

                    if (authenticatedUser != null)
                    {
                        string rememberme = (loginViewModel.RememberMe) ? "true" : "false";
                        UserAuthenticate.AddLoginCookie(authenticatedUser.FirstName + " " + authenticatedUser.LastName,
                         authenticatedUser.UserType.Name, authenticatedUser.Id.ToString(),
                                  authenticatedUser.UserType.Code, rememberme, authenticatedUser.UserTypeId);
                    return Json(new { Status = "Success", Message = "Login attempt was successful",Role=authenticatedUser.UserType.Name });
                    }
                    else
                    {
                        ModelState.AddModelError("", "User Not Authenticated ");
                        return Json(new { Status = "Failure", Message = "Invalid user details. kindly use valid credentials" });
                    }
                        
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Invalid login attempt");
                    return Json(new { Status = "Failure", Message = ex.Message });
                }


        }
 
    }
}