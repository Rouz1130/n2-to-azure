using System;
using System.Web;

namespace XOMFL.CommonComponents.api_mock
{
	public class ajax_form_handler : IHttpHandler
	{
		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "text/plain";

			if ("error".Equals(context.Request.Form["first-name"], StringComparison.OrdinalIgnoreCase))
			{
				context.Response.StatusCode = 400;
				return;
			}
		}

		public bool IsReusable
		{
			get
			{
				return false;
			}
		}
	}
}