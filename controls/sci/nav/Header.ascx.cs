using System;
using System.Collections.Generic;

namespace XOMFL.CommonComponents.Controls.Xomfl.Nav
{
	public class Header : System.Web.UI.UserControl
	{
		public string CountryAbbrev
		{
			get { return Request.QueryString["CountryAbbrev"]; }
		}

		public string CountryName
		{
			get { return Request.QueryString["CountryName"] ?? "Select country"; }
		}

		public string Language
		{
			get { return Request.QueryString["Language"] ?? "EN"; }
		}

		public bool HasCountrySelection
		{
			get { return !string.IsNullOrEmpty(CountryAbbrev); }
		}

		public string[] Languages
		{
			get { return GetMultiValues("Languages"); }
		}

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

        public string[] Social
		{
			get { return Request.QueryString["Social"] == null ? new[] { "twitter", "linkedin", "youtube" } : GetMultiValues("Social"); }
		}

        private string CreateId()
        {
            return "cmp-" + Guid.NewGuid().ToString("N");
        }

        private string[] GetMultiValues(string querystringKey)
		{
			var values = Request.QueryString[querystringKey];
			return string.IsNullOrEmpty(values) || values.ToLower() == "none" ? new string[0] : values.Split(',');
		}

        private Dictionary<string, string> uniqueIds = new Dictionary<string, string>();
    }
}