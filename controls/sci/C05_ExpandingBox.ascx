<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.ContainerControlBase" %>

<% if (Variation == 1) { %>

<div class="component component-no-child-margin component-padded component-shaded expanding-box">
	<div class="expanding-box-static">
		<p class="expanding-box-text">Don't see your manufacturer? You can search for products by application, equipment builder, product series, or specification.</p>
		<span class="expanding-box-trigger"><a href="#<%= UniqueDomId("panel-to-expand") %>" class="btn btn-secondary" data-toggle="collapse">Learn more</a></span>
	</div>
	<div id="<%= UniqueDomId("panel-to-expand") %>" class="collapse">
		<ks:Component runat="server" Code="<%# Child %>" />
	</div>
</div>

<% } %>