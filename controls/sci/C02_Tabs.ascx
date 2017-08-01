<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.ContainerControlBase" %>

<% if (Variation == 1) { %>

<div class="component component-no-child-margin tab-list-items" role="tabpanel">
	<ul class="nav nav-tabs option-list-items" role="tablist">
		<li role="presentation" class="active"><a href="#<%=UniqueDomId("tab1")%>" aria-controls="<%=UniqueDomId("tab1")%>" role="tab" data-toggle="tab">Tab item 01</a></li>
		<li role="presentation"><a href="#<%=UniqueDomId("tab2")%>" aria-controls="<%=UniqueDomId("tab2")%>" role="tab" data-toggle="tab">Tab item 02</a></li>
		<li role="presentation"><a href="#<%=UniqueDomId("tab3")%>" aria-controls="<%=UniqueDomId("tab3")%>" role="tab" data-toggle="tab">Tab item 03</a></li>
		<li role="presentation"><a href="#<%=UniqueDomId("tab4")%>" aria-controls="<%=UniqueDomId("tab4")%>" role="tab" data-toggle="tab">Tab item 04</a></li>
	</ul>
	<div class="tab-content content-list-items">
		<div role="tabpanel" class="tab-pane clearfix active" id="<%=UniqueDomId("tab1")%>">
			<ks:Component runat="server" Code="<%# Child %>" />
		</div>
		<div role="tabpanel" class="tab-pane clearfix" id="<%=UniqueDomId("tab2")%>">
			<ks:Component runat="server" Code="<%# Child %>" />
		</div>
		<div role="tabpanel" class="tab-pane clearfix" id="<%=UniqueDomId("tab3")%>">
			<ks:Component runat="server" Code="<%# Child %>" />
		</div>
		<div role="tabpanel" class="tab-pane clearfix" id="<%=UniqueDomId("tab4")%>">
			<ks:Component runat="server" Code="<%# Child %>" />
		</div>
	</div>
</div>

<% } %>