<%@ Page Title="Home" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	    
   <div class="row">
		<div class="col-md-12 col-4">
		
            <div class="component featured-item featured-item-full-overlay">
               <img class="featured-item-image" src="../content/site/header.jpg" >
               <ks:Component runat="server" Code="A05.2" />
		    </div>
            </div>
           
	</div>
    <div class="row">
        <div class="col-md-4 col-1">
			<ks:Component runat="server" Code="L01.1" Child="S01.4" />
		</div>
        <div class="col-md-4 col-1">
			<ks:Component runat="server" Code="L01.1" Child="S01.4" />
		</div>
    </div>
   <div class="row">
        <div class="col-md-3 col-1">
			<ks:Component runat="server" Code="L01.1" Child="S01.4" />
		</div>
        <div class="col-md-3 col-1">
			<ks:Component runat="server" Code="L01.1" Child="S01.4" />
		</div>
       <div class="col-md-3 col-1">
			<ks:Component runat="server" Code="L01.1" Child="S01.4" />
		</div>
    </div>

      <img class="featured-item-image" src="../content/site/header.jpg" >
	<%--<ks:Snippet runat="server" Name="Home" />--%>
</asp:Content>