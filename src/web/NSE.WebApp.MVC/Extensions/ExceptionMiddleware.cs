using Microsoft.AspNetCore.Http;
using Polly.CircuitBreaker;
using Refit;
using System.Net;
using System.Threading.Tasks;

namespace NSE.WebApp.MVC.Extensions
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate next;

        public ExceptionMiddleware(RequestDelegate next)
        {
            this.next = next;
        }

        public async Task InvokeAsync(HttpContext httpContext)
        {
            try
            {
                await next(httpContext);
            }
            catch (CustomHttpRequestException ex)
            {
                HandleRequestExceptionAsync(httpContext, ex.StatusCode);
            }
            catch (ValidationApiException ex)
            {
                HandleRequestExceptionAsync(httpContext, ex.StatusCode);
            }
            catch (ApiException ex)
            {
                HandleRequestExceptionAsync(httpContext, ex.StatusCode);
            }
            catch (BrokenCircuitException)
            {
                HandleBrokenCircuitException(httpContext);
            }
        }

        private static void HandleRequestExceptionAsync(HttpContext httpContext, HttpStatusCode statusCode)
        {
            if (statusCode == HttpStatusCode.Unauthorized)
            {
                httpContext.Response.Redirect($"/login?ReturnUrl={httpContext.Request.Path}");
                return;
            }

            httpContext.Response.StatusCode = (int)statusCode;
        }

        private static void HandleBrokenCircuitException(HttpContext httpContext)
        {
            httpContext.Response.Redirect("/sistema-indisponivel");
        }
    }
}
