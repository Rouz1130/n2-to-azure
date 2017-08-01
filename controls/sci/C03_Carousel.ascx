<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.ContainerControlBase" %>

<% if (Variation == 1) { %>

<div class="component component-no-child-margin carousel" data-analytics='{ "cg": "Carousel Content", "csg": "Current content name" }'>
	<div><ks:Component runat="server" Code="<%# Child %>" /></div>
	<div><ks:Component runat="server" Code="<%# Child %>" /></div>
	<div><ks:Component runat="server" Code="<%# Child %>" /></div>
</div>

<% } else if (Variation == 2) { %>

<div class="component component-no-child-margin carousel carousel-thumb carousel-thumb-in" data-analytics='{ "cg": "Carousel Content", "csg": "Current content name" }'>
	<div>
		<ks:Component runat="server" Code="<%# Child %>" />
		<script type="application/json">{"caption": "Caption for slide number one", "image": "<%=ResolveUrl("~/content/site/carousel-01.jpg")%>"}</script>
	</div>
	<div>
		<ks:Component runat="server" Code="<%# Child %>" />
		<script type="application/json">{"caption": "Caption for slide number two", "image": "<%=ResolveUrl("~/content/site/carousel-02.jpg")%>"}</script>
	</div>
	<div>
		<ks:Component runat="server" Code="<%# Child %>" />
		<script type="application/json">{"caption": "Caption for slide number three", "image": "<%=ResolveUrl("~/content/site/carousel-03.jpg")%>"}</script>
	</div>
</div>

<% } else if (Variation == 3) { %>

<div class="component component-no-child-margin carousel carousel-thumb carousel-thumb-out" data-analytics='{ "cg": "Carousel Content", "csg": "Current content name" }'>
	<div>
		<ks:Component runat="server" Code="<%# Child %>" />
		<script type="application/json">{"caption": "Caption for slide number one", "image": "<%=ResolveUrl("~/content/site/carousel-01.jpg")%>"}</script>
	</div>
	<div>
		<ks:Component runat="server" Code="<%# Child %>" />
		<script type="application/json">{"caption": "Caption for slide number two", "image": "<%=ResolveUrl("~/content/site/carousel-02.jpg")%>"}</script>
	</div>
	<div>
		<ks:Component runat="server" Code="<%# Child %>" />
		<script type="application/json">{"caption": "Caption for slide number three", "image": "<%=ResolveUrl("~/content/site/carousel-03.jpg")%>"}</script>
	</div>
</div>

<% } %>