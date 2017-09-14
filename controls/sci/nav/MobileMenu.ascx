<%@ Control Language="C#" Inherits="System.Web.UI.UserControl" %>

<nav id="nav-main-mobile">
    <ul class="nav-main-mobile-panel">

        <li class="top-level search-box search-box-small">search
       
	<div class="form-group">
        <input type="text" class="form-control" placeholder="I'm looking for..." />
        <span class="form-group-btn"></span>

    </div>

        </li>

        <li class="top-level">

            <a href="#plan" data-toggle="collapse" aria-expanded="false">plan a funeral or cremation</a>
            <div class="collapse row" id="plan">
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
        <li class="top-level"><a href="#">obituaries and services</a></li>
        <li class="top-level"><a href="#">support friends and family</a></li>
        <li class="top-level"><a href="#">find funeral home or cemetery</a></li>
        <li><a href="#">Bill pay</a></li>
        <li><a href="#">Help</a></li>
        <li><a href="#languageMobile" data-toggle="collapse" aria-expanded="false">English</a>
            <div class="collapse" id="languageMobile">
                <ul class="nav-main-mobile-panel">
                    <li><a href="#">Español</a></li>
                    <li><a href="#">Francais</a></li>
                </ul>
            </div>
        </li>
    </ul>

</nav>
