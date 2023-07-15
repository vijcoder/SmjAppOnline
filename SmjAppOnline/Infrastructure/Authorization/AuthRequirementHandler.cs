using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SmjApp.Infrastructure.Authorization
{
    public class AuthRequirementHandler : AuthorizationHandler<AuthRequirement>
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ILogger _logger;
        public AuthRequirementHandler(IHttpContextAccessor httpContextAccessor, ILogger<AuthRequirementHandler> logger)
        {
            _httpContextAccessor = httpContextAccessor;
            _logger = logger;
        }
        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, AuthRequirement requirement)
        {
            if (_httpContextAccessor.HttpContext.User.Claims.Any(c => c.Type == "Role" && c.Value == "User"))
            {
                context.Succeed(requirement);
                return Task.CompletedTask;
            }

            context.Fail();
            _logger.LogWarning($"Non integration claim attempted to call Country Configuration API. User name: {_httpContextAccessor.HttpContext.User.Identity.Name}");
            return Task.CompletedTask;
        }
    }
}
