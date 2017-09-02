<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KitchenSinkItem.ascx.cs" Inherits="XOMFL.CommonComponents.Controls.KitchenSinkItem" %>
<%@ Register TagPrefix="c" TagName="ControlDownload" Src="~/controls/ControlDownload.ascx" %>
<%@ Register TagPrefix="c" TagName="Snippet" Src="~/controls/Snippet.ascx" %>
<%@ Register TagPrefix="c" TagName="Status" Src="~/controls/Status.ascx" %>

<div class="ks-item" id="<%=DomID%>">
	<h3><%=Title%><c:ControlDownload runat="server" Name="<%#ControlName%>" /> <a href="<%=ResolveUrl("~/layouts/ComponentTest.aspx?Component=" + ComponentCode + ".1" + (String.IsNullOrEmpty(DefaultChild) ? "" : "&Child=" + DefaultChild))%>" class="small pull-right">Layout</a> <a href="#top" class="small pull-right glyph-arrow-up">Top</a></h3>
	<div class="ks-control"><asp:PlaceHolder runat="server" ID="Component" /></div>
	<% if (HttpContext.Current.IsNotRestricted()) { %>
	<c:Snippet runat="server" Name="<%#ControlName%>" Collapsed="true" />
	<% } %>
</div>