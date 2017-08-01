<%@ Page Title="Home" Language="C#" Inherits="System.Web.UI.Page" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="jumbotron">
		<h1>EMFL Common Templates</h1>
		<p class="lead">Repository of front-end layouts and components</p>
	</div>
	<div class="row">
		<div class="col-md-4">
			<h3>Utilities</h3>
			<p><a runat="server" href="~/KitchenSink.aspx" class="glyph-link">Kitchen Sink</a></p>
			<p><a runat="server" href="~/layouts/ComponentTest.aspx" class="glyph-link">Component Test Page</a></p>
			<p><a runat="server" href="~/ImageSpecs.aspx" class="glyph-link">Image Specifications</a></p>
			<p>Sample Layouts: 
				<a runat="server" href="~/layouts/Layout01.aspx">1</a>
				<a runat="server" href="~/layouts/Layout02.aspx">2</a>
				<a runat="server" href="~/layouts/Layout03.aspx">3</a>
				<a runat="server" href="~/layouts/Layout04.aspx">4</a>
				<a runat="server" href="~/layouts/Layout05.aspx">5</a>
				<a runat="server" href="~/layouts/Layout06.aspx">6</a>
				<a runat="server" href="~/layouts/Layout07.aspx">7</a>
			</p>
			<h3>Header Scenarios</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Scenario</th>
						<th>Social</th>
						<th>Country</th>
						<th>Languages</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a runat="server" href="~/?Social=none">Minimal</a></td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<td><a runat="server" href="~/?Social=twitter,linkedin,youtube">Minimal, few social</a></td>
						<td>3</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<td><a runat="server" href="~/?Social=twitter,linkedin,facebook,youtube">Minimal, social flyout</a></td>
						<td>4</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<td><a runat="server" href="~/?Social=none&CountryAbbrev=BE&amp;CountryName=Belgium">Country selected, no social</a></td>
						<td>-</td>
						<td>Yes</td>
						<td>-</td>
					</tr>
					<tr>
						<td><a runat="server" href="~/?Social=twitter,linkedin,youtube&CountryAbbrev=BE&amp;CountryName=Belgium">Country selected, few social</a></td>
						<td>3</td>
						<td>Yes</td>
						<td>-</td>
					</tr>
					<tr>
						<td><a runat="server" href="~/?Social=twitter,linkedin,youtube,facebook&CountryAbbrev=BE&amp;CountryName=Belgium&Languages=DU&Language=DU">Country, social, one language</a></td>
						<td>4</td>
						<td>Yes</td>
						<td>1</td>
					</tr>
					<tr>
						<td><a runat="server" href="~/?Social=twitter,linkedin,youtube,facebook&CountryAbbrev=BE&amp;CountryName=Belgium&Languages=FR,DU,EN,EU-EN&Language=DU">Fully loaded</a></td>
						<td>4</td>
						<td>Yes</td>
						<td>4</td>
					</tr>
				</tbody>
			</table>
		</div>
		<% if (HttpContext.Current.IsNotRestricted()) { %>
		<div class="col-md-4">
			<h3>Apps</h3>
			<p><a runat="server" href="~/pages/private/apps/DrillDown.aspx" class="glyph-link">Drill-Down: Equipment Builder</a></p>
			<p><a runat="server" href="~/pages/private/apps/List.aspx" class="glyph-link">List</a></p>
			<p><a runat="server" href="~/pages/private/apps/List.aspx?q=events&amp;pageSize=2&amp;pageNumber=2" class="glyph-link">List: Deep-link</a></p>
			<p><a runat="server" href="~/pages/private/apps/List.aspx?Q=Oltiva&PAGESIZE=10&PAGENUMBER=1&SELECTEDFACETS=Application:Bearings" class="glyph-link">List: Case-insensitive URL</a></p>
			<p><a runat="server" href="~/pages/private/apps/FindStation.aspx" class="glyph-link">Locator: Find a Station</a></p>
			<p><a runat="server" href="~/pages/private/apps/FindDistributor.aspx" class="glyph-link">Locator: Find a Distributor</a></p>
			<p><a runat="server" href="~/pages/private/apps/FindTerminal.aspx" class="glyph-link">Locator: Find a Terminal</a></p>
			<p><a runat="server" href="~/pages/private/apps/GDL.aspx" class="glyph-link">Global Distributor Locator (GDL)</a></p>
			<p><a runat="server" href="~/pages/private/apps/RecommendationWizard.aspx" class="glyph-link">Recommendation Wizard</a></p>
			<p><a runat="server" href="~/pages/private/apps/Weather.aspx" class="glyph-link">Weather</a></p>
			<h3>Retail</h3>
			<p><a runat="server" href="~/pages/private/retail/HomeAmerica.aspx" class="glyph-link">Retail Home (US)</a></p>
			<p><a runat="server" href="~/pages/private/retail/HomeEurope.aspx" class="glyph-link">Retail Home (EU)</a></p>
			<p><a runat="server" href="~/pages/private/retail/HomeFuelAlt.aspx" class="glyph-link">Retail Home (Alternate)</a></p>
			<p><a runat="server" href="~/pages/private/retail/StationDetails.aspx" class="glyph-link">Station Details</a></p>
			<p><a runat="server" href="~/pages/private/retail/HomeEsso2.aspx" class="glyph-link">Oltiva Home</a></p>
			<h3>Industrial</h3>
			<p><a runat="server" href="~/pages/private/industrial/EquipmentBuilders.aspx" class="glyph-link">Equipment Builders</a></p>
		</div>
		<div class="col-md-4">
			<h3>Skins</h3>
			<p><a href="?skin=red">Red (Retail, Asphalt, Basestocks, Waxes, White oils)</a></p>
			<p><a href="?skin=blue">Blue (Industrial)</a></p>
			<p><a href="?skin=blue-muted">Muted Blue (Marine)</a></p>
			<p><a href="?skin=gray">Gray (Aviation)</a></p>
			<h3>Legacy</h3>
			<p><a runat="server" href="~/pages/private/legacy/NoseToTail.aspx" class="glyph-link">Nose to Tail</a></p>
			<p><a runat="server" href="~/pages/private/legacy/PairsGame.aspx" class="glyph-link">Pairs Game</a></p>
			<p><a runat="server" href="~/pages/private/legacy/IndustrialSchematics.aspx" class="glyph-link">Industrial Schematics</a></p>
		</div>
		<% } %>
	</div>

</asp:Content>
