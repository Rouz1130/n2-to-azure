<%@ Control Language="C#" Inherits="System.Web.UI.UserControl" %>

<nav id="nav-main-mobile">
	<ul class="nav-main-mobile-panel nav-main-mobile-panel-menu nav-main-mobile-panel-active" id="mm-0">
		<li class="nav-main-mobile-logo">
			<a href="#" class="logo">
				<img src="<%= ResolveUrl("~/content/sci/img/logos/logo.png") %>" />
			</a>
		</li>
		<li class="top-level"><a href="#plan">plan a funeral or cremation</a></li>
		<li class="top-level"><a href="#">obituaries and services</a></li>
		<li class="top-level"><a href="#">support friends and family</a></li>
		<li class="top-level"><a href="#">find funeral home or cemetery</a></li>
		<li><a href="#">Bill pay</a></li>
		<li><a href="#">Help</a></li>
        <li><a href="#">English</a></li>
	</ul>
    <ul class="nav-main-mobile-panel" id="plan">
		
		<li><h3>Immediate need</h3>Death has occured or is near</li>
        <li><h3>Plan ahead</h3>preplan a funeral or cremation</li>
	</ul>
</nav>