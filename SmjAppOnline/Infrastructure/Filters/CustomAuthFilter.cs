using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.Filters;

namespace SmjApp.Infrastructure.Filters
{
   public class CustomAuthFilter : IAsyncAuthorizationFilter
    {
        public bool AllowMultiple { get { return false; } }

        public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
        {

        }
            public async Task AuthenticateAsync(HttpAuthenticationContext context, CancellationToken cancellationToken)
        {
            HttpRequestMessage request = context.Request;
            AuthenticationHeaderValue authorization = request.Headers.Authorization;

            // More code to be added for validating the JWT
        }
        public Task ChallengeAsync(HttpAuthenticationChallengeContext context, CancellationToken cancellationToken)
        {
            throw new NotImplementedException(); //sample code
        }
    } 
}
