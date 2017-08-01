using System;
using System.Web.Security;

namespace XOMFL.CommonComponents
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Error.Visible = false;

			if (!IsPostBack) return;

			if (FormsAuthentication.Authenticate(Username.Text, Password.Text))
			{
				FormsAuthentication.RedirectFromLoginPage(Username.Text, false);
			}
			else
			{
				Error.Visible = true;
			}
		}
	}
}