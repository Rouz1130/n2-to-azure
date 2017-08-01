using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Newtonsoft.Json;
using XOMFL.CommonComponents.Model;

namespace XOMFL.CommonComponents
{
	public partial class Status : System.Web.UI.Page
	{
		protected List<XomflComponent> Components { get; private set; }
		protected Dictionary<ComponentStatus, int> Buckets { get; private set; }
		protected int TotalVariations { get; private set; }
		protected XomflComponent[] BuildableComponents; 

		protected void Page_Load(object sender, EventArgs e)
		{
			Components = GetComponentList().Components;
			BuildableComponents = Components.Where(x => x.Status != ComponentStatus.NotRequired).ToArray();
			TotalVariations = BuildableComponents.Sum(x => x.Variations.Count);
			Buckets = BuildableComponents.GroupBy(x => x.Status)
				.Select(g => new { Status = g.Key, Count = g.Sum(x => x.Variations.Count) })
				.ToDictionary(x => x.Status, y => y.Count);

			DataBind();
		}

		protected int GetPercentage(ComponentStatus status)
		{
			if (Buckets.ContainsKey(status))
			{
				return Convert.ToInt32(Convert.ToDecimal(Buckets[status]) / Convert.ToDecimal(TotalVariations) * 100m);
			}
			return 0;
		}

		protected int BatchCompletion(int batch)
		{
			var components = BuildableComponents.Where(x => x.Batch == batch).ToArray();
			var total = components.Sum(x => x.Variations.Count);
			var ready = components.Where(x => x.Status == ComponentStatus.Complete).Sum(x => x.Variations.Count);
			if (ready == 0 || total == 0)
			{
				return 0;
			}
			return Convert.ToInt32(Convert.ToDecimal(ready) / Convert.ToDecimal(total) * 100m);
		}

		protected string NotesAndSpecs(string notes, string specs)
		{
			var data = new[] { notes, String.IsNullOrEmpty(specs) ? null : String.Format("<a href=\"{0}\" target=\"_blank\" class=\"glyph-link\">Details</a>", specs) };
			return String.Join("<br/><br/>", data.Where(x => !String.IsNullOrEmpty(x)).ToArray());
		}

		private XomflComponentList GetComponentList()
		{
			var json = File.ReadAllText(Server.MapPath("~/components.json"));
			return JsonConvert.DeserializeObject<XomflComponentList>(json);
		}
	}
}