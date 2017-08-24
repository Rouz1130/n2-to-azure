<%@ Page Title="Kitchen Sink" Language="C#" AutoEventWireup="True" CodeBehind="KitchenSink.aspx.cs" Inherits="XOMFL.CommonComponents.KitchenSink" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row" id="top">
		<div class="col-sm-12 col-md-9 col-3 ks-components">
			<h1>Kitchen Sink</h1>
			<asp:PlaceHolder runat="server" ID="Components" />
		</div>
		<div class="hidden-sm col-md-3 col-1 small">
			<ul class="ks-nav">
				<% if (HttpContext.Current.IsNotRestricted()) { %>
				<li><button type="button" class="btn btn-primary" data-toggle="collapse" data-target=".ks-snippet">Toggle snippets</button></li>
				<% } %>
				<li class="heading">Components</li>
				<asp:PlaceHolder runat="server" ID="Nav" />
			</ul>
		</div>
	</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
    <script src="//maps.googleapis.com/maps/api/js?key=AIzaSyA-KGBXETEq7H2ZKilTKAkwMY2hWIN4zro"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/plugins/mapify-google.min.js")%>"></script>
	<script>
		jQuery(function ($) {

			initMap();

			function initMap() {
				$('.map')
					.mapify({
						bounds: { center: { latitude: 47.6155157, longitude: -122.3349151 }, width: 5, height: 5 },
						center: { latitude: 47.6155157, longitude: -122.3349151 },
						mapType: 'road',
						zoom: 14,
						pin: {
							cssClass: "icon-map-pin-blue-small",
							image: "<%=ResolveUrl("~/content/sci/img/icons/icon-map-pin-blue-small.png")%>",
							height: 34,
							width: 20
						}
					})
					.mapify('setPins', [{
						details: '<b>Avanade</b>',
						position: { latitude: 47.6155157, longitude: -122.3349151 },
						popup: '<div class="map-popup"><a type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></a><i class="icon-popup-arrow"></i><span class="map-popup-title">Avanade</span><br/>818 Stewart Street<br/>Suite 400<br/>Seattle, WA 98101<br/>Phone: +1 206 239 5600<ul class="list map-popup-links"><li><a href="#">Get Directions</a></li><li><a href="#">Station Details</a></li></ul></div>'
					}]);
			}
		});
	</script>
</asp:Content>