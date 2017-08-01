<%@ Page Title="Layout 6" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row">
		<div class="col-md-3 col-1">
			<ks:Component runat="server" Code="SP04.1" />
			<ks:Component runat="server" Code="SP04.1" />
		</div>
		<div class="col-md-9 col-3">
			<ks:Component runat="server" Code="T04.1" />
			<ks:Component runat="server" Code="L01.4" Child="S01.1" />
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 col-2">
			<ks:Component runat="server" Code="C01.1" Child="B01.1" />
		</div>
		<div class="col-md-6 col-2">
			<ks:Component runat="server" Code="A09.1" />
		</div>
	</div>
	<hr />
	<ks:Snippet runat="server" Name="Layout06" />
</asp:Content>