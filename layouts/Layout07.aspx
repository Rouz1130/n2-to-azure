<%@ Page Title="Layout 7" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row">
		<div class="col-md-12 col-4">
			<ks:Component runat="server" Code="T04.1" />
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6 col-md-3 col-1">
			<ks:Component runat="server" Code="C01.1" />
		</div>
		<div class="col-sm-6 col-md-3 col-1">
			<ks:Component runat="server" Code="B01.1" />
		</div>
		<div class="col-sm-6 col-md-3 col-1">
			<ks:Component runat="server" Code="A15.1" />
		</div>
		<div class="col-sm-6 col-md-3 col-1">
			<ks:Component runat="server" Code="A18.1" />
		</div>
	</div>
	<hr />
	<ks:Snippet runat="server" Name="Layout07" />
</asp:Content>