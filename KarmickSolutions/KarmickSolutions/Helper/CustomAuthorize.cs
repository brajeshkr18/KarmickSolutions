﻿using ResturantBooking.Web.Helper;
using System.Web.Mvc;
using System.Web.Routing;

namespace ResturantBooking.Web.Helper
{

    public class CustomAuthorize : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (UserAuthenticate.IsAuthenticated)
            {
                return;
            }
            else
            {
                base.OnAuthorization(filterContext);
            }
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new RedirectToRouteResult(
                 new RouteValueDictionary(
                     new
                     {
                         controller = "Account",
                         action = "LogOff"
                     })
                 );
        }
    }
}