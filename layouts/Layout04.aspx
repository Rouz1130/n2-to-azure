<%@ Page Title="Layout 4" %>

<asp:content runat="server" contentplaceholderid="MainContent">
	<div class="row">
		<div class="col-md-6 col-2">
			<ks:Component runat="server" Code="T02.1" />
			<ks:Component runat="server" Code="C01.1" Child="B01.1" />
			<ks:Component runat="server" Code="SP02.1" />
			<ks:Component runat="server" Code="B01.1" />
			<ks:Component runat="server" Code="L01.4" Child="S01.1" />
		</div>
		<div class="col-md-6 col-2">
			<ks:Component runat="server" Code="T03.2" />
			<ks:Component runat="server" Code="C01.1" Child="B01.1" />
			<ks:Component runat="server" Code="C03.1" Child="B01.1" />
			<ks:Component runat="server" Code="SP01.1" />
		</div>
	</div>
	<hr />
	<ks:Snippet runat="server" Name="Layout04" />
</asp:content>
