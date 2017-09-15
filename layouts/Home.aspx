<%@ Page Title="Home" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
 
    <ks:Component runat="server" Code="A17.1" />   

     <div class="component screen-title screen-title-overlay">
		<div class="screen-title-image-wrap">
			
            <img class="screen-title-image" src="<%=ResolveUrl("~/content/site/header.jpg")%>">
            <div class="screen-title-title">
			    <h1>Celebrating each life <span class="subtext">like no other</span></h1>
            </div>
		</div>

           <ks:Component runat="server" Code="A05.2" />
    </div>
    
   
    <div class="row row-band">
        <div class="col-md-6 col-1">
            <ks:Component runat="server" Code="S01.4" />
        </div>
        <div class="col-md-6 col-1">
            <ks:Component runat="server" Code="S01.4" />
        </div>
    </div>
     <div class="row row-band">
        <div class="col-md-3 col-1">
            <ks:Component runat="server" Code="S01.4" />
        </div>
        <div class="col-md-3 col-1">
            <ks:Component runat="server" Code="S01.4" />
        </div>
        <div class="col-md-3 col-1">
            <ks:Component runat="server" Code="S01.4" />
        </div>
    </div>
   <div class="row row-band">
        <div class="col-md-12">
            <ks:Component runat="server" Code="B06.2" />
            <ks:Component runat="server" Code="B01.1" />
            <div class="row">
                    <div class=" col-md-6">
                        <ks:Component runat="server" Code="FO01.3" />
                    </div>
                    <div class="col-md-6">
                        <%--<ks:Component runat="server" Code="B05.2" />--%>
                    </div>
             </div>
    </div>
        

    </div>
      <img class="featured-item-image" src="../content/site/header.jpg">
    <%--<ks:Snippet runat="server" Name="Home" />--%>
</asp:Content>
