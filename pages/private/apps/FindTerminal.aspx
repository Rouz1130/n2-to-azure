<%@ Page Title="Find Terminal" Language="C#" CodeBehind="FindTerminal.aspx.cs" Inherits="XOMFL.CommonComponents.Apps.FindTerminal" %>
<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
	<% if (MapProvider == "baidu") { %>
	<script src="//api.map.baidu.com/api?v=2.0&ak=4Kq2FM6g8buv7oQaYzt3t9cY"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/plugins/mapify-baidu.min.js")%>"></script>
	<% } else if (MapProvider == "google") { %>
	<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyA-KGBXETEq7H2ZKilTKAkwMY2hWIN4zro"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/plugins/mapify-google.min.js")%>"></script>
	<% } else { %>
	<script src="//ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0&s=1" charset="utf-8"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/plugins/mapify-bing.min.js")%>"></script>
	<% } %>

	<script src="<%=ResolveUrl("~/content/vendor/angular/angular.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/angular/angular-sanitize.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/apps/locator.min.js")%>"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

	<%
		var u = Request.ServerVariables["HTTP_USER_AGENT"];
		var b = new Regex(@"(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od|ad)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino", RegexOptions.IgnoreCase | RegexOptions.Multiline);
		var v = new Regex(@"1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-", RegexOptions.IgnoreCase | RegexOptions.Multiline);
		var isMobile = ((b.IsMatch(u) || v.IsMatch(u.Substring(0, 4))));
	%>

	<div ng-app="locator" ng-controller="LocatorCtrl" class="ng-cloak">

		<div class="component">
			<p>Switch map provider: <a href="?map=bing" target="_self">Bing</a> | <a href="?map=google" target="_self">Google</a> | <a href="?map=baidu" target="_self">Baidu</a></p>
		</div>

		<div class="row">
			<div class="col-lg-9 col-3 breakpoints">

				<% if (isMobile) { %>
				<p class="component">
					<a href="#map-lightbox" type="button" class="btn btn-primary" data-toggle="modal" data-target="#map-lightbox">View Map</a>
				</p>
				<% } %>

				<!-- A05.1: Search box -->
				<div class="component component-margin-sm search-box" data-event-name="xom.search-requested" data-search-key="q" data-cookie-name="EXXON_GLOBAL_COOKIE">
					<div class="form-group form-group-lg">
						<input type="text" class="form-control" placeholder="Search by country, state, city, postal code, or distributor name" ng-model="filters.q" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field", "sc_goals": "RTL-G7" }' />
						<span class="form-group-btn">
							<button class="btn btn-primary search" type="button" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field", "sc_goals": "RTL-G7" }'>Search</button>
						</span>
					</div>
				</div>

				<% if (!isMobile) { %>
				<div class="component">
					<div class="mb-md">
						<map settings="mapSettings" pins="mapPins" on-boundary-changed="onBoundaryChanged(boundary)" on-interaction="onMapInteraction(type)" on-pin-opened="onPinOpened(pin)"></map>
					</div>
					<div class="row mb-md">
						<div class="col-xs-3"><img src="<%=ResolveUrl("~/content/site/Oltiva-station.png")%>" alt="Alternate Text" /></div>
						<div class="col-xs-3"><img src="<%=ResolveUrl("~/content/site/Oltiva-station.png")%>" alt="Alternate Text" /></div>
						<div class="col-xs-3"><img src="<%=ResolveUrl("~/content/site/Oltiva-station.png")%>" alt="Alternate Text" /></div>
					</div>
				</div>
				<% } %>

				<% if (isMobile) { %>
				<div class="modal fade modal-layer-hide" id="map-lightbox" tabindex="-1" role="dialog" aria-labelledby="map-lightbox-label" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<div class="mb-md">
									<map settings="mapSettings" pins="mapPins" on-boundary-changed="onBoundaryChanged(boundary, isVisible)" on-interaction="onMapInteraction(type)" on-pin-opened="onPinOpened(pin)"></map>
								</div>
								<div class="row">
									<div class="col-xs-3"><img src="<%=ResolveUrl("~/content/site/Oltiva-station.png")%>" alt="Alternate Text" /></div>
									<div class="col-xs-3"><img src="<%=ResolveUrl("~/content/site/Oltiva-station.png")%>" alt="Alternate Text" /></div>
									<div class="col-xs-3"><img src="<%=ResolveUrl("~/content/site/Oltiva-station.png")%>" alt="Alternate Text" /></div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-cancel" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<% } %>

			</div>

			<div class="col-lg-3 col-1 breakpoints">
						
				<!-- Custom result list -->
				<div class="component component-scroll-vertical component-height-lg">
					<div class="station-locator-panel" ng-repeat="r in filteredResults">
						<div class="station-locator-data">
							<div class="station-locator-titles">
								<p>
									<img class="mr-xs" ng-src="{{r.BrandingImage}}" alt="{{r.DisplayName}}"/><a ng-href="StationDetails.aspx" data-analytics='{ "cg": "{{r.DisplayName}}", "cgs": "{{r.Id}}", "ct": "Link" }'>View station details</a>
								</p>
								<p>
									<span ng-show="r.DisplayName"><b>{{r.DisplayName}}</b><br /></span>
									<span ng-show="r.AddressLine1">{{r.AddressLine1}}<br /></span>
									<span ng-show="r.AddressLine2">{{r.AddressLine2}}<br /></span>
									{{r.City}}, {{r.StateProvince}} {{r.PostalCode}}<br />
									<a ng-href="tel:{{r.Telephone}}">{{r.Telephone}}</a>
								</p>
								<div class="mb-xs" ng-show="r.WeeklyOperatingDays || r.WeeklyOperatingHours">
									<span ng-bind-html="r.WeeklyOperatingDays"></span>
									<span ng-bind-html="r.WeeklyOperatingHours"></span>
								</div>
								<ul class="component component-margin-xs list list-img" ng-show="r.StoreAmenities.length">
									<li ng-repeat="a in r.StoreAmenities" class="mb-xs"><img ng-src="{{a.ImageSrc}}" alt="{{a.Name}}"/></li>
								</ul>
							</div>
						</div>
						<div class="station-locator-options">
							<% if (MapProvider == "baidu") { %>
							<a class="btn btn-secondary btn-sm btn-icon" target="_self" data-analytics='{ "sc_goals": "RTL-G4" }' ng-href="http://need-baidu-directions-url">
							<% } else if (MapProvider == "google") { %>
							<a class="btn btn-secondary btn-sm btn-icon" target="_self" data-analytics='{ "sc_goals": "RTL-G4" }' ng-href="https://maps.google.com?{{(userLocation ? 'saddr=' + userLocation.latitude + ',' + userLocation.longitude + '&' : '')}}daddr={{r.AddressLine1}}%20{{r.City}}%20{{r.StateProvince}}%20{{r.PostalCode}}">
							<% } else { %>
							<a class="btn btn-secondary btn-sm btn-icon" target="_self" data-analytics='{ "sc_goals": "RTL-G4" }' ng-href="http://bing.com/maps/default.aspx?rtp={{(userLocation ? 'pos.' + userLocation.latitude + '_' + userLocation.longitude : '')}}~adr.{{r.AddressLine1}}%20{{r.City}}%20{{r.StateProvince}}%20{{r.PostalCode}}">
							<% } %>
								<img class="icon" src="<%=ResolveUrl("~/content/sci/img/icons/icon-world-white.png")%>" />
								Get directions</a>
						</div>
						<hr />
					</div>
				</div>

			</div>
		</div>

		<string-template trigger="filteredResults" callback="onPinPopupHtmlReady(templates)" class="hidden">
			<div ng-repeat="r in filteredResults">
				<div class="map-popup-info mb-xs">
					<div class="map-popup-address">
						<span ng-show="r.DisplayName"><b>{{r.DisplayName}}</b><br /></span>
						<span ng-show="r.AddressLine1">{{r.AddressLine1}}<br /></span>
						<span ng-show="r.AddressLine2">{{r.AddressLine2}}<br /></span>
						{{r.City}}, {{r.StateProvince}} {{r.PostalCode}}<br/>
						<a ng-href="tel:{{r.Telephone}}">{{r.Telephone}}</a>
					</div>
					<div class="map-popup-logo">
						<img ng-src="{{r.BrandingImage}}" alt="{{r.DisplayName}}"/>
					</div>
				</div>
				<div class="mb-sm" ng-show="r.WeeklyOperatingDays || r.WeeklyOperatingHours">
					<span ng-bind-html="r.WeeklyOperatingDays"></span>
					<span ng-bind-html="r.WeeklyOperatingHours"></span>
				</div>
				<ul class="component component-margin-xs list list-img" ng-show="r.StoreAmenities.length">
					<li ng-repeat="a in r.StoreAmenities"><img ng-src="{{a.ImageSrc}}" alt="{{a.Name}}"/></li>
				</ul>
				<ul class="list map-popup-links">
					<li>
						<% if (MapProvider == "baidu") { %>
						<a target="_self" data-analytics='{ "sc_goals": "RTL-G4" }' ng-href="http://need-baidu-directions-url">
						<% } else if (MapProvider == "google") { %>
						<a target="_self" data-analytics='{ "sc_goals": "RTL-G4" }' ng-href="https://maps.google.com?{{(userLocation ? 'saddr=' + userLocation.latitude + ',' + userLocation.longitude + '&' : '')}}daddr={{r.AddressLine1}}%20{{r.City}}%20{{r.StateProvince}}%20{{r.PostalCode}}">
						<% } else { %>
						<a target="_self" data-analytics='{ "sc_goals": "RTL-G4" }' ng-href="http://bing.com/maps/default.aspx?rtp={{(userLocation ? 'pos.' + userLocation.latitude + '_' + userLocation.longitude : '')}}~adr.{{r.AddressLine1}}%20{{r.City}}%20{{r.StateProvince}}%20{{r.PostalCode}}">Get Directions</a>
						<% } %>
					</li>
					<li><a href="#">Details...</a></li>
				</ul>
			</div>
		</string-template>
	</div>

	<script type="text/plain" data-app="locator">
		{
			"MAP": {
				<% if (MapProvider == "bing") { %>
				"key": "AosRPyeyN8q-MWILWvfNCQikd8sy0_e4RFdjJu_QHuGHX6n9bzqdFdU9Cx9lYcGT",
				<% } %>
				<% if (MapProvider == "baidu") { %>
				"center": { "latitude": 39.9385449, "longitude": 116.1165908 },
				<% } else { %>
				"center": { "latitude": 32.8795, "longitude": -96.9398 },
				<% } %>
				"disableMouse": false,
				"disableZoom": false,
				"mapType": "road",
				"pin": {
					"image": "<%=ResolveUrl("~/content/sci/img/icons/icon-map-pin-blue-small.png")%>",
					"height": 34,
					"width": 20
				},
				"showScale": false,
				"zoom": 13
			},
			"LOCATOR": {
				"amenitiesUrl": "<%=ResolveUrl("~/api-mock/locator-amenities.json")%>",
				"apiPhraseKey": "searchkeyword",
				"apiResultsKey": "results",
				"boundaryApi": "<%=ResolveUrl("~/api/locator/?Latitude1={{latitude1}}&Latitude2={{latitude2}}&Longitude1={{longitude1}}&Longitude2={{longitude2}}&lat={{center.latitude}}&lon={{center.longitude}}")%>",
				"disableBoundarySearch": false,
				"disableGeolocation": false,
				"minVisibleFacetValues": 999,
				"phraseApi": "<%=ResolveUrl("~/api/locator/?q={{q}}")%>",
				"phraseEventName": "xom.search-requested",
				"pinStyleMap": {
					"field": "BrandingIcon",
					"values": {
						"A": "<%=ResolveUrl("~/content/sci/img/icons/icon-pin-dark-blue.png")%>",
						"B": "<%=ResolveUrl("~/content/sci/img/icons/icon-pin-red.png")%>",
						"P": "<%=ResolveUrl("~/content/sci/img/icons/icon-pin-gray.png")%>"
					}
				}
			}
		}
	</script>

</asp:Content>
