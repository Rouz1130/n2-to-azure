<%@ Page Title="Equipment Builders" Language="C#" %>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
	<script defer src="<%=ResolveUrl("~/content/vendor/angular/angular.min.js")%>"></script>
	<script defer src="<%=ResolveUrl("~/content/sci/js/apps/drill-down.min.js")%>"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

	<div class="row ng-cloak" ng-app="drill-down" ng-controller="DrillDownCtrl" ng-cloak>
		<div class="col-md-12 col-4">

			<h3>Find your manufacturer to view recommended products</h3>

			<!-- A05.1: Search box -->
			<div class="component component-margin-sm search-box" data-event-name="xom.search-requested" data-search-key="q">
				<div class="form-group form-group-lg">
					<input type="text" class="form-control" placeholder="Search by manufacturer name" ng-model="filters.q" />
					<span class="form-group-btn">
						<button class="btn btn-primary search" type="button">Search</button>
					</span>
				</div>
			</div>

			<p ng-show="previousList"><a href="javascript:;" ng-click="goBack()">Back to {{previousList.title}}</a></p>

			<!-- A08: Smart list (flat) -->
			<div class="component smart-list" ng-show="list">
				<h3 class="h4">{{list.title}}</h3>
				<ul class="list" ng-repeat="g in list.groups">
					<li ng-repeat="r in g">
						<a href="javascript:;" ng-show="r.containsChildren" ng-click="loadList(r.url)">{{r.title}}</a>
						<a href="{{r.url}}" ng-hide="r.containsChildren">{{r.title}}</a>
					</li>
				</ul>
			</div>

		</div>
	</div>

	<script type="text/plain" data-app="drill-down">
		{
			"DRILL_DOWN": {
				"initialApiUrl": "http://private-8b888-equipmentbuilder.apiary-mock.com/builders/1?q={{q}}",
				"groupingRules": [{ "minItems": 30, "cols": 3 }, { "minItems": 20, "cols": 2 }, { "minItems": 0, "cols": 1 }],
				"phraseEventName": "xom.search-requested",
				"searchOnLoad": false
			}
		}
	</script>

</asp:Content>
