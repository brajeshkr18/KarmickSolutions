using CarisBrook.Service.UserService;
using ResturantBooking.Utility.Helper;
using ResturantBooking.Web.Helper;
using DemoModel.ViewModel;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using static Utility.Enums;

namespace ResturantBooking.Controllers
{
    //[HandleError]
    public class AccountController : Controller
    {

        UserService _userService = new UserService();

   
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
                    return RedirectToAction("Index", "Home");
                }
                else
                return RedirectToAction("Dashboard", "Admin");
            }
            else
            {
                return View();
            }
            //if (TempData["result"] != null)
            //{
            //    var myJsonResult = TempData["result"] as MyJsonResult;
            //    if (myJsonResult.data != null)
            //        return View(new LoginViewModel { Email = myJsonResult.data.ToString() });
            //}
            return View();
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
                        return RedirectToAction("Dashboard", "Admin");

                    }
                    else
                    {
                        ModelState.AddModelError("", "User Not Authenticated ");
                        // ViewBag.ErrorMsg = "Please check your username and password! ";
                    }
                }
                //catch (CustomException customException)
                //{
                //    ModelState.AddModelError("", customException.Message);
                //}
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
            return RedirectToAction("Index", "Home");
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
        [ValidateAntiForgeryToken]
        public ActionResult Register(UserViewModel model)
        {
            if (_userService.IsUserExists(model.Email, model.Id.ToString()))
                ModelState.AddModelError("Email", "Email is already taken by someone.");
            if (ModelState.IsValid)
            {
                try
                {
                    model.PasswordHash = SecurityHelper.CreatePasswordHash(model.Password, "");
                    var user = _userService.RegisterUsers(model);

                    if (user != null)
                    {
                        UserAuthenticate.AddLoginCookie(user.FirstName + " " + user.LastName,
                            user.UserType.Name, user.Id.ToString(),
                                     user.UserType.Code, "", user.UserTypeId);
                        return RedirectToAction("Item", "Home");
                    }
                    else
                    {
                        //ModelState.Add(model.er)
                    }
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Invalid login attempt");
                }

            }
            return View(model);
        }
        [AllowAnonymous]
        public JsonResult IsUserEmailExists(string Email, string Id)
        {
            return Json(!_userService.IsUserExists(Email, Id), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult ForgotPassword(string EmailID)
        {
            string resetCode = Guid.NewGuid().ToString();
            var verifyUrl = "/Account/ResetPassword/" + resetCode;
            var link = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, verifyUrl);
            //using (var context = new LoginRegistrationInMVCEntities())
            //{
                var getUser = _userService.UpdateResetCode(EmailID, resetCode);
                if (getUser != null)
                {
                  //  getUser.ResetPasswordCode = resetCode;

                    //This line I have added here to avoid confirm password not match issue , as we had added a confirm password property 

                    //context.Configuration.ValidateOnSaveEnabled = false;
                    //context.SaveChanges();

                    var subject = "Password Reset Request";
                    var body = "";
                    //var body = "Hi " + getUser.FirstName + ", <br/> You recently requested to reset your password for your account. Click the link below to reset it. " +

                    //     " <br/><br/><a href='" + link + "'>" + link + "</a> <br/><br/>" +
                    //     "If you did not request a password reset, please ignore this email or reply to let us know.<br/><br/> Thank you";

                   // SendEmail(getUser.Email, body, subject);

                    ViewBag.Message = "Reset password link has been sent to your email id.";
                }
                else
                {
                    ViewBag.Message = "User doesn't exists.";
                    return View();
                }
            //}

            return View();
        }

        private void SendEmail(string emailAddress, string body, string subject)
        {
            //using (MailMessage mm = new MailMessage("youremail@gmail.com", emailAddress))
            //{
            //    mm.Subject = subject;
            //    mm.Body = body;

            //    mm.IsBodyHtml = true;
            //    SmtpClient smtp = new SmtpClient();
            //    smtp.Host = "smtp.gmail.com";
            //    smtp.EnableSsl = true;
            //    NetworkCredential NetworkCred = new NetworkCredential("youremail@gmail.com", "YourPassword");
            //    smtp.UseDefaultCredentials = true;
            //    smtp.Credentials = NetworkCred;
            //    smtp.Port = 587;
            //    smtp.Send(mm);

            //}
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
                        ////you can encrypt password here, we are not doing it
                        //user.Password = model.NewPassword;
                        ////make resetpasswordcode empty string now
                        //user.ResetPasswordCode = "";
                        ////to avoid validation issues, disable it
                        //context.Configuration.ValidateOnSaveEnabled = false;
                        //context.SaveChanges();
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
    }
}