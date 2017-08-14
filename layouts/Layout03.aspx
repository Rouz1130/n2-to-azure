﻿<%@ Page Title="Layout 3" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row">
		<div class="col-md-3 col-1">
			<ks:Component runat="server" Code="FO04.1" />
		</div>
		<div class="col-md-9 col-3">
			<ks:Component runat="server" Code="C03.1" Child="T04.1" />
			<ks:Component runat="server" Code="C01.1" Child="B01.1" />
			<ks:Component runat="server" Code="SP01.1" />
			<ks:Component runat="server" Code="C02.1" Child="B01.1" />
			<ks:Component runat="server" Code="SP02.1" />
		</div>
	</div>
	<hr />
	<ks:Snippet runat="server" Name="Layout03" />
</asp:Content>