using System;
using System.Web.UI.HtmlControls;

namespace XOMFL.CommonComponents.Pages
{
	public class AjaxForm : System.Web.UI.Page
	{
		public HtmlSelect ddlColors = new HtmlSelect();

		public void Page_Load(object sender, EventArgs e)
		{
			if (Request.RequestType == "POST")
			{
				Response.Clear();
				Response.Write(Request.Form[ddlColors.ClientID]);
				return;
			}

			ddlColors.DataSource = new string[] { "Blue", "Red", "Green" };
			ddlColors.DataBind();
		}
	}
}