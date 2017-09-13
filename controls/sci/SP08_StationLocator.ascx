<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component locator-panel">
    
    <div class="locator-row">
         
        <div class="col-md-7 col-md-push-5">
            <div class="static-map" style="background-image:url(https://maps.googleapis.com/maps/api/staticmap?markers=icon:http://localhost:<%=HttpContext.Current.Request.Url.Port%><%=ResolveUrl("~/content/sci/img/icons/icon-pin-small.png")%>|-33.912038798809725,151.0981582641601&key=AIzaSyBPfIUvUVi2DMcItIG6WId2H4u5fCXp7E4&zoom=12&style=element:labels.text.fill%7Ccolor:0x4a3c31&style=feature:administrative%7Celement:labels.text.fill%7Ccolor:0x4a3c31&style=feature:administrative.province%7Celement:geometry.stroke%7Cvisibility:off&style=feature:landscape%7Celement:geometry%7Ccolor:0xf5f5f2%7Csaturation:0%7Clightness:0%7Cgamma:1&style=feature:landscape.man_made%7Clightness:-3%7Cgamma:1.00&style=feature:landscape.natural.terrain%7Cvisibility:off&style=feature:poi%7Cvisibility:off&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0xbae5ce%7Cvisibility:on&style=feature:road%7Csaturation:-100%7Clightness:45%7Cvisibility:simplified&style=feature:road.arterial%7Celement:labels.icon%7Cvisibility:off&style=feature:road.arterial%7Celement:labels.text.fill%7Ccolor:0x787878&style=feature:road.highway%7Cvisibility:simplified&style=feature:road.highway%7Celement:geometry.fill%7Ccolor:0xfac9a9%7Cvisibility:simplified&style=feature:road.highway%7Celement:labels.text%7Ccolor:0x4e4e4e&style=feature:transit%7Cvisibility:simplified&style=feature:transit.line%7Celement:labels.text%7Ccolor:0x4a3c31&style=feature:transit.station.airport%7Celement:labels.icon%7Chue:0x0a00ff%7Csaturation:-77%7Clightness:0%7Cgamma:0.57&style=feature:transit.station.rail%7Celement:labels.icon%7Chue:0xff6c00%7Csaturation:-68%7Clightness:4%7Cgamma:0.75&style=feature:transit.station.rail%7Celement:labels.text.fill%7Ccolor:0x43321e&style=feature:water%7Ccolor:0x4a3c31%7Cvisibility:on&style=feature:water%7Celement:geometry.fill%7Ccolor:0xc7eced&style=feature:water%7Celement:labels.text.fill%7Csaturation:-53%7Clightness:-49%7Cgamma:0.79&size=480x350)"></div>
        </div>
        <div class="location-copy col-md-5 col-md-pull-7"> 
	        <div class="locator-data">
	    
                <div class="locator-information">
                     <i class="icon icon-telephone"></i>
                    
                    <p>Call us anytime</p>
			        <div class="telephone">
				        <a href="tel:2125941515">(212) 594-1515</a>
			        </div>
		        </div>
		
		        <div class="locator-titles">
			        <h3 class="header-subtitle strong">Address</h3>
                    <a href="https://maps.google.com/?q=1317 Heights Blvd Houston, TX, 77008">1317 Heights Blvd
		            <br/>Houston, TX, 77008</a>
            
                    <p class="hours">Available 24-7 or call any time.</p>
			
		        </div>
		
	        </div>
	        <div class="locator-options">
	            <a href="#"><i class="icon icon-flowers"></i> Send flowers</a>
                  <a href="#" id="share-popover"><i class="icon icon-share"></i> Share location</a>
		          <a target="_blank" href="https://www.google.com/maps/dir/?api=1&destination=1317 Heights Blvd Houston, TX, 77008"><i class="icon icon-primary-pin"></i> Get directions</a>
	             <!-- html share-popover // Facebook and Email -->
                <div id="share-popover-html" class="row " style="display: none">

                    <div class="col-md-6">
                        <a href="#"><i class="icon icon-facebook"></i></a>

                        <h5 class="text-uppercase">share to facebook </h5>
                    </div>
                    <div class="col-md-6">
                        <a href="#"><i class="icon icon-envelope-list"></i></a>

                        <h5 class="text-uppercase">share by email</h5>
                    </div>
                </div>
                <!-- end html share-popover // Facebook and Email -->
            </div>
        </div>
    </div>
</div>

<% } %>