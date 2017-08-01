using System;
using System.Text.RegularExpressions;
using XOMFL.CommonComponents.Model;

namespace XOMFL.CommonComponents.Utils
{
	public static class Parser
	{
		private static Regex _codePattern = new Regex(@"^([A-Z]{1,2}\d{2})\.(\d{1})$");

		public static XomflComponentCode ParseCode(string code)
		{
			if (code == null || !_codePattern.IsMatch(code))
			{
				return null;
			}

			var match = _codePattern.Match(code);
			return new XomflComponentCode
			{
				Code = match.Groups[1].Value,
				Variation = Int32.Parse(match.Groups[2].Value)
			};
		}
	}
}