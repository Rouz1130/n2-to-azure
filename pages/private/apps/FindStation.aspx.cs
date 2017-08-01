namespace XOMFL.CommonComponents.Apps
{
	public class FindStation : System.Web.UI.Page
	{
		public string MapProvider
		{
			get
			{
				if (Request.QueryString["map"] == "baidu")
				{
					return "baidu";
				}

				if (Request.QueryString["map"] == "google")
				{
					return "google";
				}

				return "bing";
			}
		}
	}
}