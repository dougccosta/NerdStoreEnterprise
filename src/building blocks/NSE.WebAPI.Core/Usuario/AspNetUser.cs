using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Security.Claims;

namespace NSE.WebAPI.Core.Usuario
{

    public class AspNetUser : IAspNetUser
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
}
