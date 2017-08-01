using System;
using System.Web.UI;

namespace XOMFL.CommonComponents
{
    public partial class SiteMaster : MasterPage
    {
		protected override void OnLoad(System.EventArgs e)
		{
			base.OnLoad(e);

			//if (Page.User != null && Page.User.Identity.Name.Equals("customer", StringComparison.OrdinalIgnoreCase))
			//{
			//	StatusLink.Visible = false;
			//}

			DataBind();
		}
    }
}