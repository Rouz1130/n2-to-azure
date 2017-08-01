using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace XOMFL.CommonComponents.Controls
{
	public partial class KitchenSinkItem : System.Web.UI.UserControl
	{
		public string Child { get; set; }
		public bool Complete { get; set; }
		public string ComponentCode { get; set; }
		public string ControlName { get; set; }
		public string DefaultChild { get; set; }
		public string DomID { get; set; }
		public string Status { get; set; }
		public string Title { get; set; }
		public string Variations { get; set; }

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);

			var variationNumbers = Variations.Split(',').Select(int.Parse).ToArray();
			var lastVariationNumber = variationNumbers.Last();

			foreach (var variationNumber in variationNumbers)
			{
				var wrapper = new HtmlGenericControl("div");
				wrapper.Attributes.Add("class", "ks-variation breakpoints clearfix");

				try
				{
					var control = LoadControl("~/controls/sci/" + ControlName + ".ascx") as VariantControlBase;
					control.Variation = variationNumber;
					wrapper.Controls.Add(control);

					var container = control as ContainerControlBase;
					if (container != null)
					{
						container.Child = Child;
					}
				}
				catch (Exception ex)
				{
					wrapper.Controls.Add(new LiteralControl(ex.Message));
				}

				Component.Controls.Add(wrapper);
			}

			DataBind();
		}
	}
}