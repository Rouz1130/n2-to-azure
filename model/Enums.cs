using System;
using System.ComponentModel;

namespace XOMFL.CommonComponents.Model
{
	public enum ComponentStatus
	{
		[Description("Not started")]
		NotStarted = 0,
		[Description("In work")]
		InWork = 1,
		[Description("Ready for test")]
		ReadyForTest = 2,
		[Description("Complete")]
		Complete = 3,
		[Description("Not required")]
		NotRequired = 4,
	}

	public static class Enums
	{
		public static string GetName(object val)
		{
			var type = val.GetType();
			var name = Enum.GetName(type, val);
			if (name == null)
			{
				throw new Exception(String.Format("Enum {0} has no value {1}.", type, val));
			}

			var fi = type.GetField(name);
			var attrs = fi.GetCustomAttributes(typeof(DescriptionAttribute), false);
			return attrs.Length == 0 ? val.ToString() : ((DescriptionAttribute)attrs[0]).Description;
		}
	}
}