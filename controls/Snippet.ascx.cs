using System;
using System.IO;

namespace XOMFL.CommonComponents.controls
{
	public partial class Snippet : System.Web.UI.UserControl
	{
		public bool Collapsed { get; set; }
		public string Name { get; set; }

		protected void Page_Load(object sender, EventArgs e)
		{
			var path = Server.MapPath("~/controls/snippets/" + Name + ".html");
			if (!File.Exists(path))
			{
				NotAvailable.Visible = true;
				return;
			}

			MarkupContent.Text = Server.HtmlEncode(File.ReadAllText(path).Replace("\t", "   "));
			Markup.Visible = true;
		}
	}
}