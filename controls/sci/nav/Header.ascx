<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.Xomfl.Nav.Header" CodeBehind="~/controls/sci/nav/Header.ascx.cs" %>
<%@ Register TagPrefix="xom" TagName="MegaNav" Src="~/controls/sci/nav/MegaNav.ascx" %>

<header class="nav-header">
	<div class="nav-wrapper">
		<div class="nav-top-bar">
			<div class="nav-top-bar-left">
				<ul class="nav-lines-brands">
					<li><a href="#" data-global-selector="business_lines"><span class="nav-mobile">Business</span><span class="nav-tablet-up">Business lines</span></a></li>
					<li><a href="#" data-global-selector="global_brands"><span class="nav-mobile">Brands</span><span class="nav-tablet-up">Global brands</span></a></li>
				</ul>
			</div>
			<div class="nav-top-bar-right <%= Social.Any() ? "has-social" : "no-social" %>  <%= Languages.Length > 1 ? "has-languages" : "no-languages" %>">
				<% if (Languages.Length > 1) { %>
				<div class="nav-language">
					<a href="#" class="nav-language-current class-toggle" data-target=".nav-language" data-class-name="nav-language-open"><%= Language %></a>
					<ul class="nav-language-list">
						<% foreach (var lang in Languages) { %>
						<li <%= lang == Language ? "class=\"selected\"" : "" %>><a href="?lang=<%= lang %>"><%= lang %></a></li>
						<% } %>
					</ul>
				</div>
				<% } %>
				<ul class="nav-country">
					<li>
						<a href="#" data-global-selector="Oltiva">
							<i class="icon icon-globe-small"></i>
							<span class="nav-country-text <%= !HasCountrySelection ? "hidden-xs" : "" %>">
								<span class="hidden-xs"><%= CountryName %></span>
								<span class="visible-xs-inline"><%= CountryAbbrev %></span>
							</span>
						</a>
					</li>
				</ul>
				<% if (Social.Any()) { %>
				<div class="nav-social <%= Social.Length < 4 ? "nav-social-few" : null %>">
					<a href="#" class="nav-social-trigger">Social</a>
					<ul class="nav-social-icons">
						<% foreach (var social in Social) { %>
						<li><a href="#" class="nav-<%= social.ToLower() %>"><i class="icon icon-<%= social.ToLower() %>-round"></i></a></li>
						<% } %>
					</ul>
				</div>
				<% } %>
			</div>
		</div>
		<div class="nav-main-bar">
			<a href="<%=ResolveUrl("~/")%>" class="logo">
				<img src="<%= ResolveUrl("~/content/sci/img/logos/exxon_fuels.svg") %>" data-no-svg="<%= ResolveUrl("~/content/sci/img/logos/logo-nav-ie8.png") %>" />
			</a>
			<a href="#" class="nav-main-item nav-main-list-trigger">
				<i class="icon-hamburger"></i>
				<span class="nav-main-item-text">Menu</span>
			</a>
			<a href="#" class="nav-main-item nav-main-search-trigger">
				<span class="nav-main-item-text">Search</span>
			</a>
			<ul class="nav-main-list">
				<li class="nav-main-item" rel="energy"><a href="#" data-analytics='{ "cg": "Quality fuels", "csg": "test-csg", "cn": "test-cn", "ct": "test-ct", "sc_track": "CLICK-NAV", "sc_goals": "GOAL1,GOAL2" }'><span>Quality fuels</span></a></li>
				<li class="nav-main-item" rel="technology"><a href="#" data-analytics='{ "cg": "Gas cards and payment", "csg": "test-csg", "cn": "test-cn", "ct": "test-ct", "sc_track": "CLICK-NAV", "sc_goals": "GOAL1,GOAL2" }'><span>Gas cards and payment</span></a></li>
				<li class="nav-main-item" rel="issues"><a href="#" data-analytics='{ "cg": "Motor oil", "csg": "test-csg", "cn": "test-cn", "ct": "test-ct", "sc_track": "CLICK-NAV", "sc_goals": "GOAL1,GOAL2" }'><span>Motor oil</span></a></li>
				<li class="nav-main-item" rel="environment"><a href="#" data-analytics='{ "cg": "Our stations", "csg": "test-csg", "cn": "test-cn", "ct": "test-ct", "sc_track": "CLICK-NAV", "sc_goals": "GOAL1,GOAL2" }'><span>Our stations</span></a></li>
				<li class="nav-main-item" rel="community"><a href="#" data-analytics='{ "cg": "Rewards and promotions", "csg": "test-csg", "cn": "test-cn", "ct": "test-ct", "sc_track": "CLICK-NAV", "sc_goals": "GOAL1,GOAL2" }'><span>Rewards and promotions</span></a></li>
				<li class="nav-main-item" rel="company"><a href="#" data-analytics='{ "cg": "About Oltiva and Oltiva", "csg": "test-csg", "cn": "test-cn", "ct": "test-ct", "sc_track": "CLICK-NAV", "sc_goals": "GOAL1,GOAL2" }'><span>About Oltiva and Oltiva</span></a></li>
			</ul>
		</div>
		<xom:MegaNav runat="server" />
	</div>
	<fieldset class="nav-main-search search-box" data-url="<%= ResolveUrl("~/pages/SearchResults.aspx") %>" data-search-key="q">
		<input type="text" autocomplete="off" placeholder="Search for topics, articles, data..." aria-relevant="all" aria-autocomplete="both" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field" }'>
		<button type="button" class="nav-main-search-submit search" data-analytics='{ "manual": true, "cg": "Search", "ct": "Button" }'>Search</button>
	</fieldset>
	<div class="nav-header-divider"></div>
</header>
<ks:Component runat="server" Code="A01.2" Margin="none" />
