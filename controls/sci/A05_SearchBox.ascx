<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component search-box" data-cookie-name="kitchen-sink-searches">
	<div class="form-group">
		<input type="text" class="form-control" placeholder="Search by country, state, city, postal code, or cemetery" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field" }' />
		<div class="form-group-btn">
			<button>Search</button>
		</div>
	</div>
	
</div>

<% } else if (Variation == 2) { %>

<div class="component search-box search-box-with-settings" data-url="<%= ResolveUrl("~/pages/SearchResults.aspx") %>" data-event-name="xom.site-search" data-search-key="q" data-cookie-name="kitchen-sink-searches" data-settings-cookie="kitchen-sink-search-settings">
	<div class="form-group">
		<input type="text" class="form-control" placeholder="Find an obituary..." data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field" }' />
		 <div class="form-group-btn"><button>Search</button></div>  
	</div>
	<ul class="search-box-settings">
		<li class="selected"><a class="search-box-setting" data-target="#<%=UniqueDomId("lb-lob")%>" data-key="obits" data-value="Obituaries">Obituaries</a></li>
		<li><a class="search-box-setting" data-key="funeral" data-value="Funeral Homes&lt;br/&gt;&amp; cemeteries" href="#" data-toggle="modal" data-target="#<%=UniqueDomId("lb-country")%>">Funeral Homes</a></li>
	    <li><a class="search-box-setting" data-key="site" data-value="Search Site" href="#" data-toggle="modal">Search site</a></li>

    </ul>
	
</div>





<% } else if (Variation == 4) { %>

    <div class="component search-box search-box-with-clear">
        <label for="txt1">Search</label>
        <div class="form-group">
              <input id="txt1" type="text" class="form-control" placeholder="Search" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field" }' >
              <div class="form-group-btn clearer"><button type="reset">Clear</button></div>
              <div class="form-group-btn"><button>Search</button></div>  
        </div>
     </div>

<% } %>