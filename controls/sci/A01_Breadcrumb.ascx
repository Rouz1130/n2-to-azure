<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component breadcrumb-panel">
	<ul class="breadcrumb-list">
		<li class="glyph-link"><a href="#">Breadcrumb trail</a></li>
		<li class="glyph-link"><a href="#">Cemeteries</a></li>	
		<li class="glyph-link"><a href="#">Chatatoonga Cemetery</a></li>
		<li class="glyph-link"><a href="#">Chatatoonga Cemetery Events</a></li>
	</ul>
</div>

<% } else if (Variation == 2) { %>

<div class="component breadcrumb-panel-action">
	<ul class="breadcrumb-list">
		<li class="glyph-link"><a href="#">Breadcrumb trail</a></li>
		<li class="glyph-link"><a href="#">Cemeteries</a></li>	
		<li class="glyph-link"><a href="#">Chatatoonga Cemetery</a></li>
		<li class="glyph-link"><a href="#">Chatatoonga Cemetery Events</a></li>
	</ul>
	
</div>


<% } else if (Variation == 3) { %>

<div class="component breadcrumb-back">
	<ul class="breadcrumb-list">
		<li class="glyph-link"><a href="#">[Application N1]</a></li>
	</ul>
</div>

<% } else if (Variation == 4) { %>

<div class="component breadcrumb-heading">
	<ul class="breadcrumb-list">
		<li class="glyph-link"><a href="#">[Application N1]</a></li>
		<li class="glyph-link"><a href="#">[Application N2]</a></li>
		<li class="glyph-link"><a href="#">[Application N3]</a></li>
	</ul>
</div>

<% } %>