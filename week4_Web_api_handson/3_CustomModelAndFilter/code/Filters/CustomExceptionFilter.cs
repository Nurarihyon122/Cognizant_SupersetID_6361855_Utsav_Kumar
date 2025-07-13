using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.IO;

namespace _3_CustomModelAndFilter.Filters
{
    public class CustomExceptionFilter : IExceptionFilter
    {
        public void OnException(ExceptionContext context)
        {
            var exception = context.Exception;
            File.WriteAllText("error_log.txt", exception.ToString());

            context.Result = new ObjectResult("An error occurred")
            {
                StatusCode = 500
            };
        }
    }
}
