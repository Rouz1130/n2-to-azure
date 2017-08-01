<%@ Page Title="Oltiva Home" Language="C#" %>

<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
	<script src="<%=ResolveUrl("~/content/vendor/d3/d3.min.js")%>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/topojson/topojson.min.js")%>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/angular/angular.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/angular/angular-sanitize.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/apps/region-selector.min.js")%>"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

	<div ng-app="region-selector" ng-controller="RegionSelectorCtrl" class="ng-cloak">

		<div class="row">
			<div class="col-md-9 col-3">
				<div class="component component-margin-sm">
					<world-map config="worldMapConfig"></world-map>
				</div>
			</div>
			<div class="col-md-3 col-1">

				<!-- C01.1: Accordion -->
				<div class="component component-container panel-group" id="group-accordion" role="tablist" aria-multiselectable="true" accordion-trigger="currentRegionIndex">
					<div class="panel" ng-repeat="r in regions" ng-show="r.countries.length">
						<div class="panel-heading" role="tab" id="acc-hdr-{{$index}}">
							<a data-toggle="collapse" data-parent="#group-accordion" href="#acc-pnl-{{$index}}" aria-expanded="true" aria-controls="acc-pnl-{{$index}}">{{r.name}}</a>
							<a data-toggle="collapse" data-parent="#group-accordion" href="#acc-pnl-{{$index}}" aria-expanded="true" aria-controls="acc-pnl-{{$index}}"><i class="icon-circle-plus"></i></a>
						</div>
						<div id="acc-pnl-{{$index}}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="acc-hdr-{{$index}}">
							<div class="panel-body">
								<div class="mb-sm" ng-repeat="c in r.countries">
									<h3>{{c.name}}</h3>
									<div ng-repeat="line in c.lines">
										<span>{{line.name}}</span>
										<p class="paragraph small">
											<span ng-repeat="s in line.sites">
												<span ng-show="$index > 0"> | </span><a ng-href="{{s.url}}" target="{{s.newWindow ? '_blank' : '_self'}}">{{s.name}}</a>
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

	<script type="text/plain" data-app="region-selector">
		{
			"API_ROOT" : "http://private-1d18b-locator2.apiary-mock.com/locator/",
			"TOPO_URL" : "<%= ResolveUrl("~/content/sci/js/data/Oltiva-topo.json") %>",
			"INITIAL_COUNTRY" : "CAN",
			"ZOOM" : {
				"window" : 0.8,
				"max" : 4
			},
			"REGIONS" : [{
					"name" : "Africa",
					"include" : "AGO,BFA,BDI,BEN,BWA,COD,CAF,COG,CIV,CMR,CPV,DJI,DZA,EGY,ESH,ERI,ETH,GAB,GHA,GMB,GIN,GNQ,GNB,IOT,KEN,COM,LBR,LSO,LBY,MAR,MDG,MLI,MRT,MUS,MWI,MOZ,NAM,NER,NGA,REU,RWA,SYC,SDN,SDS,SHN,SLE,SEN,SOM,SSD,STP,SWZ,TCD,TGO,TUN,TZA,UGA,MYT,ZAF,ZMB,ZWE",
					"countries" : []
				}, {
					"name" : "Asia Pacific",
					"include" : "AFG,ARE,ARM,AZE,BGD,BHR,BRN,BTN,CCK,CHN,CXR,GEO,HKG,IDN,IND,IOT,IRN,IRQ,ISR,JOR,JPN,KAS,KAZ,KGZ,KHM,KOR,KWT,LAO,LBN,LKA,MAC,MDV,MMR,MNG,MYS,NPL,OMN,PAK,PHL,PRK,PSE,QAT,SAU,SGP,SYR,THA,TJK,TKM,TLS,TUR,TWN,UZB,VNM,YEM,ASM,AUS,COK,FSM,GUM,KIR,MHL,MNP,NCL,NFK,NIU,NRU,NZL,PCN,PLW,PNG,PYF,SLB,TKL,TON,TUV,UMI,VUT,WLF,WSM",
					"countries" : [{
							"code" : "AUS",
							"name" : "Australia",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=AU",
											"newWindow" : true
										}
									]
								}
							]
						}, {
							"code" : "BHR",
							"name" : "Bahrain",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=BH"
										}
									]
								}
							]
						}, {
							"code" : "BGD",
							"name" : "Bangladesh",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=BD"
										}
									]
								}
							]
						}, {
							"code" : "KHM",
							"name" : "Cambodia",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=KH"
										}
									]
								}
							]
						}, {
							"code" : "CHN",
							"name" : "中國",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "中文",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=CN"
										}
									]
								}
							]
						}, {
							"code" : "FJI",
							"name" : "Fiji",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=FJ"
										}
									]
								}
							]
						}, {
							"code" : "GUM",
							"name" : "Guåhån",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=GU"
										}
									]
								}
							]
						}, {
							"code" : "HKG",
							"name" : "Hong Kong",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=HK"
										}
									]
								}
							]
						}, {
							"code" : "IND",
							"name" : "India",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=IN"
										}
									]
								}
							]
						}, {
							"code" : "IDN",
							"name" : "Indonesia",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=ID"
										}
									]
								}
							]
						}, {
							"code" : "ISR",
							"name" : "Israel",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=IL"
										}
									]
								}
							]
						}, {
							"code" : "JPN",
							"name" : " 日本",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "日本語",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=JP"
										}
									]
								}
							]
						}, {
							"code" : "JOR",
							"name" : "Jordan",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=JO"
										}
									]
								}
							]
						}, {
							"code" : "KAZ",
							"name" : "Казахстан",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "русский",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=KZ"
										}
									]
								}
							]
						}, {
							"code" : "KOR",
							"name" : "한국",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "한국어",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=KR"
										}
									]
								}
							]
						}, {
							"code" : "KWT",
							"name" : "Kuwait",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=KW"
										}
									]
								}
							]
						}, {
							"code" : "LBN",
							"name" : "Lebanon",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=LB"
										}
									]
								}
							]
						}, {
							"code" : "MYS",
							"name" : "مليسيا",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=MY"
										}
									]
								}
							]
						}, {
							"code" : "NZL",
							"name" : "New Zealand",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=NZ"
										}
									]
								}
							]
						}, {
							"code" : "OMN",
							"name" : "Oman",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=OM"
										}
									]
								}
							]
						}, {
							"code" : "PAK",
							"name" : "Pakistan",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=PK"
										}
									]
								}
							]
						}, {
							"code" : "PNG",
							"name" : "Papua New Guinea",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=PG"
										}
									]
								}
							]
						}, {
							"code" : "PHL",
							"name" : "Pilipinas",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=PH"
										}
									]
								}
							]
						}, {
							"code" : "QAT",
							"name" : "Qatar",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=QA"
										}
									]
								}
							]
						}, {
							"code" : "SAU",
							"name" : "السعودية",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=SA"
										}
									]
								}
							]
						}, {
							"code" : "SGP",
							"name" : "Singapore",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=SG"
										}
									]
								}
							]
						}, {
							"code" : "LKA",
							"name" : "Sri Lanka",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=LK"
										}
									]
								}
							]
						}, {
							"code" : "TWN",
							"name" : "Taiwan",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=TW"
										}
									]
								}
							]
						}, {
							"code" : "THA",
							"name" : "ประเทศไทย",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "ไทย",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=TH"
										}
									]
								}
							]
						}, {
							"code" : "TUR",
							"name" : "Türkiye",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Türk",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=TR"
										}
									]
								}
							]
						}, {
							"code" : "ARE",
							"name" : "UAE",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=AE"
										}
									]
								}
							]
						}, {
							"code" : "YEM",
							"name" : "Yemen",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=YE"
										}
									]
								}
							]
						}
					]
				}, {
					"name" : "Central America and the Caribbean",
					"include" : "ATG,AIA,ABW,BRB,BLM,BES,BHS,BLZ,CRI,CUB,CUW,DMA,DOM,GRD,GLP,GTM,HND,HTI,JAM,KNA,CYM,LCA,MAF,MTQ,MSR,NIC,PAN,PRI,SLV,SXM,TCA,TTO,VCT,VGB,VIR",
					"countries" : [{
							"code" : "CRI",
							"name" : "Costa Rica",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=CR"
										}
									]
								}
							]
						}, {
							"code" : "DOM",
							"name" : "República Dominicana",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=DO"
										}
									]
								}
							]
						}, {
							"code" : "GTM",
							"name" : "Guatemala",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=GT"
										}
									]
								}
							]
						}, {
							"code" : "HND",
							"name" : "Honduras",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=HN"
										}
									]
								}
							]
						}, {
							"code" : "JAM",
							"name" : "Jamaica",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=JM"
										}
									]
								}
							]
						}, {
							"code" : "NIC",
							"name" : "Nicaragua",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=NI"
										}
									]
								}
							]
						}, {
							"code" : "PAN",
							"name" : "Panamá",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=PA"
										}
									]
								}
							]
						}, {
							"code" : "PRI",
							"name" : "Puerto Rico",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=PR"
										}
									]
								}
							]
						}, {
							"code" : "SLV",
							"name" : "República de El Salvador",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=SV"
										}
									]
								}
							]
						}, {
							"code" : "HTI",
							"name" : "République d'Haïti",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "français",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=HT"
										}
									]
								}
							]
						}
					]
				}, {
					"name" : "Europe",
					"include" : "ALA,ALB,AND,ARM,AUT,AZE,BEL,BGR,BIH,BLR,CHE,CYP,CYN,CZE,DEU,DNK,ESP,EST,FIN,FRA,FRO,GBR,GEO,GGY,GIB,GRC,HRV,HUN,IMN,IRL,ISL,ITA,JEY,LIE,LTU,LUX,LVA,MCO,MDA,MKD,MLT,MNE,NLD,NOR,POL,PRT,ROU,RUS,SJM,SMR,  SRB,SVK,SVN,SWE,TUR,UKR,VAT",
					"countries" : [{
							"code" : "AUT",
							"name" : "Österreich",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Deutsche",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=AT"
										}
									]
								}
							]
						}, {
							"code" : "BLR",
							"name" : "Беларусь",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "русский",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=BY"
										}
									]
								}
							]
						}, {
							"code" : "BEL",
							"name" : "België",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Nederlands",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=BE&lang=NL"
										}
									]
								}
							]
						}, {
							"code" : "BGR",
							"name" : "Bulgaria",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=BG"
										}
									]
								}
							]
						}, {
							"code" : "HRV",
							"name" : "Croatia",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=HR"
										}
									]
								}
							]
						}, {
							"code" : "CYP",
							"name" : "Cyprus",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=CY"
										}
									]
								}
							]
						}, {
							"code" : "CZE",
							"name" : "Czech Republic",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=CZ"
										}
									]
								}
							]
						}, {
							"code" : "DNK",
							"name" : "Danmark",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "dansk",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=DK"
										}
									]
								}
							]
						}, {
							"code" : "EST",
							"name" : "Эстония",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "русский",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=EE"
										}
									]
								}
							]
						}, {
							"code" : "FIN",
							"name" : "Suomi",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "suomalainen",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=FI"
										}
									]
								}
							]
						}, {
							"code" : "FRA",
							"name" : "France",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "français",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=FR"
										}
									]
								}
							]
						}, {
							"code" : "DEU",
							"name" : "Deutschland",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Deutsche",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=DE"
										}
									]
								}
							]
						}, {
							"code" : "GRC",
							"name" : "Greece",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=GR"
										}
									]
								}
							]
						}, {
							"code" : "HUN",
							"name" : "Magyarország",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=HU"
										}
									]
								}
							]
						}, {
							"code" : "ISL",
							"name" : "Iceland",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=IS"
										}
									]
								}
							]
						}, {
							"code" : "ITA",
							"name" : "Italia",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "italiano",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=IT"
										}
									]
								}
							]
						}, {
							"code" : "KAZ",
							"name" : "Казахстан",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "русский",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=KZ"
										}
									]
								}
							]
						}, {
							"code" : "LVA",
							"name" : "Латвия",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "русский",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=LV"
										}
									]
								}
							]
						}, {
							"code" : "LTU",
							"name" : "Литва",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "русский",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=LT"
										}
									]
								}
							]
						}, {
							"code" : "LUX",
							"name" : "Luxembourg",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "français",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=LU"
										}
									]
								}
							]
						}, {
							"code" : "MNE",
							"name" : "Montenegro",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=ME"
										}
									]
								}
							]
						}, {
							"code" : "NLD",
							"name" : "Nederland",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Nederlands",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=NL"
										}
									]
								}
							]
						}, {
							"code" : "NOR",
							"name" : "Norge",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "norsk",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=NO"
										}
									]
								}
							]
						}, {
							"code" : "POL",
							"name" : "Polska",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Polskie",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=PL"
										}
									]
								}
							]
						}, {
							"code" : "PRT",
							"name" : "Portugal",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "português",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=PT"
										}
									]
								}
							]
						}, {
							"code" : "IRL",
							"name" : "Republic of Ireland",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=IE"
										}
									]
								}
							]
						}, {
							"code" : "ROU",
							"name" : "România",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=RO"
										}
									]
								}
							]
						}, {
							"code" : "RUS",
							"name" : "Россия",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "русский",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=RU"
										}
									]
								}
							]
						}, {
							"code" : "SRB",
							"name" : "Serbia",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=RS"
										}
									]
								}
							]
						}, {
							"code" : "SVK",
							"name" : "Slovakia",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=SK"
										}
									]
								}
							]
						}, {
							"code" : "ESP",
							"name" : "España",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=ES"
										}
									]
								}
							]
						}, {
							"code" : "SWE",
							"name" : "sverige",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "svensk",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=SE"
										}
									]
								}
							]
						}, {
							"code" : "CHE",
							"name" : "Schweiz",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Deutsche",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=CH"
										}
									]
								}
							]
						}, {
							"code" : "UKR",
							"name" : "Україна",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "український",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=UA"
										}
									]
								}
							]
						}, {
							"code" : "GBR",
							"name" : "United Kingdom",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=GB"
										}
									]
								}
							]
						}
					]
				}, {
					"name" : "North America",
					"include" : "CAN,GRL,MEX,USA",
					"countries" : [{
							"code" : "CAN",
							"name" : "Canada",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=CA&lang=EN"
										}, {
											"name" : "français",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=CA&lang=FR"
										}
									]
								}
							]
						}, {
							"code" : "MEX",
							"name" : "Méjico",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=MX"
										}
									]
								}
							]
						}, {
							"code" : "USA",
							"name" : "United States",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "English",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=US"
										}
									]
								}
							]
						}
					]
				}, {
					"name" : "South America",
					"include" : "ANT,BMU,CYM,SPM,UMI,ARG,BOL,BRA,CHL,COL,ECU,FLK,GUF,GUY,PER,PRY,SUR,URY,VEN",
					"countries" : [{
							"code" : "ARG",
							"name" : "Argentina",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=AR"
										}
									]
								}
							]
						}, {
							"code" : "BOL",
							"name" : "Bolivia",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=BO"
										}
									]
								}
							]
						}, {
							"code" : "BRA",
							"name" : "Brasil",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "português",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=BR"
										}
									]
								}
							]
						}, {
							"code" : "CHL",
							"name" : "Chile",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=CL"
										}
									]
								}
							]
						}, {
							"code" : "COL",
							"name" : "Colombia",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=CO"
										}
									]
								}
							]
						}, {
							"code" : "PRY",
							"name" : "Paraguay",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=PY"
										}
									]
								}
							]
						}, {
							"code" : "PER",
							"name" : "Perú",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=PE"
										}
									]
								}
							]
						}, {
							"code" : "ECU",
							"name" : "República del Ecuador",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=EC"
										}
									]
								}
							]
						}, {
							"code" : "URY",
							"name" : "Uruguay",
							"lines" : [{
									"name" : "Oltiva",
									"url" : null,
									"sites" : [{
											"name" : "Español",
											"url" : "http://lubes.Oltiva.com/GLP/Country?name=UY"
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
