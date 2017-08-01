<%@ Page Title="Layout 5" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row">
		<div class="col-md-9 col-3">
			<ks:Component runat="server" Code="T01.1" />
			<ks:Component runat="server" Code="L01.4" Child="S01.1" />
			<ks:Component runat="server" Code="SP03.1" />
		</div>
		<div class="col-md-3 col-1">
			<ks:Component runat="server" Code="A18.1" />
		</div>
	</div>
	<hr />
	<ks:Snippet runat="server" Name="Layout05" />
</asp:Content>