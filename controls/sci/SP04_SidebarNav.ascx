<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<ul class="component list sidebar-nav">
    <li class="sidebar-nav-title">Section name</li>
    <li><a href="#">Link one</a></li>
    <li><a href="#">Second link</a></li>
    <li><a href="#" class="active">The active link</a></li>
    <li><a href="#">A fourth link</a></li>
    <li><a href="#">Fifth link in the list</a></li>
</ul>

<% } else if (Variation == 2) { %>

<ul class="component list sidebar-nav sidebar-nav-right">
    <li class="sidebar-nav-title">Section name</li>
    <li><a href="#">Link one</a></li>
    <li><a href="#">Second link</a></li>
    <li><a href="#" class="active">The active link</a></li>
    <li><a href="#">A fourth link</a></li>
    <li><a href="#">Fifth link in the list</a></li>
</ul>

<% } else if (Variation == 3) { %>

<ul class="component list sidebar-nav sidebar-nav-icons">
    <li class="sidebar-nav-title">Section name</li>
    <li><a href="#" class="link-icon"><i class="icon icon-download"></i>Download</a></li>
	<li><a href="#" class="link-icon"><i class="icon icon-share-orange"></i>Share</a></li>
	<li><a href="#" class="link-icon"><i class="icon icon-document"></i>Read more</a></li>
	<li><a href="#" class="link-icon"><i class="icon icon-primary-pin"></i>Directions</a></li>
	<li><a href="#" class="link-icon"><i class="icon icon-telephone"></i>Call us</a></li>
</ul>

<% } %>