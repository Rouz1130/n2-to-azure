<%@ Page Title="Weather" %>
<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="PageStyles">
	<link href="<%= ResolveUrl("~/content/sci/css/weather.min.css") %>" type="text/css" rel="stylesheet">
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
	<script src="<%= ResolveUrl("~/content/sci/js/apps/weather.js") %>"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row">
		<div class="col-md-12 col-4 breakpoints">
			<xom:Component runat="server" Code="T05.1" />
		</div>
	</div>
</asp:Content>