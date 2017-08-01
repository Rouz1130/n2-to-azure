using System;
using System.Collections.Generic;

namespace XOMFL.CommonComponents.Model
{
	public class XomflVersion
	{
		public int Version { get; set; }
		public DateTime Date { get; set; }
		public List<string> Changes { get; set; }
	}
}