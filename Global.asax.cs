using System;
using System.Configuration;
using System.Threading;
using System.Web;
using System.Web.Security;

namespace XOMFL.CommonComponents
{
    public class Global : HttpApplication
    {
		private static readonly string AutoLogonKey = ConfigurationManager.AppSettings["AutoLogonKey"];

		void Application_AuthenticateRequest(object sender, EventArgs e)
		{
			if (!FormsAuthentication.IsEnabled)
			{
				return;
			}

			if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
            {
				return;
			}

			if (string.IsNullOrEmpty(AutoLogonKey) || AutoLogonKey != HttpContext.Current.Request.QueryString["AutoLogon"])
			{
				return;
			}

			var ticket = new FormsAuthenticationTicket("emfl", true, (int)FormsAuthentication.Timeout.TotalMinutes);

			// Write cookie
			var encryptedCookie = FormsAuthentication.Encrypt(ticket);
			var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
			cookie.Expires = DateTime.Now.AddMinutes(30);
			Response.Cookies.Add(cookie);

			// Set current context user
			var identity = new FormsIdentity(ticket);
			var principal = new System.Security.Principal.GenericPrincipal(identity, new string[0]);
			HttpContext.Current.User = principal;
			Thread.CurrentPrincipal = principal;
		}

		void Application_BeginRequest(object sender, EventArgs e)
		{
			var skin = GetSkinFromCookie() ?? "red";
			var newSkin = Request.QueryString["skin"];
			if (!string.IsNullOrEmpty(newSkin) && newSkin != skin)
			{
				skin = newSkin;
				SetSkinCookie(skin);
			}

			HttpContext.Current.Items["skin"] = skin;
		}

		private string GetSkinFromCookie()
		{
			var cookie = Request.Cookies["emfl-skin"];
			return cookie == null ? null : cookie.Value;
		}

		private void SetSkinCookie(string skin)
		{
			var cookie = new HttpCookie("emfl-skin", skin);
			Response.Cookies.Add(cookie);
		}
	}
}