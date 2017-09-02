<%@ Page Title="Layout 1" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <ks:Component runat="server" Code="A01.1" />
    <ks:Component runat="server" Code="T01.1" />

    <div class="row">
        <div class="col-md-12 col-4">
            <ks:Component runat="server" Code="SP05.1" />
            <ks:Component runat="server" Code="SP08.1" />


            <div class="location-container component">
                <div class="tab-list-items" role="tabpanel">
                    <ul class="nav nav-tabs option-list-items" role="tablist">
                        <li role="presentation" class="active"><a href="#about">About</a></li>
                        <li role="presentation"><a href="#obits">Obituaries</a></li>
                        <li role="presentation"><a href="#events">events</a></li>
                        <li role="presentation"><a href="#associates">Associates</a></li>
                    </ul>
                </div>
                
                <div id="about">
                    <div class="col-lg-8 col-md-10 centered-col">
                        <p>Suspendisse ac tellus aliquam, pellentesque metus rutrum, molestie tortor. Pellentesque quis semper mi. Vivamus dignissim, elit non accumsan feugiat, dui dolor pulvinar odio, ac pretium eros est nec odio. Ut eu augue tincidunt, luctus lectus.</p>                         <p>Ullamcorper elit. Duis condimentum neque placerat arcu feugiat volutpat. Duis commodo nibh tortor, id molestie est eleifend at. Curabitur posuere eget erat ac faucibus.</p>
                    
                        <h6 class="header-subtitle">Services</h6>
                         <ul>
                             <li>Lorem ipsum dolor sit amet </li>
                              <li>Maecenas pretium libero vitae </li>
                              <li>Suspendisse eu odio eget lectus consectetur adipiscing elit.</li> 
                             <li>In ultrices nisl sed felis blandit  quis</li> 
                             <li>Vivamus convallis sapien a orci  rhoncus, sit amet finibus mauris tempus.</li>
                         
                              <li>Lorem ipsum dolor sit amet </li>
                              <li>Maecenas pretium libero vitae </li>
                              <li>Suspendisse eu odio eget lectus</li> 
                             <li>In ultrices nisl sed felis blandit  quis</li> 
                             <li>Vivamus convallis sapien a orci    rhoncus, sit amet finibus mauris tempus.</li>
                         </ul>                    </div>

                    <h2>Gallery</h2>
                    
                     <div class="col-lg-8 col-md-10 centered-col">
                         
                         <h6 class="header-subtitle">History</h6>
                        <p>Suspendisse ac tellus aliquam, pellentesque metus rutrum, molestie tortor. Pellentesque quis semper mi. Vivamus dignissim, elit non accumsan feugiat, dui dolor pulvinar odio, ac pretium eros est nec odio. Ut eu augue tincidunt, luctus lectus.</p>

                         <h6 class="header-subtitle">personalized services</h6>
                         <p>Suspendisse ac tellus aliquam, pellentesque metus rutrum, molestie tortor. Pellentesque quis semper mi. Vivamus dignissim, elit non accumsan feugiat, dui dolor pulvinar odio, ac pretium eros est nec odio. Ut eu augue tincidunt, luctus lectus.</p>
                    </div>
                </div>
                
                <div id="obits">
                       <h2>Recent Obituraries</h2>
                    <div class="col-md-10 col-4 centered-col breakpoints bp-xs bp-sm bp-md bp-lg bp-xl bp-max-xl">
					
                      <ks:Component runat="server" Code="L01.2" Child="T03.2" />
                     <ks:Component runat="server" Code="B05.1" />
                </div>
                    </div>
                
                <div id="events">
                      <h2>Events</h2>
                    <div class="col-md-10 col-4 centered-col breakpoints bp-xs bp-sm bp-md bp-lg bp-xl bp-max-xl">
                      <ks:Component runat="server" Code="L01.2" Child="A20.1" />
                      <ks:Component runat="server" Code="B05.1" />
                        </div>
                </div>
                
                <div id="associates">
                     <div class="col-lg-8 col-md-10 centered-col">
                    <h2>Lorem ipsum dolor sit amet, erat consectetur elit donec </h2>
                         </div>
                </div>

            </div>

        </div>
    </div>
    <hr />
	<ks:Snippet runat="server" Name="Layout01" />
</asp:Content>
