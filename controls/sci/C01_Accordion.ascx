<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.ContainerControlBase" %>

<% if (Variation == 1) { %> 

<div class="component component-no-child-margin panel-group" id="<%=UniqueDomId("accordion")%>" role="tablist" aria-multiselectable="true" data-event-name="accordion-product-details">
	<div class="panel active">
		<div class="panel-heading" role="tab" id="<%=UniqueDomId("hdr1")%>">
			<a data-toggle="collapse" data-parent="#<%=UniqueDomId("accordion")%>" href="#<%=UniqueDomId("pnl1")%>" aria-expanded="true" aria-controls="<%=UniqueDomId("pnl1")%>">Overview</a>
			<a data-toggle="collapse" data-parent="#<%=UniqueDomId("accordion")%>" href="#<%=UniqueDomId("pnl1")%>" aria-expanded="true" aria-controls="<%=UniqueDomId("pnl1")%>" class="icon"><i class="icon-circle-minus"></i></a>
		</div>
		<div id="<%=UniqueDomId("pnl1")%>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="<%=UniqueDomId("hdr1")%>">
			<div class="panel-body"><ks:Component runat="server" Code="<%# Child %>" /></div>
		</div>
	</div>
	<div class="panel" data-event-data="Custom event data overrides panel heading">
		<div class="panel-heading" role="tab" id="<%=UniqueDomId("hdr2")%>">
			<a class="collapsed" data-toggle="collapse" data-parent="#<%=UniqueDomId("accordion")%>" href="#<%=UniqueDomId("pnl2")%>" aria-expanded="false" aria-controls="<%=UniqueDomId("pnl2")%>">Specifications</a>
			<a class="collapsed" data-toggle="collapse" data-parent="#<%=UniqueDomId("accordion")%>" href="#<%=UniqueDomId("pnl2")%>" aria-expanded="false" aria-controls="<%=UniqueDomId("pnl2")%>" class="icon"><i class="icon-circle-plus"></i></a>
		</div>
		<div id="<%=UniqueDomId("pnl2")%>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="<%=UniqueDomId("hdr2")%>">
			<div class="panel-body"><ks:Component runat="server" Code="<%# Child %>" /></div>
		</div>
	</div>
	<div class="panel" data-event-name="accordion-panel-customer-reviews">
		<div class="panel-heading" role="tab" id="<%=UniqueDomId("hdr3")%>">
			<a class="collapsed" data-toggle="collapse" data-parent="#<%=UniqueDomId("accordion")%>" href="#<%=UniqueDomId("pnl3")%>" aria-expanded="false" aria-controls="<%=UniqueDomId("pnl3")%>">Customer Reviews</a>
			<a class="collapsed" data-toggle="collapse" data-parent="#<%=UniqueDomId("accordion")%>" href="#<%=UniqueDomId("pnl3")%>" aria-expanded="false" aria-controls="<%=UniqueDomId("pnl3")%>" class="icon"><i class="icon-circle-plus"></i></a>
		</div>
		<div id="<%=UniqueDomId("pnl3")%>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="<%=UniqueDomId("hdr3")%>">
			<div class="panel-body"><ks:Component runat="server" Code="<%# Child %>" /></div>
		</div>
	</div>
</div>

<% } %>