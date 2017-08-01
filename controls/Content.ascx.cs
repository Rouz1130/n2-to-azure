using System;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Xml.Linq;

namespace XOMFL.CommonComponents.Controls
{
	[ParseChildren(true, "")]
	[PersistChildren(false)]
	public partial class Content : System.Web.UI.UserControl
	{
		[PersistenceMode(PersistenceMode.InnerDefaultProperty)]
		public string DefaultContent { get; set; }

		public string ContentFile { get; set; }
		public string ContentKey { get; set; }

		private static Regex _imageUrlRegex = new Regex("src=\"(?<src>~.*?)\"");

		protected override void Render(HtmlTextWriter writer)
		{
			base.Render(writer);

			var content = LoadContent() ?? DefaultContent;
			content = HandleImageUrls(content);
			writer.Write(content);
		}

		private string LoadContent()
		{
			if (String.IsNullOrEmpty(ContentFile))
			{
				return null;
			}

			var path = Server.MapPath("~/content/site/copy/" + ContentFile + ".xml");
			if (!File.Exists(path))
			{
				return null;
			}

			var doc = XDocument.Load(path);
			var elems = doc.Root.Elements(ContentKey);
			return elems.Any() ? elems.First().Value : null;
		}

		private string HandleImageUrls(string html)
		{
			var matches = _imageUrlRegex.Matches(html);
			foreach (Match match in matches)
			{
				var oldSrc = match.Groups["src"].Value;
				var newSrc = ResolveUrl(oldSrc);
				html = html.Replace(oldSrc, newSrc);
			}
			return html;
		}
	}
}