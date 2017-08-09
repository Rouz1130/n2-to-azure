﻿<%@ Page Title="Layout 1" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row">
		<div class="col-md-12 col-4">
			<ks:Component runat="server" Code="T01.1" />
			<ks:Component runat="server" Code="L01.4" Child="S01.1" />
			<ks:Component runat="server" Code="B02.1" />
			<ks:Component runat="server" Code="C01.1" />
			<ks:Component runat="server" Code="C02.1" />
		</div>
	</div>
	<hr />
	<ks:Snippet runat="server" Name="Layout01" />
</asp:Content>