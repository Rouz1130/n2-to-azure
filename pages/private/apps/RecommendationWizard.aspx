<%@ Page Title="Product Selector" Language="C#" MasterPageFile="~/ProductSelector.master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div ng-app="product-selector" ng-cloak ng-controller="WizardCtrl">
		<h1>[Application] recommendations</h1>
		<a class="btn btn-primary pull-right">Talk to an expert</a>
		<p>Select your application and operating parameters to view product recommendations.</p>
		<br />
		<hr />
		<div class="wizard-lists">
			<div class="arrows">
				<button type="button" class="nav-prev" ng-click="setOffset(-1)">&#8249;</button>
				<button type="button" class="nav-next" ng-click="setOffset(1)">&#8250;</button>
			</div>
			<div class="lists-slider">
				<ul class="list" ng-repeat="list in lists" ng-class="{ 'list-recommendations': list.isRecommendation }">
					<li class="list-title">{{list.title}}</li>
					<li ng-repeat="option in list.options" ng-class="{'list-item-selected': option.isSelected}"><a href="javascript:;" ng-click="selectOption(list, option)">{{option.name}}</a></li>
				</ul>
				<a href="{{recommendationUrl}}" class="btn btn-tertiary view-recommendations" ng-class="{'view-recommendations-active': hasRecommendation}">View recommendations</a>
			</div>
			<div class="list-count">
				<i class="sm">1</i>
				<i class="md">3</i>
				<i class="lg">4</i>
			</div>
		</div>
	</div>
	<script type="text/plain" data-app="product-selector">
		{
			"API_ROOT": "http://private-7ea68-productselector.apiary-mock.com",
			"INITIAL_URL": "/products/recommendations?application=all"
		}
	</script>
</asp:Content>
