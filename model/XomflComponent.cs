using System.Collections.Generic;

namespace XOMFL.CommonComponents.Model
{
	public class XomflComponent
	{
		public string Ascx { get; set; }
		public int Batch { get; set; }
		public string[] Children { get; set; }
		public string Code { get; set; }
		public string DefaultChild { get; set; }
		public string Name { get; set; }
		public string Notes { get; set; }
		public string Specs { get; set; }
		public ComponentStatus Status { get; set; }
		public List<XomflVariation> Variations { get; set; }

		public XomflComponent()
		{
			Children = new string[0];
			Variations = new List<XomflVariation>();
		}
	}
}