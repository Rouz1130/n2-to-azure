<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component locator-panel">
    
    <div class="locator-row">
   
       <div class="location-copy"> 
	        <div class="locator-data">
	    
                <div class="locator-information">
                     <i class="icon icon-telephone"></i>

                    Call us anytime
			        <div class="telephone">
				        <a href="tel:2125941515">(212) 594-1515</a>
			        </div>
		        </div>
		
		        <div class="locator-titles">
			        <h3 class="header-subtitle strong">Address</h3>
                    309 11th Ave. Northern Boulevard
		            <br/>New York, New York 10001-1213 
            
                    <p>
                        <span>Mon - Sat 06:00 - 22:00 <span class="locator-open">Open Now</span>, Sun 07:00 - 22:00</span>
                    </p>
			
		        </div>
		
	        </div>
	        <div class="locator-options">
	            <a href="#"><i class="icon icon-flowers"></i> Send flowers</a>
                  <a href="#"><i class="icon icon-share"></i>Share location</a>
		          <a href="#"><i class="icon icon-primary-pin"></i>Get directions</a>
	        </div>
        </div>
    <div class="static-map">
	    <img src=" https://maps.googleapis.com/maps/api/staticmap?key=AIzaSyBPfIUvUVi2DMcItIG6WId2H4u5fCXp7E4&zoom=12&style=feature:administrative.land_parcel%7Celement:geometry.fill%7Ccolor:0xbae5ce&style=feature:administrative.land_parcel%7Celement:labels%7Cvisibility:off&style=feature:landscape.man_made%7Celement:geometry.fill%7Ccolor:0xefefea&style=feature:landscape.natural%7Celement:geometry.fill%7Ccolor:0xbae5ce&style=feature:landscape.natural.landcover%7Celement:geometry.fill%7Ccolor:0xbae5ce&style=feature:landscape.natural.terrain%7Celement:geometry.fill%7Ccolor:0xbae5ce&style=feature:poi.business%7Cvisibility:off&style=feature:poi.park%7Celement:geometry.fill%7Ccolor:0xbae5ce&style=feature:poi.park%7Celement:geometry.stroke%7Cvisibility:off&style=feature:poi.park%7Celement:labels.text%7Cvisibility:off&style=feature:poi.sports_complex%7Celement:geometry.fill%7Ccolor:0xbae5ce&style=feature:road.highway%7Celement:geometry.fill%7Ccolor:0xfac9a9&style=feature:road.highway%7Celement:geometry.stroke%7Ccolor:0xfac9a9&style=feature:road.local%7Celement:labels%7Cvisibility:off&style=feature:transit.line%7Celement:labels.icon%7Ccolor:0xfac9a9&style=feature:water%7Celement:geometry.fill%7Ccolor:0xc7eced&style=feature:water%7Celement:labels.text%7Ccolor:0x4a3c31&size=480x260&center=-33.912038798809725,151.0981582641601" />
    </div>
</div>
</div>

<% } %>

