<%@ Page Title="Find Distributor" Language="C#" CodeBehind="FindDistributor.aspx.cs" Inherits="XOMFL.CommonComponents.Apps.FindDistributor" %>
<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
	<% if (MapProvider == "baidu") { %>
	<script src="//api.map.baidu.com/api?v=2.0&ak=gd0GyxGUxSCoAbmdyQBhyhrZ"></script>
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
	<div ng-app="locator" ng-controller="LocatorCtrl" class="ng-cloak">

		<div class="row">
			<div class="col-md-12 col-4">
				
				<!-- FO04.2 Checkbox inline -->
				<div class="component checkboxes form-inline">
					<div class="form-group" ng-repeat="a in locatorConfig.amenities">
						<input type="checkbox" id="amenity-{{$index}}" ng-model="a.selected" />
						<label for="amenity-{{$index}}"><span class="icon"></span>{{a.name}}</label>
					</div>
				</div>

				<!-- A05.1: Search box -->
				<div class="component search-box" data-event-name="xom.search-requested" data-search-key="q">
					<div class="form-group form-group-lg">
						<input type="text" class="form-control" placeholder="Search by country, state, city, postal code, or cemetery" ng-model="filters.q" />
						<span class="form-group-btn">
							<button class="btn btn-primary search" type="button">Search</button>
						</span>
					</div>
				</div>

				<!-- SP01.1: Map -->
				<div class="component" ng-class="{ 'component-invisible': !userLocation && !filteredResults.length }">
					<map settings="mapSettings" pins="mapPins" auto-boundary="mapAutoBoundary" on-boundary-changed="onBoundaryChanged(boundary)" on-boundary-adjust="onBoundaryAdjust(active)"></map>
				</div>

			</div>
		</div>

		<div class="row">
			<div class="col-md-3 col-1">

				<!-- A07.1: Search filter -->
				<div class="component filter-form-wrapper" ng-repeat="f in facets" ng-hide="!f.values || !f.values.length">
					<div class="panel-group" id="facet-{{$index}}" role="tablist" aria-multiselectable="true">
						<div class="panel active">
							<div class="panel-heading" role="tab" id="heading-filter-{{$index}}">
								<p><strong>{{f.name}}</strong></p>
							</div>
						</div>
						<div id="facet-panel-{{$index}}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-filter-{{$index}}">
							<div class="panel-body">
								<div class="form-filter checkboxes">
									<div class="form-group" ng-repeat="v in f.values" ng-show="$index < locatorConfig.minVisibleFacetValues || f.open">
										<input type="checkbox" id="facet-value-{{$parent.$index}}-{{$index}}" ng-checked="v.selected" ng-click="toggleFacetValue(v)" />
										<label for="facet-value-{{$parent.$index}}-{{$index}}"><span class="icon"></span>{{v.name}}</label>
									</div>
								</div>
							</div>
						</div>
						<a href="javascript:;" ng-show="f.values.length > locatorConfig.minVisibleFacetValues" ng-click="f.open = !f.open">
							<span ng-hide="f.open">Show more</span>
							<span ng-show="f.open">Show less</span>
						</a>
					</div>
				</div>

			</div>
			
			<div class="col-md-9 col-3">

				<!-- Results -->
				<div class="component station-locator-panel" ng-repeat="r in filteredResults">
					<div class="station-locator-data">
						<div class="station-locator-titles">
							<p><strong>{{r.Name}}</strong></p>
							<p ng-bind-html="r.WeeklyOperatingDays + ' ' + r.WeeklyOperatingHours"></p>
						</div>
						<div class="station-locator-point">
							<i class="icon icon-pin-small"></i>
							<span>{{r.Address1}} {{r.City}}, {{r.StateProvince}} {{r.PostalCode}}</span>
						</div>
						<div class="station-locator-information">
							<div class="station-telephone">
								<i class="icon icon-telephone"></i>
								<span>{{r.Telephone1}}</span>
							</div>
						</div>
						<p ng-show="r.StoreAmenities.length">
							<img ng-repeat="a in r.StoreAmenities" ng-src="{{a.Image}}" alt="{{a.Name}}"/>
						</p>
					</div>
					<div class="station-locator-options">
						<a class="btn btn-secondary btn-sm btn-icon" href="#">
							<img class="icon" src="<%=ResolveUrl("~/content/sci/img/icons/icon-world-white.png")%>" />
							Get directions</a>
					</div>
				</div>

			</div>
		</div>

		<string-template trigger="filteredResults" callback="onPinPopupHtmlReady(templates)" class="hidden">
			<div ng-repeat="r in filteredResults">
				<p>
					<span class="map-popup-title">{{r.Name}}</span><br/>
					{{r.AddressLine1}}<br/>
					{{r.City}}, {{r.StateProvince}} {{r.PostalCode}}<br/>
					{{r.Telephone1}}
				</p>
				<ul class="component component-margin-xs list list-img" ng-show="r.StoreAmenities.length">
					<li ng-repeat="a in r.StoreAmenity"><img ng-src="{{a.Image}}" alt="{{a.Name}}"/></li>
				</ul>
				<ul class="list map-popup-links">
					<li><a href="#">Get Directions</a></li>
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
				"center": { "latitude": 47.6147624, "longitude": -122.4763314 },
				<% } %>
				"disableMouse": false,
				"disableZoom": false,
				"mapType": "road",
				"pin": {
					"cssClass": "icon-pin-small",
					"image": "<%=ResolveUrl("~/content/sci/img/icons/icon-pin-small.png")%>",
					"height": 34,
					"width": 20
				},
				"showScale": false,
				"zoom": 8
			},
			"LOCATOR": {
				"amenities": [
					{ "name": "Plenti", "selected": true },
					{ "name": "UBER MC", "selected": true }
				],
				"apiPhraseKey": "searchkeyword",
				"apiResultsKey": "results",
				"boundaryApi": null,
				"disableBoundarySearch": true,
				"disableGeolocation": true,
				"minVisibleFacetValues": 2,
				"phraseApi": "<%=ResolveUrl("~/api-mock/distributor-locator.json?q={{q}}&selectedFacets={{selectedFacets}}")%>",
				"phraseEventName": "xom.search-requested"
			}
		}
	</script>

</asp:Content>
