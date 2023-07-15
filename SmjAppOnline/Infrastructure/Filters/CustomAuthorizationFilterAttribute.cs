using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.Infrastructure.Filters
{ 
    public class CustomAuthorizationFilterAttribute : Attribute, IAuthorizationFilter
    {
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            string currentUserRole = Convert.ToString(context.HttpContext.Session.GetString("UserRole"));
            int? currentUserId = context.HttpContext.Session.GetInt32("UserId");
            
            var clains = context.HttpContext.User.Identities.ToList();

            if (currentUserId != 0 && !string.IsNullOrEmpty(currentUserRole))
            {
                if (currentUserRole == "Admin")
                {
                    context.Result = new RedirectToRouteResult
                (
                new RouteValueDictionary(new
                {
                    action = "Index",
                    controller = "Home",
                    Areas = "Admin"
                }));

                }
                else
                {
                    context.Result = new RedirectToRouteResult
               (
               new RouteValueDictionary(new
               {
                   action = "Index",
                   controller = "Members"
               }));

                }
            }
            else
            {
                context.Result = new RedirectToRouteResult
                (
                new RouteValueDictionary(new
                {
                    action = "Error",
                    controller = "Error"
                }));

            }
        }
    }


}
