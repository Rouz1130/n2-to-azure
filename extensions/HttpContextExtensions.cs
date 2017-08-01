using System.Web;
using System.Web.Security;

namespace XOMFL.CommonComponents.Extensions
{
	public static class HttpContextExtensions
	{
		public static bool IsNotRestricted(this HttpContext context)
		{
			return !FormsAuthentication.IsEnabled || context.User.Identity.Name == "emfl";
		}
	}
}