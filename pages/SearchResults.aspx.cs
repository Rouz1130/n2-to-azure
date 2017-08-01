using System;
using System.Web.UI.WebControls;

namespace XOMFL.CommonComponents.Pages
{
	public class SearchResults : System.Web.UI.Page
	{
		protected Literal litQuery;

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);

			if (string.IsNullOrWhiteSpace(Request.QueryString["q"])) return;
			litQuery.Text = "for \"" + Request.QueryString["q"] + "\"";
		}
	}
}