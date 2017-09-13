<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.Xomfl.Nav.Header" CodeBehind="~/controls/sci/nav/Header.ascx.cs" %>
<%@ Register TagPrefix="xom" TagName="MegaNav" Src="~/controls/sci/nav/MegaNav.ascx" %>

<header class="nav-header">
	<div class="nav-wrapper">
		<div class="nav-top-bar">
			<div class="nav-top-bar-left"></div>
			
			<div class="nav-top-bar-right">
			
                <ul>
                    <li><a href="#" class="nav-main-search-trigger">Search</a></li>
					<li><a href="#"><span class="nav-mobile">Bill pay</span><span class="nav-tablet-up">Bill pay</span></a></li>
					<li><a href="#"><span class="nav-mobile">Help</span><span class="nav-tablet-up">Help</span></a></li>
				    <li class="change-language">
				        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">English</a>
                         <ul class="dropdown-menu">
                             <li><a href="#">Espanol</a></li>
   				            <li><a href="#">Francais</a></li>
                        </ul>
				    </li>
                </ul>
				
			</div>
		</div>
        
		<div class="nav-main-bar">
			<a href="<%=ResolveUrl("~/")%>" class="logo">
				<img src="<%= ResolveUrl("~/content/sci/img/logos/logo.png") %>" />
			</a>
			<a href="#" class="nav-main-item nav-main-list-trigger">
				<i class="icon-hamburger"><span class="hamburger-inner"></span></i>
				<span class="nav-main-item-text">Menu</span>
			</a>
		
			<ul class="nav-main-list">
			    <li class="nav-main-item">
			        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			            <span>plan a funeral<br/>or cremation</span>
			        </a>
                     <div class="dropdown-menu">
   				        <a class="col-xs-6">  
                               <h3>Immediate need</h3>
                               <p>Death has occured or is near</p>
   				        </a>
                        <a class="col-xs-6"> 
                            <h3>Plan ahead</h3>
                            <p>preplan a funeral or cremation</p>
                        </a>
                    </div>

			    </li>
				
				<li class="nav-main-item" rel="issues"><a href="#" data-analytics='{ "cg": "Motor oil", "csg": "test-csg", "cn": "test-cn", "ct": "test-ct", "sc_track": "CLICK-NAV", "sc_goals": "GOAL1,GOAL2" }'><span>obituaries<br/>and services</span></a></li>
				<li class="nav-main-item" rel="environment"><a href="#" data-analytics='{ "cg": "Our stations", "csg": "test-csg", "cn": "test-cn", "ct": "test-ct", "sc_track": "CLICK-NAV", "sc_goals": "GOAL1,GOAL2" }'><span>support friends<br/>and family</span></a></li>
				<li class="nav-main-item" rel="community"><a href="#" data-analytics='{ "cg": "Rewards and promotions", "csg": "test-csg", "cn": "test-cn", "ct": "test-ct", "sc_track": "CLICK-NAV", "sc_goals": "GOAL1,GOAL2" }'><span>find funeral home<br/>or cemetery</span></a></li>

			</ul>
		</div>
		
	</div>
	<fieldset class="nav-main-search search-box" data-url="<%= ResolveUrl("~/pages/SearchResults.aspx") %>" data-search-key="q">
		<input type="text" autocomplete="off" placeholder="Search for topics, articles, data..." aria-relevant="all" aria-autocomplete="both" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field" }'>
		<button type="button" class="nav-main-search-submit search" data-analytics='{ "manual": true, "cg": "Search", "ct": "Button" }'>Search</button>
	</fieldset>
	
</header>


<div class="modal modal-change-language fade" id="<%=UniqueDomId("lb")%>" tabindex="-1" role="dialog" aria-labelledby="<%=UniqueDomId("lb")%>-label" aria-hidden="true" data-cookie-name="emfl-language" data-query-param="language">
	<div class="modal-dialog modal-breadcrumb">
		<div class="modal-content">
			<div class="modal-header">
				<a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
				<h3 class="modal-title" id="<%=UniqueDomId("lb")%>-label">Select Language</h3>
				<p class="small">Select the language you would like to use (this does not limit what documents are returned).</p>
			</div>
			<div class="modal-body">
				<div class="row form-inline">
					<div class="col-sm-4">
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb3a")%>" name="rb1" value="ar" />
							<label for="<%=UniqueDomId("rb3a")%>"><span class="icon"></span>Arabic</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb2c")%>" name="rb1" value="zh" />
							<label for="<%=UniqueDomId("rb2c")%>"><span class="icon"></span>Chinese</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb1a")%>" name="rb1" value="en" />
							<label for="<%=UniqueDomId("rb1a")%>"><span class="icon"></span>English</label>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb1b")%>" name="rb1" value="fr" />
							<label for="<%=UniqueDomId("rb1b")%>"><span class="icon"></span>French</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb2a")%>" name="rb1" value="de" />
							<label for="<%=UniqueDomId("rb2a")%>"><span class="icon"></span>German</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb1c")%>" name="rb1" value="es" />
							<label for="<%=UniqueDomId("rb1c")%>"><span class="icon"></span>Spanish</label>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb2b")%>" name="rb1" value="th" />
							<label for="<%=UniqueDomId("rb2b")%>"><span class="icon"></span>Thai</label>
						</div>
					</div>
				</div>
				<div class="wrapper-submit-btn">
					<button type="button" class="btn btn-primary">Change</button>
					<button type="button" class="btn btn-link btn-cancel" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</div>
