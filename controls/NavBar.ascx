<%@ Control Language="C#" Inherits="System.Web.UI.UserControl" %>
<div class="navbar navbar-inverse hide-for-test">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" runat="server" href="~/">EMFL</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a runat="server" href="~/KitchenSink.aspx">Kitchen Sink</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Apps <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a runat="server" href="~/apps/ContactUs.aspx">Contact Us</a></li>
						<li><a runat="server" href="~/apps/ProductSelector.aspx">Product Selector</a></li>
						<li><a runat="server" href="~/apps/DistributorLocator.aspx">Distributor Locator</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Layouts <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<% for (var i = 1; i < 8; i++) { %>
						<li><a href="<%= ResolveUrl(String.Format("~/layouts/Layout{0:D2}.aspx", i)) %>">Layout <%= i %></a></li>
						<% } %>
						<li class="divider"></li>
						<li><a runat="server" href="~/layouts/ComponentTest.aspx">Component Test</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Sample Pages <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a runat="server" href="~/pages/ProductSeries.aspx">Product Series</a></li>
					</ul>
				</li>
				<li runat="server" id="StatusLink"><a runat="server" href="~/Status.aspx">Status</a></li>
				<li><a runat="server" href="~/Team.aspx">Team</a></li>
			</ul>
		</div>
	</div>
</div>
