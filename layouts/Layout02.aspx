<%@ Page Title="Layout 2" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row">
		<div class="col-md-12 col-4">
			<ks:Component runat="server" Code="C03.1" Child="T04.1" />
		</div>
	</div>
	<div class="row">
		<div class="col-md-9 col-3">
			<ks:Component runat="server" Code="B01.1" />
			<ks:Component runat="server" Code="C01.1" Child="B01.1" />
			<ks:Component runat="server" Code="B01.1" />
			<ks:Component runat="server" Code="B02.1" />			
		</div>
		<div class="col-md-3 col-1">
			<ks:Component runat="server" Code="L01.1" Child="S01.1" />
		</div>
	</div>
	<hr />
	<ks:Snippet runat="server" Name="Layout02" />
</asp:Content>
