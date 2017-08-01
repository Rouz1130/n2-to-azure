<%@ Page Title="List A15 with facets" Language="C#" %>

<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
	<script src="<%=ResolveUrl("~/content/vendor/angular/angular.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/vendor/angular/angular-sanitize.min.js") %>"></script>
	<script src="<%=ResolveUrl("~/content/sci/js/apps/list.min.js")%>"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div ng-app="list" ng-controller="ListCtrl" class="ng-cloak">
		<div class="row">
			<div class="col-md-9 col-3">

				<h2>Search results<span ng-show="lastSearchPhrase && totalCount > 0"> for '{{lastSearchPhrase}}'</span></h2>

				<!-- Error message.  Need to determine what the production UX should be. -->
				<p ng-show="apiError"><b>Bummer.</b> {{apiError}}</p>

				<!-- A05.1: Search box -->
				<div class="component search-box" data-event-name="xom.search-requested" data-search-key="q" data-cookie-name="fl_last_searches">
					<div class="form-group form-group-lg">
						<input type="text" class="form-control" placeholder="Search for something" ng-model="filters.q" />
						<span class="form-group-btn">
							<button class="btn btn-primary search" type="button">Search</button>
						</span>
					</div>
					<div class="recent-searches">
						Your recent searches: <span class="recent-searches-links"></span>
					</div>
				</div>

				<div class="row">
					<div class="col-md-9">

						<h3 ng-show="totalCount == 0">There were no results for "{{filters.q}}".</h3>

						<!-- A15.1: Product list -->
						<div class="component table-responsive" ng-hide="totalCount < 1">
							<table class="table table-bordered product-list">
								<thead>
									<tr>
										<th colspan="2">Series</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="r in results">
										<td class="product-list-icon">
											<img class="product-list-img" ng-show="r.imageUrl" ng-src="{{r.imageUrl}}" />
										</td>
										<td class="product-list-description">
											<span class="product-list-title"><a href="{{r.url}}">{{r.title}}</a></span>
											<p class="small">{{r.description}}</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<a href="javascript:;" ng-show="results.length < totalCount" ng-click="loadMore()">Load more</a>

					</div>
					<div class="col-md-3" ng-hide="totalCount < 1">

						<!-- A07.1: Search filter -->
						<div class="component filter-form-wrapper" ng-repeat="f in facets" ng-hide="!f.values || !f.values.length">
							<div class="panel-group" id="facet-{{$index}}" role="tablist" aria-multiselectable="true">
								<div class="panel active">
									<div class="panel-heading" role="tab" id="heading-filter-one">
										<p><strong>{{f.name}}</strong></p>
									</div>
								</div>
								<div id="facet-panel-{{$index}}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-filter-one">
									<div class="panel-body">
										<div class="form-filter checkboxes">
											<div class="form-group" ng-repeat="v in f.values" ng-show="$index < listConfig.minVisibleFacetValues || isFacetOpen(f.key)">
												<input type="checkbox" id="facet-value-{{$parent.$index}}-{{$index}}" ng-checked="v.selected" ng-click="toggleFacetValue(v)" />
												<label for="facet-value-{{$parent.$index}}-{{$index}}"><span class="icon"></span>{{v.name}}</label>
											</div>
										</div>
									</div>
								</div>
								<a href="javascript:;" ng-show="f.values.length > listConfig.minVisibleFacetValues" ng-click="toggleFacetOpen(f.key)">
									<span ng-hide="isFacetOpen(f.key)">Show more</span>
									<span ng-show="isFacetOpen(f.key)">Show less</span>
								</a>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-md-3 col-1">
				[something else]
			</div>
		</div>

	</div>

	<script type="text/plain" data-app="list">
		{
			"LIST": {
				"apiUrl": "<%= ResolveUrl("~/api-mock/product-search.json") %>?component=productselector&sourcetype=All&lob=Industrial&language=en&facets=application,productcategory&q={{q}}&selectedfacets={{selectedFacets}}&ps={{pageSize}}&pn={{pageNumber}}",
				"disableGeolocation": true,
				"eventName": "xom.search-requested",
				"filters": {
					"pageSize": 10,
					"pageNumber": 1
				},
				"minVisibleFacetValues": 2,
				"searchOnLoad": false
			}
		}
	</script>

</asp:Content>
