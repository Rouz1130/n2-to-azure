<%@ Page Title="Obits search" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    
    <div class="row">
        <div class="col-md-12 col-4">
			<ks:Component runat="server" Code="T02.3" />
		</div>
    </div>

	<div class="row row-band">
		<div class="col-md-3 col-1">
			<ks:Component runat="server" Code="FO04.1" />
		</div>
		<div class="col-md-9 col-3">
			<ks:Component runat="server" Code="C03.1" Child="T04.1" />
	
	
			<ks:Component runat="server" Code="SP08.1" />
		
		</div>
	</div>
	<hr />
	<ks:Snippet runat="server" Name="Layout03" />
</asp:Content>