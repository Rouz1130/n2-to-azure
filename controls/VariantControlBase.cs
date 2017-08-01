using System;
using System.Collections.Generic;

namespace XOMFL.CommonComponents.Controls
{
	public class VariantControlBase : System.Web.UI.UserControl
	{
		private Dictionary<string, string> uniqueIds = new Dictionary<string, string>();

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);
			DataBind();
		}

		protected override void OnPreRender(EventArgs e)
		{
			base.OnPreRender(e);
			SetContentControls();
		}

		public int Variation
		{
			get { return _variation; }
			set { _variation = value; }
		} private int _variation = 1;

		public string ContentFile { get; set; }

		public string Margin { get; set; }

		[Obsolete("Use the Variation property instead.")]
		public string VariantClassName { get; set; }

		public string UniqueDomId(string group = null)
		{
			if (group == null)
			{
				return CreateId();
			}

			if (!uniqueIds.ContainsKey(group))
			{
				uniqueIds[group] = CreateId();
			}

			return uniqueIds[group];
		}

		private string CreateId()
		{
			return "cmp-" + Guid.NewGuid().ToString("N");
		}

		private void SetContentControls()
		{
			if (string.IsNullOrEmpty(ContentFile))
			{
				return;
			}

			foreach (var control in Controls)
			{
				var content = control as Content;
				if (content != null)
				{
					content.ContentFile = ContentFile;
				}
			}
		}
	}
}