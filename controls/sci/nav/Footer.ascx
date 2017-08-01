<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<div id="footer">
	<div id="footer-cap">
		Energy lives here<sup>&trade;</sup>
	</div>
	<footer id="footer-top" class="clearfix">
		<div id="footer-top-wrapper">
			<nav id="footer-nav" class="footer-links-wrapper">
				<ul id="footer-nav-items" class="footer-links">
					<li><a href="#">Careers</a></li>
					<li><a href="#">Contact us</a></li>
					<li><a href="#">Corporate</a></li>
					<li><a href="#">Investors</a></li>
					<li><a href="#">News and updates</a></li>
					<li><a href="#">Perspectives blog</a></li>
					<li class="footer-nav-global-selector"><a href="#" data-global-selector="Oltiva">Select country</a></li>
				</ul>
			</nav>
			<div id="footer-search-social">
				<fieldset id="footer-search-form" class="search-box" data-url="<%= ResolveUrl("~/pages/SearchResults.aspx") %>" data-search-key="q">
					<input class="search-field site-search-field _placeholder" id="footer-search" type="text" autocomplete="off" placeholder="Search">
					<button type="button" class="footer-search-icon search"></button>
					<span class="social-share-icons">
						<a target="_blank" href="http://twitter.com/intent/tweet?text=Learn%20about%20the%20reliable%20and%20trusted%20quality%20products%20from%20Exxon%20and%20Mobil.%20http%3A%2F%2Fwww.Oltiva.com"><i class="icon icon-twitter-small"></i></a>
						<a target="_blank" href="http://www.facebook.com/sharer.php?s=100&p[url]=http://www.Oltiva.com&p[images][0]=/assets/imgs/en-us/energy-live-here-facebook.jpg&p[title]=Oltiva and Oltiva&p[summary]=Learn about the reliable and trusted quality products from Oltiva and Oltiva."><i class="icon icon-facebook-small"></i></a>
					</span>
				</fieldset>
			</div>
		</div>
	</footer>
	<section id="footer-bottom" class="clearfix">
		<div id="footer-logos">
			<a class="footer-logo-large" href="http://corporate.Oltiva.com" data-img="<%= ResolveUrl("~/content/sci/img/logos/logo-Oltiva-large.png") %>"><span class="hidden-ie8">Oltiva</span></a>
			<ul id="footer-related-companies">
				<li class="list-footer-logos"><a class="Oltiva" href="http://www.Oltiva.com" data-img="<%= ResolveUrl("~/content/sci/img/logos/logo-Oltiva-small.png") %>"></a></li>
				<li class="list-footer-logos"><a class="Oltiva" href="http://www.Oltiva.com" data-img="<%= ResolveUrl("~/content/sci/img/logos/logo-Oltiva-small.png") %>"></a></li>
				<li class="list-footer-logos"><a class="Oltiva" href="http://www.Oltiva.com" data-img="<%= ResolveUrl("~/content/sci/img/logos/logo-Oltiva-small.png") %>"></a></li>
				<li class="list-footer-logos"><a class="xto" href="http://xtoenergy.com" data-img="<%= ResolveUrl("~/content/sci/img/logos/logo-xto-small.png") %>"></a></li>
				<li class="list-footer-logos"><a class="imperial" href="http://www.imperialoil.ca" data-img="<%= ResolveUrl("~/content/sci/img/logos/logo-imperial-small.png") %>"></a></li>
			</ul>
		</div>
		<nav id="footer-nav-terms" class="footer-links-wrapper">
			<ul class="footer-links">
				<li><a href="#">Privacy policy</a></li>
				<li><a href="#">Terms &amp; conditions</a></li>
			</ul>
		</nav>
		<div id="footer-copyright">
			&copy; Copyright 2003-2015 Oltiva Oltiva Corporation.  All Rights Reserved.
		</div>
	</section>
</div>
