<%@ Page Title="Retail (EU)" Language="C#" Inherits="System.Web.UI.Page" %>
<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row">
		<div class="col-md-12 col-4">
			<xom:Component runat="server" Code="F05.1" />
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 col-2">
			<xom:Component runat="server" Code="SP08.1" />
		</div>
		<div class="col-md-6 col-2">
			<xom:Component runat="server" Code="SP07.1" />
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 col-4">
			<xom:Component runat="server" Code="F03.2" />
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 col-4">
			<h2>Did you know?</h2>
		</div>
		<div class="col-md-6 col-2">
			<xom:Component runat="server" Code="S01.2" />
		</div>
		<div class="col-md-6 col-2">
			<xom:Component runat="server" Code="S01.2" />
		</div>
		<div class="col-md-6 col-2">
			<xom:Component runat="server" Code="S01.2" />
		</div>
		<div class="col-md-6 col-2">
			<xom:Component runat="server" Code="S01.2" />
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 col-4">
			<xom:Component runat="server" Code="SP09.1" />
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 col-1">
			<xom:Component runat="server" Code="S01.2" />
		</div>
		<div class="col-md-3 col-1">
			<xom:Component runat="server" Code="S01.2" />
		</div>
		<div class="col-md-3 col-1">
			<xom:Component runat="server" Code="S01.2" />
		</div>
		<div class="col-md-3 col-1">
			<xom:Component runat="server" Code="S01.2" />
		</div>
	</div>
</asp:Content>