using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using XOMFL.CommonComponents.Controls;
using XOMFL.CommonComponents.Model;
using XOMFL.CommonComponents.Utils;

namespace XOMFL.CommonComponents.layouts
{
	public partial class ComponentTest : System.Web.UI.Page
	{
		public string Component
		{
			get
			{
				return (Request.QueryString["Component"] ?? String.Empty).Trim();
			}
		}

		public string Child
		{
			get
			{
				return (Request.QueryString["Child"] ?? String.Empty).Trim();
			}
		}

		protected XomflChangelog Changelog { get; private set; }

		protected void Page_Load(object sender, EventArgs e)
		{
			var list = GetComponentList();
			LoadComponentList(list);

			children.Visible = false;

			var code = Parser.ParseCode(Component);
			if (code != null)
			{
				var metadata = list.Components.FirstOrDefault(x => x.Code == code.Code && x.Variations.Any(y => y.Variation == code.Variation));
				if (metadata != null)
				{
					var selectedChild = Child;
					var variation = metadata.Variations.FirstOrDefault(x => x.Variation == code.Variation);
					ComponentCode.Text = String.Format("{0}.{1}", code.Code, code.Variation);
					VariationDescription.Text = String.Format("{0} > {1}", metadata.Name, variation.Name);
					Snippet.Name = metadata.Ascx;

					if (metadata.Children.Any())
					{
						children.Visible = true;
						foreach (var child in metadata.Children)
						{
							var childMetadata = list.Components.FirstOrDefault(x => x.Code == child);
							if (childMetadata != null)
							{
								foreach (var childVariation in childMetadata.Variations)
								{
									var name = GetVariationDescription(childMetadata, childVariation);
									var item = new ListItem(name, String.Format("?Component={0}.{1}&Child={2}.{3}", metadata.Code, variation.Variation, child, childVariation.Variation));
									item.Selected = (item.Value.EndsWith(Request.QueryString.ToString()));
									children.Items.Add(item);
								}
							}
						}
					}

					if (String.IsNullOrEmpty(selectedChild))
					{
						selectedChild = metadata.DefaultChild;
					}

					FourColumn.Controls.Add(Create(Component, selectedChild));
					ThreeColumn.Controls.Add(Create(Component, selectedChild));
					TwoColumn1.Controls.Add(Create(Component, selectedChild));
					TwoColumn2.Controls.Add(Create(Component, selectedChild));
					OneColumn.Controls.Add(Create(Component, selectedChild));

					LoadChangelog(metadata);
				}
			}

			DataBind();
		}

		XomflComponentList GetComponentList()
		{
			var json = File.ReadAllText(Server.MapPath("~/components.json"));
			var list = JsonConvert.DeserializeObject<XomflComponentList>(json);
			list.Components = list.Components.Where(x => !String.IsNullOrEmpty(x.Ascx)).ToList();
			return list;
		}

		Component Create(string code, string child)
		{
			var control = LoadControl("~/controls/Component.ascx") as Component;
			control.Code = code;
			control.Child = child;
			return control;
		}

		void LoadComponentList(XomflComponentList list)
		{
			foreach (var metadata in list.Components.OrderBy(x => x.Code))
			{
				foreach (var variation in metadata.Variations)
				{
					var name = GetVariationDescription(metadata, variation);
					var componentQuery = String.Format("?Component={0}.{1}", metadata.Code, variation.Variation);
					string childQuery = String.Empty;
					if (metadata.Children.Any())
					{
						var childCode = metadata.Children.First();
						var childMetadata = list.Components.FirstOrDefault(x => x.Code == childCode);
						childQuery += String.Format("&Child={0}.{1}", childMetadata.Code, childMetadata.Variations.First().Variation);
					}

					var item = new ListItem(name, componentQuery + childQuery);
					item.Selected = ("?" + Request.QueryString).StartsWith(componentQuery);
					components.Items.Add(item);
				}
			}
		}

		string GetVariationDescription(XomflComponent component, XomflVariation variation)
		{
			return String.Format("{0}.{1}: {2} > {3}", component.Code, variation.Variation, component.Name, variation.Name);
		}

		void LoadChangelog(XomflComponent component)
		{
			var path = Server.MapPath("~/controls/changelog/" + component.Ascx + ".json");
			if (!File.Exists(path))
			{
				return;
			}

			Changelog = JsonConvert.DeserializeObject<XomflChangelog>(File.ReadAllText(path));
		}
	}
}