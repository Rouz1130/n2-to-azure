using System.Web;

namespace XOMFL.CommonComponents.api_mock
{
	public class AnalyticsHandler : IHttpHandler
	{

		public void ProcessRequest(HttpContext context)
		{
			context.Response.ContentType = "text/plain";
			context.Response.Write("OK");
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