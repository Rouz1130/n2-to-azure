<%@ Page Title="Component Test" Language="C#" AutoEventWireup="true" CodeBehind="ComponentTest.aspx.cs" Inherits="XOMFL.CommonComponents.layouts.ComponentTest" %>
<%@ Register TagPrefix="ks" TagName="Snippet" Src="~/controls/Snippet.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="PageStyles">
	<style type="text/css">
		.separator {
			background-color: #eee;
			color: #999;
			margin: 60px 0 30px;
			padding: 15px;
		}
		.links .padded {
			padding-left: 4px;
		}
		.links .padded:before {
			content: "    \00b7  ";
			font-size: 2em;
			position: relative;
			top: 5px;
		}
		#layout-wrap {
			position: relative;
		}
		#component-list {
			margin-bottom: 40px;
		}
	</style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
	<script src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0" charset="utf-8"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/plugins/mapify-bing.min.js")%>"></script>
	<script>
		jQuery(function ($) {

			$('select').change(function () {
				window.location = $(this).val();
			});

			$('.map')
				.mapify({
					bounds: { center: { latitude: 47.6155157, longitude: -122.3349151 }, width: 5, height: 5 },
					center: { latitude: 47.6155157, longitude: -122.3349151 },
					mapType: 'road',
					zoom: 14
				})
				.mapify('addPins', [{
					details: '<b>Avanade</b>',
					position: { latitude: 47.6155157, longitude: -122.3349151 },
					cssClass: 'icon-map-pin-blue-small',
					popup: '<div class="map-popup"><a type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></a><i class="icon-popup-arrow"></i><span class="map-popup-title">Avanade</span><br/>818 Stewart Street<br/>Suite 400<br/>Seattle, WA 98101<br/>Phone: +1 206 239 5600<ul class="list map-popup-links"><li><a href="#">Get Directions</a></li><li><a href="#">Station Details</a></li></ul></div>'
				}]);
		});
	</script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

	<div class="hide-for-test">
		<h1>Component Layout</h1>
		<p id="component-list">
			<select runat="server" id="components">
				<option value="?">(Select a component)</option>
			</select>
			<select runat="server" id="children">
				<option value="?">(Select a child component)</option>
			</select>
		</p>
	</div>

	<asp:PlaceHolder runat="server" Visible="<%# !String.IsNullOrEmpty(Component) %>">

		<h3 class="padded-over"><asp:Literal runat="server" ID="ComponentCode" /> <span class="small"><asp:Literal runat="server" ID="VariationDescription" /></span></h3>

		<div id="layout-wrap ">

			<div class="links hide-for-test">
				Layouts:
				<a href="#full">Full</a> |
				<a href="#3-1">3-1</a> |
				<a href="#2-2">2-2</a>
				<a href="#snippet" class="padded">Snippet</a>
				<a href="#changelog" class="padded">Changelog</a>
			</div>

			<h2 id="full" class="separator padded-over">Full Layout</h2>
			<div class="row">
				<div class="col-md-12 col-4 breakpoints">
					<asp:PlaceHolder runat="server" ID="FourColumn" />
				</div>
			</div>

			<h2 id="3-1" class="separator padded-over">3-1 Layout</h2>
			<div class="row">
				<div class="col-md-9 col-3 breakpoints">
					<asp:PlaceHolder runat="server" ID="ThreeColumn" />
				</div>
				<div class="col-md-3 col-1 breakpoints">
					<asp:PlaceHolder runat="server" ID="OneColumn" />
				</div>
			</div>

			<h2 id="2-2" class="separator padded-over">2-2 Layout</h2>
			<div class="row">
				<div class="col-md-6 col-2 breakpoints">
					<asp:PlaceHolder runat="server" ID="TwoColumn1" />
				</div>
				<div class="col-md-6 col-2 breakpoints">
					<asp:PlaceHolder runat="server" ID="TwoColumn2" />
				</div>
			</div>

			<% if (HttpContext.Current.IsNotRestricted()) { %>
			<div class="hide-for-test">
				<h2 id="snippet" class="separator padded-over">Snippet</h2>
				<ks:Snippet runat="server" ID="Snippet" />

				<h2 id="changelog" class="separator">Changelog</h2>
				<asp:Literal runat="server" ID="MissingChangelog" Visible="<%# (Changelog == null) %>">No changelog is available for this component</asp:Literal>
				<% if (Changelog != null) { %>
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Version</th>
								<th>Date</th>
								<th>Description</th>
							</tr>
						</thead>
						<tbody>
							<% foreach (var ver in Changelog.Versions.OrderByDescending(x => x.Version)) { %>
								<tr>
									<td><%= ver.Version %></td>
									<td><%= ver.Date.ToShortDateString() %></td>
									<td>
										<% foreach (var change in ver.Changes) { %>
										<p><%= change %></p>
										<% } %>
									</td>
								</tr>
							<% } %>
						</tbody>
					</table>
				</div>
				<% } %>
			</div>
			<% } %>

		</div>
	</asp:PlaceHolder>
</asp:Content>
