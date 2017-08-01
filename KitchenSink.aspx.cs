using System;
using System.IO;
using System.Linq;
using System.Web.UI;
using Newtonsoft.Json;
using XOMFL.CommonComponents.Controls;
using XOMFL.CommonComponents.Model;

namespace XOMFL.CommonComponents
{
	public partial class KitchenSink : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			var components = GetComponentList().Components
				.Where(x => !string.IsNullOrEmpty(x.Ascx))
				.OrderBy(x => x.Code).ToArray();

			foreach (var component in components)
			{
				var domId = component.Code;
				var title = string.Format("{0}: {1}", component.Code, component.Name);

				var item = LoadControl("~/controls/KitchenSinkItem.ascx") as KitchenSinkItem;
				item.DomID = domId;
				item.Title = title;
				item.ComponentCode = component.Code;
				item.ControlName = component.Ascx;
				item.DefaultChild = component.DefaultChild;
				item.Variations = string.Join(",", component.Variations.Select(x => x.Variation).ToArray());
				Components.Controls.Add(item);

				var li = string.Format("<li><a href=\"#{0}\">{1}</a></li>", domId, title);
				Nav.Controls.Add(new LiteralControl(li));

				if (component.Children.Any())
				{
					item.Child = component.DefaultChild ?? (component.Children.First() + ".1");
				}
			}
		}

		private XomflComponentList GetComponentList()
		{
			var json = File.ReadAllText(Server.MapPath("~/components.json"));
			return JsonConvert.DeserializeObject<XomflComponentList>(json);
		}
	}
}