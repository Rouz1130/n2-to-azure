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
                         <ul class="dropdown-menu language-selector">
                             <li><a href="#">Español</a></li>
   				            <li><a href="#">Francais</a></li>
                        </ul>
				    </li>
                </ul>
				
			</div>
		</div>
        
		<nav class="nav-main-bar">
			<a href="<%=ResolveUrl("~/")%>" class="logo">
				<img src="<%= ResolveUrl("~/content/sci/img/logos/logo.png") %>" />
			</a>
			<a href="#" class="nav-main-item nav-main-list-trigger">
				<i class="icon-hamburger"><span class="hamburger-inner"></span></i>
				 <span class="nav-main-item-text"><span class="open-text">Menu</span><span class="close-text">Close</span></span>
			</a>
		
			<ul class="nav-main-list">
			    <li class="nav-main-item">
			        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			            plan a funeral or cremation
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
				
				<li class="nav-main-item" ><a href="#" >obituaries and services</a></li>
				<li class="nav-main-item" ><a href="#">support friends and family</a></li>
				<li class="nav-main-item" ><a href="#">find funeral home or cemetery</a></li>

			</ul>
		</nav>
		
	</div>
	<fieldset class="nav-main-search search-box" data-url="<%= ResolveUrl("~/pages/SearchResults.aspx") %>" data-search-key="q">
		<input type="text" autocomplete="off" placeholder="Search for topics, articles, data..." aria-relevant="all" aria-autocomplete="both" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field" }'>
		<button type="button" class="nav-main-search-submit search" data-analytics='{ "manual": true, "cg": "Search", "ct": "Button" }'>Search</button>
	</fieldset>
	
</header>
