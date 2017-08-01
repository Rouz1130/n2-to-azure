<%@ Page Title="Equipment Builders" Language="C#" MasterPageFile="~/ProductSelector.master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

	<div ng-app="product-selector">
		<div class="row">
			<div class="col-md-12 col-4">
				<div class="component breadcrumb-panel">
					<ul class="breadcrumb-list">
						<li class="glyph-link"><a href="#">Oltiva</a></li>
						<li class="glyph-link"><a href="#">Industrial</a></li>
						<li class="glyph-link"><a href="#">Products</a></li>
						<li class="glyph-link"><a href="#">All equipment builders</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-4">
				<div class="component screen-title screen-title-overlay">
					<div class="screen-title-copy-wrap">
						<h3>All equipment builders</h3>
						<p class="paragraph screen-title-copy">
							Oditatiis vendigni que ne vollupta sant aut veriam fugianis consectia quis explam, sint etur, quod que quam voluptiassum dolo quasperi to ommoluptae ped moloriatum.
						</p>
						<p class="screen-title-cta">
							<button class="btn btn-primary">Talk to an expert</button>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row" ng-controller="SelectorCtrl" ng-cloak>
			<div class="col-md-12 col-4">
				<h3>Find your manufacturer to view recommended products</h3>
			</div>
			<div class="col-md-3 col-1">
				<div class="component component-margin-xs">
					<div class="search-box search-box-small form-group">
						<input type="text" class="form-control" placeholder="Search" />
						<span class="form-group-btn"></span>
					</div>
				</div>
				<div class="component component-margin-xs filter-form-wrapper">
					<div class="panel-group" id="filter-category1" role="tablist" aria-multiselectable="true">
						<div class="panel active">
							<div class="panel-heading" role="tab" id="filter-category1-heading">
								<p><strong>Category 1: </strong>hydraulic oil, filter two, filter three <a data-toggle="collapse" data-parent="#filter-category1" href="#filter-category1-panel" aria-expanded="true" aria-controls="filter-category1-form"><strong>(edit)</strong></a></p>
							</div>
						</div>
						<div class="panel-body">
							<div id="filter-category1-form" class="form-filter">
								<div class="filter-checkbox-wrapper form-group">
									<input type="checkbox" id="filter-category1-opt1" />
									<label for="filter-category1-opt1"><span class="icon"></span>Option 1</label>
								</div>
								<div class="filter-checkbox-wrapper form-group">
									<input type="checkbox" id="filter-category1-opt2" />
									<label for="filter-category1-opt2"><span class="icon"></span>Option 2</label>
								</div>
								<div id="filter-category1-panel" class="panel-collapse collapse" role="tabpanel" aria-labelledby="filter-category1-heading">
									<div class="filter-checkbox-wrapper form-group">
										<input type="checkbox" id="filter-category1-opt3" />
										<label for="filter-category1-opt3"><span class="icon"></span>Option 3</label>
									</div>
									<div class="filter-checkbox-wrapper form-group">
										<input type="checkbox" id="filter-category1-opt4" />
										<label for="filter-category1-opt4"><span class="icon"></span>Option 4</label>
									</div>
									<div class="filter-checkbox-wrapper form-group">
										<input type="checkbox" id="filter-category1-opt5" />
										<label for="filter-category1-opt5"><span class="icon"></span>Option 5</label>
									</div>
									<input type="submit" class="btn-secondary btn-sm" value="Apply Filter" />
									<input type="reset" class="btn-deemphasized btn-sm" data-toggle="collapse" data-parent="#filter-category1" href="#filter-category1-panel" aria-expanded="true" aria-controls="filter-category1-form" value="Cancel" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="component component-margin-xs filter-form-wrapper">
					<div class="panel-group" id="filter-category2" role="tablist" aria-multiselectable="true">
						<div class="panel active">
							<div class="panel-heading" role="tab" id="filter-category2-heading">
								<p><strong>Category 2: </strong>hydraulic oil, filter two, filter three <a data-toggle="collapse" data-parent="#filter-category2" href="#filter-category2-panel" aria-expanded="true" aria-controls="filter-category2-form"><strong>(edit)</strong></a></p>
							</div>
						</div>
						<div class="panel-body">
							<div id="filter-category2-form" class="form-filter">
								<div class="filter-checkbox-wrapper form-group">
									<input type="checkbox" id="filter-category2-opt1" />
									<label for="filter-category2-opt1"><span class="icon"></span>Option 1</label>
								</div>
								<div class="filter-checkbox-wrapper form-group">
									<input type="checkbox" id="filter-category2-opt2" />
									<label for="filter-category2-opt2"><span class="icon"></span>Option 2</label>
								</div>
								<div id="filter-category2-panel" class="panel-collapse collapse" role="tabpanel" aria-labelledby="filter-category2-heading">
									<div class="filter-checkbox-wrapper form-group">
										<input type="checkbox" id="filter-category2-opt3" />
										<label for="filter-category2-opt3"><span class="icon"></span>Option 3</label>
									</div>
									<div class="filter-checkbox-wrapper form-group">
										<input type="checkbox" id="filter-category2-opt4" />
										<label for="filter-category2-opt4"><span class="icon"></span>Option 4</label>
									</div>
									<div class="filter-checkbox-wrapper form-group">
										<input type="checkbox" id="filter-category2-opt5" />
										<label for="filter-category2-opt5"><span class="icon"></span>Option 5</label>
									</div>
									<input type="submit" class="btn-secondary btn-sm" value="Apply Filter" />
									<input type="reset" class="btn-deemphasized btn-sm" data-toggle="collapse" data-parent="#filter-category2" href="#filter-category2-panel" aria-expanded="true" aria-controls="filter-category2-form" value="Cancel" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9 col-3">
				<div class="component smart-list-alphabetical">
					<ul class="list smart-list-alphabetical-index">
						<li ng-repeat="letter in alphabet"><a href="#" ng-click="applyFilter()" ng-show="sectionLetters[letter]">{{letter}}</a><span ng-hide="sectionLetters[letter]">{{letter}}</span></li>
					</ul>
					<div class="smart-list smart-list-alphabetical-columns">
						<div class="list" ng-repeat="group in results.groups">
							<ul class="list smart-list-alphabetical-section smart-list-disabled" ng-repeat="section in group.sections | filter: search">
								<li>{{section.letter}}</li>
								<li ng-repeat="link in section.links"><a href="{{link.url}}">{{link.text}}</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" ng-controller="SelectorCtrl" ng-cloak>
			<div class="col-md-12 col-4">
				<div class="component well">
					<p>
						<span>Don't see your manufacturer?</span> You can search for products by application, equipment builder, product series, or specification.
						<a href="#secondary-application" class="btn btn-secondary pull-right" data-toggle="collapse">Learn more</a>
					</p>
					<div id="secondary-application" class="row collapse">
						<div class="col-md-3 col-1">
							[filters]
						</div>
						<div class="col-md-9 col-3">
							<div class="component smart-list-alphabetical">
								<ul class="list smart-list-alphabetical-index">
									<li ng-repeat="letter in alphabet"><a href="#" ng-click="applyFilter()" ng-show="sectionLetters[letter]">{{letter}}</a><span ng-hide="sectionLetters[letter]">{{letter}}</span></li>
								</ul>
								<div class="smart-list smart-list-alphabetical-columns">
									<div class="list" ng-repeat="group in results.groups">
										<ul class="list smart-list-alphabetical-section smart-list-disabled" ng-repeat="section in group.sections | filter: search">
											<li>{{section.letter}}</li>
											<li ng-repeat="link in section.links"><a href="{{link.url}}">{{link.text}}</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6 col-3 breakpoints">
			<div class="component featured-item featured-title-split-left">
				<div class="featured-title-copy-wrap">
					<img class="featured-title-image" src="<%=ResolveUrl("~/content/site/header-small.jpg")%>">
					<div class="featured-title-copy">
						<h3 class="featured-item-subtitle">The cost effective solution</h3>
						<p>Featured item description Nullam auctor odio tortor, sed accumsan ligula suscipit non. Sed vulputate, dui ac bibendum molestie, elit ligula.</p>
						<button class="btn btn-primary">Call-to-action</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-3 breakpoints">
			<div class="component featured-item featured-title-split-left">
				<div class="featured-title-copy-wrap">
					<img class="featured-title-image" src="<%=ResolveUrl("~/content/site/header-small.jpg")%>">
					<div class="featured-title-copy">
						<h3 class="featured-item-subtitle">Cross-promotion title</h3>
						<p>Featured item description Nullam auctor odio tortor, sed accumsan ligula suscipit non. Sed vulputate, dui ac bibendum molestie, elit ligula.</p>
						<button class="btn btn-primary">Call-to-action</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="PageStyles">
	<style type="text/css">
		.well {
			background-color: #eee;
			padding: 15px;
		}
		#secondary-application {
			padding-top: 30px;
		}
	</style>
</asp:Content>