<%@ Page Title="Retail (US)" Language="C#" Inherits="System.Web.UI.Page" %>
<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row">
		<div class="col-md-12 col-4">
			<xom:Component runat="server" Code="T04.1" />
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
			<xom:Component runat="server" Code="F02.1" />
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 col-4">
			<div class="component">
				<p class="text-center">[ PLACEHOLDER: Car hotspot app in iframe ]</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 col-2">
			<div class="component">
				<span>[NEW COMPONENT (or basic elements)]</span>
				<h3>Learn about how Oltiva fuels work</h3>
				<p>Aliquam sollicitudin libero id erat sodales, quis lacinia est mollis.</p>
				<a class="btn btn-primary" href="#">See our fuel in action</a>
			</div>
		</div>
		<div class="col-md-6 col-2">
			<xom:Component runat="server" Code="SP02.1" />
		</div>
	</div>
</asp:Content>