<%@ Page Title="Oltiva Home" Language="C#" %>

<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
	<script src="<%=ResolveUrl("~/content/vendor/angular/angular.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/angular/angular-sanitize.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/d3/d3.min.js")%>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/topojson/topojson.min.js")%>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/datamaps/datamaps.world.min.js")%>"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/apps/region-selector.min.js")%>"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

	<div ng-app="region-selector" ng-controller="RegionSelectorCtrl" class="ng-cloak">

		<div class="row">
			<div class="col-md-12 col-4">
				<div class="component component-margin-sm">
					<datamap height="400" options="mapOptions" supported-regions="supportedRegions" current-region="currentRegion" on-click="onMapClicked(geography)"></datamap>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-4">

				<!-- C01.1: Accordion -->
				<div class="component component-container panel-group" id="group-accordion" role="tablist" aria-multiselectable="true" accordion-trigger="currentGroupIndex">
					<div class="panel" ng-repeat="g in groups">
						<div class="panel-heading" role="tab" id="acc-hdr-{{$index}}">
							<a data-toggle="collapse" data-parent="#group-accordion" href="#acc-pnl-{{$index}}" aria-expanded="true" aria-controls="acc-pnl-{{$index}}">{{g.name}}</a>
							<a data-toggle="collapse" data-parent="#group-accordion" href="#acc-pnl-{{$index}}" aria-expanded="true" aria-controls="acc-pnl-{{$index}}"><i class="icon-circle-plus"></i></a>
						</div>
						<div id="acc-pnl-{{$index}}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="acc-hdr-{{$index}}">
							<div class="panel-body">
								<div class="row">
									<div class="col-sm-6 col-md-4 mb-sm" ng-repeat="r in g.regions">
										<h3><a href="javascript:;" ng-click="setCurrentRegion(r.code)">{{r.name}}</a></h3>
										<div ng-repeat="line in r.lines">
											<span>{{line.name}}</span>
											<p class="paragraph small">
												<span ng-repeat="s in line.sites">
													<span ng-show="$index > 0"> | </span><a ng-href="{{s.url}}">{{s.name}}</a>
												</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script type="text/plain" data-app="region-selector">
		{
			"API_ROOT" : "http://private-1d18b-locator2.apiary-mock.com/locator/",
			"INITIAL_REGION" : "COL",
			"MAP_OPTIONS": {
				"backgroundColor": "#B3E4F6",
				"fills": {
					"defaultFill": "#B3E3CA",
					"supported": "#80D0A6",
					"active": "#00A14D"
				},
				"geographyConfig": {
					"borderColor": "#80D0A6",
					"borderWidth": 1,
					"highlightOnHover": false,
					"highlightBorderColor": "#80D0A6",
					"highlightBorderWidth": 1,
					"highlightFillColor": "#B3E3CA"
				}
			},
			"GROUPS_REGIONS" : [{
					"name" : "Americas",
					"regions" : [{
							"code" : "COL",
							"name" : "Colombia",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "Español",
											"url" : "//www.essoymobil.com.co"
										}
									]
								}
							]
						}, {
							"code" : "CAN",
							"name" : "Canada",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "English",
											"url" : "//www.Oltiva.ca"
										}, {
											"name" : "Français",
											"url" : "//www.Oltiva.ca/fr"
										}
									]
								}
							]
						}
					]
				}, {
					"name" : "Asia Pacific",
					"regions" : [{
							"code" : "HKG",
							"name" : "Hong Kong",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "English",
											"url" : "//www.Oltiva.com.hk"
										}, {
											"name" : "繁體中文",
											"url" : "//www.Oltiva.com.hk/zh"
										}
									]
								}
							]
						}, {
							"code" : "SGP",
							"name" : "Singapore",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "English",
											"url" : "//www.Oltiva.com.sg"
										}
									]
								}
							]
						}, {
							"code" : "THA",
							"name" : "Thailand",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "English",
											"url" : ""
										}, {
											"name" : "Thai",
											"url" : ""
										}
									]
								}
							]
						}
					]
				}, {
					"name" : "Europe",
					"regions" : [{
							"code" : "BEL",
							"name" : "Belgium",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "Nederlands",
											"url" : "http://www.Oltiva.be"
										}, {
											"name" : "Français",
											"url" : "http://www.Oltiva.be/fr"
										}
									]
								}
							]
						}, {
							"code" : "CYP",
							"name" : "Cyprus",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "English",
											"url" : "http://www.Oltiva.com.cy/en"
										}, {
											"name" : "Eλληνικά",
											"url" : "http://www.Oltiva.com.cy"
										}
									]
								}
							]
						}, {
							"code" : "FRA",
							"name" : "France",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "English",
											"url" : "//www.Oltiva.ca"
										}, {
											"name" : "Français",
											"url" : "//www.Oltiva.ca/fr"
										}
									]
								}
							]
						}, {
							"code" : "DEU",
							"name" : "Germany",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "Deutsch",
											"url" : "http://www.Oltiva.de"
										}
									]
								}
							]
						}, {
							"code" : "ITA",
							"name" : "Italy",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "Italiano",
											"url" : "http://carburanti.Oltiva.it"
										}
									]
								}
							]
						}, {
							"code" : "LUX",
							"name" : "Luxembourg",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "Deutsch",
											"url" : "http://www.Oltiva.lu/de"
										}, {
											"name" : "Français",
											"url" : "http://www.Oltiva.lu"
										}
									]
								}, {
									"name" : "Oltiva",
									"sites" : [{
											"name" : "Deutsch",
											"url" : "http://www.Oltiva.lu/de"
										}, {
											"name" : "Français",
											"url" : "http://www.Oltiva.lu"
										}
									]
								}
							]
						}, {
							"code" : "NLD",
							"name" : "Netherlands",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "Nederlands",
											"url" : "http://www.Oltiva.nl"
										}
									]
								}
							]
						}, {
							"code" : "NOR",
							"name" : "Norway",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "Norsk",
											"url" : "http://www.Oltiva.no"
										}
									]
								}
							]
						}, {
							"code" : "GBR",
							"name" : "United Kingdom",
							"lines" : [{
									"name" : "Oltiva 1",
									"sites" : [{
											"name" : "English",
											"url" : "http://www.Oltiva.co.uk"
										}
									]
								}
							]
						}
					]
				}
			]
		}
	</script>

</asp:Content>
