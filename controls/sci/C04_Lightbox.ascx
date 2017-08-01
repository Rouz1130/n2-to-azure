<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.ContainerControlBase" %>

<!-- Trigger -->
<a href="#<%=UniqueDomId("lb")%>" type="button" class="btn btn-primary" data-toggle="modal" data-target="#<%=UniqueDomId("lb")%>">
	Open Lightbox
</a>

<% if (Variation == 1) { %>

<div class="modal fade" id="<%=UniqueDomId("lb")%>" tabindex="-1" role="dialog" aria-labelledby="<%=UniqueDomId("lb")%>-label" aria-hidden="true" data-analytics='{ "manual": true, "en": "CTA", "cg": "Contact our technical help desk", "cn": "Contact expert", "ct": "Link" }'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
				<h2 class="modal-title" id="<%=UniqueDomId("lb")%>-label">Modal title - H2</h2>
			</div>
			<div class="modal-body"><ks:Component runat="server" Code="<%# Child %>" /></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Send</button>
				<button type="button" class="btn btn-link btn-cancel" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>

<% } else if (Variation == 2) { %>

<div class="modal modal-iframe fade" id="<%=UniqueDomId("lb")%>" data-iframe-src="<%=ResolveUrl("~/pages/private/misc/IframeContent.aspx")%>" tabindex="-1" role="dialog" aria-labelledby="<%=UniqueDomId("lb")%>-label" aria-hidden="true" data-analytics='{ "manual": true, "en": "CTA", "cg": "Contact our technical help desk", "cn": "Contact expert", "ct": "Link" }'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
				<h2 class="modal-title" id="<%=UniqueDomId("lb")%>-label">Modal title - H2</h2>
			</div>
			<div class="modal-body"><iframe scrolling="no" class="iframe-height"></iframe></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">Send</button>
				<button type="button" class="btn btn-link btn-cancel" data-dismiss="modal">Cancel</button>
			</div>
		</div>
	</div>
</div>

<% } %>