namespace XOMFL.CommonComponents.Controls
{
	public class ContainerControlBase : VariantControlBase
	{
		public string Child { get; set; }

		public ContainerControlBase()
			: base()
		{
			DataBind();
		}
	}
}