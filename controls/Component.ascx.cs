using System;
using System.IO;
using System.Linq;
using System.Web.UI;
using XOMFL.CommonComponents.Utils;

namespace XOMFL.CommonComponents.Controls
{
	public partial class Component : UserControl
	{
		public string Code { get; set; }
		public string Child { get; set; }
		public string ContentFile { get; set; }
		public string Margin { get; set; }

		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				var code = Parser.ParseCode(Code);
				if (code == null)
				{
					throw new Exception("Invalid code specified.");
				}

				var files = Directory.GetFiles(Server.MapPath("~/controls/sci"), code.Code + "*.ascx");
				if (!files.Any())
				{
					throw new Exception(string.Format("[Component {0} is not available]", code.Code));
				}

				var filename = Path.GetFileName(files.First());
				var ascx = LoadControl("~/controls/sci/" + filename) as VariantControlBase;
				ascx.Variation = code.Variation;
				ascx.ContentFile = ContentFile;
				ascx.Margin = Margin;

				var container = ascx as ContainerControlBase;
				if (container != null)
				{
					container.Child = Child;
				}

				Wrapper.Controls.Add(ascx);
			}
			catch (Exception ex)
			{
				Wrapper.Controls.Add(new LiteralControl(ex.Message));
			}
		}
	}
}