namespace XOMFL.CommonComponents.controls
{
	public partial class Status : System.Web.UI.UserControl
	{
		public bool Complete { get; set; }

		public string Text
		{
			get
			{
				return text ?? (Complete ? "Complete" : "Unknown");
			}
			set
			{
				text = value;
			}
		} private string text;
	}
}