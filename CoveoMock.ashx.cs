using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace XOMFL.CommonComponents
{
	/// <summary>
	/// Summary description for CoveoMock
	/// </summary>
	public class CoveoMock : IHttpHandler
	{
		private static readonly JsonSerializerSettings _settings = new JsonSerializerSettings
		{
			ContractResolver = new CamelCasePropertyNamesContractResolver()
		};

		public void ProcessRequest(HttpContext context)
		{
			var response = JsonConvert.DeserializeObject<CoveoResponse>(File.ReadAllText(context.Server.MapPath("~/content/site/coveo-sample.json")));

			var query = context.Request.QueryString["q"];
			if (!String.IsNullOrEmpty(query))
			{
				response.Results = response.Results.Where(x => IsMatch(x, query)).ToList();
			}
			
			context.Response.ContentType = "application/json";
			context.Response.Write(JsonConvert.SerializeObject(new
			{
				Results = response.Results.Select(x => new { x.Title })
			}, _settings));
		}

		public bool IsReusable
		{
			get
			{
				return false;
			}
		}

		private static bool IsMatch(CoveoResponseItem item, string query)
		{
			return
				(item.Title != null && item.Title.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0) ||
				(item.Raw.ShortDescription != null && item.Raw.ShortDescription.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0) ||
				(item.Raw.Introduction != null && item.Raw.Introduction.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0) ||
				(item.Raw.Body != null && item.Raw.Body.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0);
		}

		private class CoveoResponse
		{
			public List<CoveoResponseItem> Results { get; set; }
		}

		private class CoveoResponseItem
		{
			public string Title { get; set; }
			public string ClickUri { get; set; }
			public CoveoResponseItemRaw Raw { get; set; }
		}

		private class CoveoResponseItemRaw
		{
			public string ShortDescription { get; set; }
			public string Introduction { get; set; }
			public string Body { get; set; }
		}
	}
}