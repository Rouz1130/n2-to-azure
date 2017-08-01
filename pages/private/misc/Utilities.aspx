<%@ Page Title="Utilities" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<h1>Utilities</h1>

	<div class="row">
		<div class="col-md-12 col-4">

			<h2>Time Zone Conversion</h2>

			<p>The framework uses <a href="http://momentjs.com/">Moment.js</a> to convert UTC timestamps to local time in the browser.  To display a local time, use the markup shown below.
				The UTC time should be rendered as the data-utc attribute value in <a href="https://en.wikipedia.org/wiki/ISO_8601">ISO8601 format</a>.</p>

			<pre class="ks-snippet"><code class="html"><%= HttpUtility.HtmlEncode("<span class=""local-time"" data-utc=""" + DateTime.UtcNow.ToString("o") + """ data-format=""M/D/YYYY""></span>") %></code></pre>

			<h3 class="h5">Example formats:</h3>
			<ul>
				<li>Default - <span class="local-time" data-utc="<%= DateTime.UtcNow.ToString("o") %>"></span> *</li>
				<li>MM/DD/YYYY - <span class="local-time" data-utc="<%= DateTime.UtcNow.ToString("o") %>" data-format="MM/DD/YYYY"></span></li>
			</ul>

			<p class="small">* You can exclude the data-format attribute for default formatting.</p>

		</div>
	</div>
</asp:Content>
