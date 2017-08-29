<%@ Page Title="GDL" Language="C#" Inherits="System.Web.UI.Page" %>
<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
	<script src="//ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0&s=1" charset="utf-8"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/plugins/mapify-bing.js")%>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/angular/angular.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/angular/angular-sanitize.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/apps/gdl.min.js")%>"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div ng-app="gdl" ng-controller="GdlCtrl" class="ng-cloak">

		<div class="row">
			<div class="col-xs-12 col-4">

				<!-- A05.1: Search box -->
				<div class="component component-margin-sm search-box" data-event-name="xom.search-requested" data-search-key="q">
					<div class="form-group form-group-lg">
						<input type="text" class="form-control" placeholder="Search by city or state" ng-model="filters.q" />
						<span class="form-group-btn">
							<button class="btn btn-primary search" type="button">Search</button>
						</span>
					</div>
				</div>

				<!-- A17.3: Warning -->
				<div class="component component-margin-sm alert alert-warning" role="alert" ng-class="{ hidden: !countryIsSelected }">
				
					<p>
						
						You have selected a country.  Please enter a city or state name to narrow your search.
					</p>
				</div>

				<!-- A17.3: Warning -->
				<div class="component component-margin-sm alert alert-warning" role="alert" ng-class="{ hidden: !searchFailed }">
					
					<p>
						
						We could not find any cemeteries for your location. Please try a search for a different location.
						Can't find a location are looking for? Try searching for a province, state, or country.
					</p>
				</div>

				<div class="hidden-xs hidden-sm">
					<!-- SP01.1: Map -->
					<div class="component">
						<map settings="mapSettings" pins="mapPins" auto-boundary="autoBoundary" on-geocode="onGeocode(result)" on-interaction="onMapInteraction(type)" on-pin-opened="onPinOpened(pin)"></map>
					</div>
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
									<div class="form-group" ng-repeat="v in f.values">
										<input type="checkbox" id="facet-value-{{$parent.$index}}-{{$index}}" ng-checked="v.selected" ng-click="onFilterValueClick(f, v)" />
										<label for="facet-value-{{$parent.$index}}-{{$index}}"><span class="icon"></span>{{v.name}}</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-md-9 col-3">
						
				<!-- Custom result list -->
				<div class="component component-scroll-vertical component-height-lg">
					<div class="station-locator-panel" ng-repeat="r in searchResults">
						<div class="station-locator-data">
							<div class="station-locator-titles">
								<div ng-show="r.Name"><b>{{r.Name}}</b></div>
								<div ng-show="r.Address1">{{r.Address1}}</div>
								<div ng-show="r.Address2">{{r.Address2}}</div>
								{{r.City}}, {{r.StateProvince}} {{r.PostalCode}}
								<div ng-show="r.Telephone1"><a ng-href="tel:{{r.Telephone1}}">{{r.Telephone1}}</a></div>
								<div ng-show="r.Telephone2"><a ng-href="tel:{{r.Telephone2}}">{{r.Telephone2}}</a></div>
								<div ng-show="r.WebSite"><a ng-href="{{r.WebSite}}">{{r.WebSite}}</a></div>
							</div>
						</div>
						<hr />
					</div>
				</div>

			</div>
		</div>

		<string-template trigger="templateTrigger" callback="onPinPopupHtmlReady(templates)" class="hidden">
			<div ng-repeat="r in searchResults">
				<div class="map-popup-info">
					<div class="map-popup-address">
						<div ng-show="r.Name"><b>{{r.Name}}</b></div>
						<div ng-show="r.Address1">{{r.Address1}}</div>
						<div ng-show="r.Address2">{{r.Address2}}</div>
						{{r.City}}, {{r.StateProvince}} {{r.PostalCode}}
						<div ng-show="r.Telephone1"><a ng-href="tel:{{r.Telephone1}}">{{r.Telephone1}}</a></div>
						<div ng-show="r.Telephone2"><a ng-href="tel:{{r.Telephone2}}">{{r.Telephone2}}</a></div>
						<div ng-show="r.WebSite"><a ng-href="{{r.WebSite}}">{{r.WebSite}}</a></div>
					</div>
				</div>
			</div>
		</string-template>
	</div>

	<script type="text/plain" data-app="gdl">
		{
			"MAP": {
				"key": "AosRPyeyN8q-MWILWvfNCQikd8sy0_e4RFdjJu_QHuGHX6n9bzqdFdU9Cx9lYcGT",
				"center": "United States",
				"disableMouse": false,
				"disablePan": true,
				"disableZoom": true,
				"mapType": "road",
				"pin": {
					"cssClass": "icon-map-pin-blue-small",
					"image": "<%=ResolveUrl("~/content/sci/img/icons/icon-map-pin-blue-small.png")%>",
					"height": 34,
					"width": 20
				},
				"showScale": false,
				"zoom": 4
			},
			"GDL": {
				"centerPin": {
					"cssClass": "icon-map-pin-red-small",
					"image": "<%=ResolveUrl("~/content/sci/img/icons/icon-map-pin-red-small.png")%>",
					"height": 34,
					"width": 20
				},
				"distributorIdField" : "Id",
				"facets" : [],
				"searchEventName": "xom.search-requested",
				"searchApi": "<%=ResolveUrl("~/api/gdl/?Latitude={{latitude}}&Longitude={{longitude}}&Country={{countryRegion}}&selectedFacets={{selectedFacets}}")%>"
			}
		}
	</script>

</asp:Content>
