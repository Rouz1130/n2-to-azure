<%@ Page Title="Find Station" Language="C#" CodeBehind="FindStation.aspx.cs" Inherits="XOMFL.CommonComponents.Apps.FindStation" %>
<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
	
	<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyA-KGBXETEq7H2ZKilTKAkwMY2hWIN4zro"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/plugins/mapify-google.js")%>"></script>
	

	<script src="<%=ResolveUrl("~/content/vendor/angular/angular.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/angular/angular-sanitize.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/apps/locator.js")%>"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div ng-app="locator" ng-controller="LocatorCtrl" class="ng-cloak">

		<div class="component">
			<p>Notes:
				<ul>
					<li>If you allow browser geodetection, the map should appear for your location.</li>
					<li>The API results are mocked, and the following searches are supported: "seattle", "dallas", and "china".</li>
					<li>If you drag/zoom the map, a boundary search will occur.  If your latitude is 47, 32, or 34, then you'll get the static results for Seattle, Dallas, or China, respectively.</li>
					
				</ul>
			</p>
				</div>

		<div class="row">
			<div class="col-lg-9 col-3 breakpoints">

				<!-- A05.1: Search box -->
				<div class="component component-margin-sm search-box" data-event-name="xom.search-requested" data-search-key="q" data-cookie-name="EXXON_GLOBAL_COOKIE">
					<div class="form-group form-group-lg">
						<input type="text" class="form-control" placeholder="Search by country, state, city, postal code, or cemetery" ng-model="filters.q" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field", "sc_goals": "RTL-G7" }' />
						<span class="form-group-btn">
							<button class="btn btn-primary search" type="button" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field", "sc_goals": "RTL-G7" }'>Search</button>
						</span>
					</div>
				</div>

				<!-- FO04.2 Checkbox inline -->
				<div class="row component checkboxes form-inline">
					<div class="col-xs-12 col-sm-6 col-lg-4" ng-repeat="a in amenities">
						<div class="form-group">
							<input type="checkbox" id="amenity-{{$index}}" ng-model="a.selected" ng-click="onBeforeFilterClick(a)" />
							<label for="amenity-{{$index}}"><span class="icon"></span>{{a.Name}}</label>
						</div>
					</div>
				</div>

				<!-- SP01.1: Map -->
				<div class="component">
					<map settings="mapSettings" pins="mapPins" on-boundary-changed="onBoundaryChanged(boundary)" on-interaction="onMapInteraction(type)" on-pin-opened="onPinOpened(pin)"></map>
				</div>

				<!-- L01.3: 3-up list -->
				<ul class="component list list-3-up">
					<li class="breakpoints"><img src="<%=ResolveUrl("~/content/site/Oltiva-station.png")%>" alt="Alternate Text" /></li>
					<li class="breakpoints"><img src="<%=ResolveUrl("~/content/site/Oltiva-station.png")%>" alt="Alternate Text" /></li>
					<li class="breakpoints"><img src="<%=ResolveUrl("~/content/site/Oltiva-station.png")%>" alt="Alternate Text" /></li>
				</ul>

			</div>

			<div class="col-lg-3 col-1 breakpoints">

				<div class="hidden-xs hidden-sm">
					<!-- SP07.2: App Promotion -->
					<div class="component app-promotion app-promotion-mini">
						<div class="app-content">
							<p>This is a callout box</p>
						</div>
						<div class="app-content-links">
							 <a href="#" class="app-promotion-ios">CTA link</a>
						</div>
					</div>
				</div>
						
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
				"languageCode": null,
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
