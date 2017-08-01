using System.Collections.Generic;

namespace XOMFL.CommonComponents.Model
{
	public class XomflChangelog
	{
		public string Component { get; set; }
		public List<XomflVersion> Versions { get; set; }
	}
}