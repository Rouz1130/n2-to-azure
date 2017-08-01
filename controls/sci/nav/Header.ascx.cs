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

		public string[] Social
		{
			get { return Request.QueryString["Social"] == null ? new[] { "twitter", "linkedin", "youtube" } : GetMultiValues("Social"); }
		}

		private string[] GetMultiValues(string querystringKey)
		{
			var values = Request.QueryString[querystringKey];
			return string.IsNullOrEmpty(values) || values.ToLower() == "none" ? new string[0] : values.Split(',');
		}
	}
}