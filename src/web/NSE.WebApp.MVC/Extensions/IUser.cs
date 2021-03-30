using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Security.Claims;

namespace NSE.WebApp.MVC.Extensions
{
    public interface IUser
    {
        string Name { get; }
        Guid ObterUserId();
        string ObterUserEmail();
        string ObterUserToken();
        bool EstaAutenticado();
        bool PossuiRole(string role);
        IEnumerable<Claim> ObterClaims();
        HttpContext ObterHttpContext();
    }

    public class AspNetUser : IUser
    {
        private readonly IHttpContextAccessor accessor;
        public string Name => accessor.HttpContext.User.Identity.Name;

        public AspNetUser(IHttpContextAccessor accessor)
        {
            this.accessor = accessor;
        }

        public Guid ObterUserId()
        {
            return EstaAutenticado() ? Guid.Parse(accessor.HttpContext.User.GetUserId()) : Guid.Empty;
        }

        public string ObterUserEmail()
        {
            return EstaAutenticado() ? accessor.HttpContext.User.GetUserEmail() : "";
        }

        public string ObterUserToken()
        {
            return EstaAutenticado() ? accessor.HttpContext.User.GetUserToken() : "";
        }

        public HttpContext ObterHttpContext()
        {
            return accessor.HttpContext;
        }

        public bool EstaAutenticado()
        {
            return accessor.HttpContext.User.Identity.IsAuthenticated;
        }

        public IEnumerable<Claim> ObterClaims()
        {
            return accessor.HttpContext.User.Claims;
        }        

        public bool PossuiRole(string role)
        {
            return accessor.HttpContext.User.IsInRole(role);
        }
    }

    public static class ClaimsPrincipalExtensions
    {
        public static string GetUserId(this ClaimsPrincipal principal)
        {
            if (principal == null)
            {
                throw new ArgumentException(nameof(principal));
            }

            var claim = principal.FindFirst("sub");
            return claim?.Value;
        }

        public static string GetUserEmail(this ClaimsPrincipal principal)
        {
            if (principal == null)
            {
                throw new ArgumentException(nameof(principal));
            }

            var claim = principal.FindFirst("email");
            return claim?.Value;
        }

        public static string GetUserToken(this ClaimsPrincipal principal)
        {
            if (principal == null)
            {
                throw new ArgumentException(nameof(principal));
            }

            var claim = principal.FindFirst("JWT");
            return claim?.Value;
        }
    }
}
