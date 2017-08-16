<%@ Page Title="Layout08" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <script async custom-element="amp-iframe" src="https://cdn.ampproject.org/v0/amp-iframe-0.1.js"></script>
    <script async custom-element="amp-accordion" src="https://cdn.ampproject.org/v0/amp-accordion-0.1.js"></script>
    <script async custom-element="amp-youtube" src="https://cdn.ampproject.org/v0/amp-youtube-0.1.js"></script>    
    <script async src="https://cdn.ampproject.org/v0.js"></script>
    <meta name="viewport" content="width=device-width,minimum-scale=1">
    <style type="text/css">
        amp-accordion section[expanded] .show-more {
          display: none;
        }
        amp-accordion section:not([expanded]) .show-less {
          display: none;
        }
        .i-amphtml-accordion-header {
                cursor: pointer;
            background-color: transparent;
            border: none;
        }
        h4.i-amphtml-accordion-header:focus{
            border: none !important;
            border-color:transparent;
        }
        h4.show{
            color:blue;
            font-size:15px;
        }
       
        
        amp-youtube{
            width: 100%;
        }

        .fixed-container {
           position: relative;
           width: 250px;
           height: 250px;
           top:-70px;
         }
        amp-img.cover img {
            object-fit: cover;
        }
        .w-content{
            text-align:left;
            margin: auto;
            width: 70%;
        }
        amp-iframe{
            width:100%;
        }
        .wrapper-c{
            padding-top:20px;
            padding-left:20px;
            margin-left:20px;
        }
        section.services{
            margin-top:5%;
            width:98%;
            margin:auto;
            
        }
        .box{
            width:320px;
            padding: 0 20px 10px 10px;
            border: 1px black solid;
            display:inline-block;
        }
        a, a:active, a:hover{
            color:blue;
        }
        .marg-md{
            margin-top:30px;
        }
        .box-others{
            width:320px;
        }
        .bar-options{
            margin-top:5%;
            margin-bottom: 5%;
            width: 70%;
            margin-left:auto;
            margin-right:auto;
        }
    </style>
    
    <div>
        <amp-youtube 
              width="475"
              height="150"
              layout="responsive"
              data-videoid="lBTCB7yLs8Y">
        </amp-youtube>

        <div class="w-content">
            <div class="row"> 
                <div class="col col-sm-12 col-md-4 col-lg-4">
                    <div class="fixed-container">
                        <amp-img  class="cover" src="../content/site/placeholder.png"
                          alt="user-photo"
                          layout="fill"
                          >
                        </amp-img>
                     </div>
                </div>
                <div  class="col col-sm-12 col-md-8 col-lg-8">
                    <div class="wrapper-c">
                        <span>Obituary of</span>
                        <h2><b>
                            <span>John</span>
                            <span>"Nickname"</span>
                            <span>Deer</span>
                            <span>Doe</span>
                             </b>
                        </h2>
                        <span>December 13 th, 1945</span><br />
                        <span>December 14 th, 2017</span><br />
                        <span><b>The Huston Lawn Mower King</b></span>
                     </div>
                     <br />
                </div>
            </div>


            <div>
                <h3><b>Message from the family</b></h3>
                <p>
                    Aliquam semper justo in nulla aliquet elementum. 
                    Nunc suscipit vulputate elementum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae
                    ; Etiam aliquam risus mi, ac vehicula tortor porta a. Praesent auctor massa et turpis hendrerit, ut bibendum <a href="#">turpis volutpat.</a>
                </p>
            </div>
            
            <div>
                <h3><b>In Memory of John Doe</b></h3>
                <p>John was born June 16th, 1945 in
                    Bellaire, TX and passed away December 17th, 2017 in Houston, TX.
                </p>
                 <br />
                <h4><b>Obituary</b></h4>
                <p>
                    Nullam molestie sollicitudin ullamcorper. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla non urna augue. Nulla eros augue, tristique sed ultrices at, sollicitudin non tortor. Nullam in ipsum quis ipsum molestie facilisis et eget velit. Quisque iaculis, nulla a iaculis gravida, augue mauris aliquet magna, nec vehicula nibh nunc facilisis dolor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In feugiat erat ac lacus porta, in dapibus diam ullamcorper. Integer consectetur hendrerit dui, vehicula volutpat mauris iaculis sit amet.
                </p>
                <br />
                <h4><b>Biography</b></h4>
                <p>
                    Nullam molestie sollicitudin ullamcorper. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla non urna augue. Nulla eros augue, tristique sed ultrices at, sollicitudin non tortor. Nullam in ipsum quis ipsum molestie facilisis et eget velit.
                </p>
                <amp-accordion disable-session-states>
                      <section>
                        <h4 class="show">
                          <span class="show-more">Read more</span>
                          <span class="show-less">Read less</span>
                        </h4>
                        <p>Id lacus amet. Aliquam eos nunc ut scelerisque lacinia, eu rutrum id, vestibulum aliqua vivamus luctus eu rhoncus ut, sodales id. Velit lacus, fermentum neque et sagittis, ac venenatis volutpat, dolore neque feugiat proin fermentum odio, odio arcu
                          in eu wisi. </p>
                      </section>
                 </amp-accordion>
            </div>
            <br />

            <div class="row"> 
                 <div  class="col col-sm-12 col-md-6 col-lg-6 col-6">
                    <h4><b>Ganalogy</b></h4>
                    <span>Jane Joe Doe - Wlfe</span><br />
                    <span>Jim Bob Doe - Son</span><br />           
                </div>
                <div  class="col col-sm-12 col-md-6 col-lg-6 col-6">
                    <h4><b>Palbearers</b></h4>
                    <span>Jane Joe Doe - Wlfe</span><br />
                    <span>Jim Bob Doe - Son</span><br />
                    <span>Tim Johsnon - Friend</span><br />
                    <span>Billy Cartwright - Friend</span><br />          
                </div>
            </div>

        </div>

        <%-- bar options --%>
        <div class="container bar-options"> 
            <div class="row">
                <div class="col col-sm-12 col-md-3 col-lg-3">
                    <span>Donate</span>
                </div>
                <div class="col col-sm-12 col-md-3 col-lg-3">
                    <span>Send flowers</span>
                </div>
                <div class="col col-sm-12 col-md-3 col-lg-3">
                    <span>Share Obituary</span>
                </div>
                 <div class="col col-sm-12 col-md-3 col-lg-3">
                    <span>How to support</span>
                </div>
            </div>
        </div>

        <h3><b>Upcoming Services</b></h3>
        <amp-iframe width="600"
          height="150"
          layout="responsive"
          sandbox="allow-scripts allow-same-origin allow-popups"
          frameborder="0"
          src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJ2eUgeAK6j4ARbn5u_wAGqWA&key=AIzaSyCNCZ0Twm_HFRaZ5i-FuPDYs3rLwm4_848">
        </amp-iframe>
 
        <section class="services">
        <div class="row">
            <div class="col col-sm-12 col-md-4 col-lg-4 marg-md">
                <div class="box">
                    <h3><b>1. Funeral Service</b></h3>
                    <span>Wednesday, December 23, 2017 2:30pm - 5:00pm</span><br />
                    <br />
                    <p>Bring your Guitar with</p><br />
                    <span><b>Height Funeral Home</b></span><br />
                    <span>6873 Rainbow Road</span><br />
                    <span>Houston, TX 77008</span><br />
                    <a href="#">Directions</a><br />
                    <a href="#">Add to calendar</a>
                </div>
            </div>
            <div class="col col-sm-12 col-md-4 col-lg-4 marg-md">
                <div class="box">
                    <h3><b>1. Funeral Service</b></h3>
                    <span>Wednesday, December 23, 2017 2:30pm - 5:00pm</span><br />
                    <br />
                    <p>Bring your Guitar with</p><br />
                    <span><b>Height Funeral Home</b></span><br />
                    <span>6873 Rainbow Road</span><br />
                    <span>Houston, TX 77008</span><br />
                    <a href="#">Directions</a><br />
                    <a href="#">Add to calendar</a>
                </div>
            </div>
             <div class="col col-sm-12 col-md-4 col-lg-4 marg-md">
                 <div class="box">
                    <h3><b>1. Funeral Service</b></h3>
                    <span>Wednesday, December 23, 2017 2:30pm - 5:00pm</span><br />
                    <br />
                    <p>Bring your Guitar with</p><br />
                    <span><b>Height Funeral Home</b></span><br />
                    <span>6873 Rainbow Road</span><br />
                    <span>Houston, TX 77008</span><br />
                    <a href="#">Directions</a><br />
                    <a href="#">Add to calendar</a>
                </div>
            </div>
            <div class="col col-sm-12 col-md-4 col-lg-4 marg-md">
                 <div class="box">
                    <h3><b>1. Funeral Service</b></h3>
                    <span>Wednesday, December 23, 2017 2:30pm - 5:00pm</span><br />
                    <br />
                    <p>Bring your Guitar with</p><br />
                    <span><b>Height Funeral Home</b></span><br />
                    <span>6873 Rainbow Road</span><br />
                    <span>Houston, TX 77008</span><br />
                    <a href="#">Directions</a><br />
                    <a href="#">Add to calendar</a>
                </div>
            </div>
            <div class="col col-sm-12 col-md-4 col-lg-4 marg-md">
                 <div class="box-others">
                    <h3><b>Other Services</b></h3>
                    <p>Family Viewing</p>
                    <br />
                    <h3><b>Previous Services</b></h3>
                    <span><b>Viewing</b></span><span>Tuesday, December 22, 2017</span>
                    <br />
                </div>
            </div>
        </div>
    </section>
    
      <%-- bar options --%>
        <div class="container bar-options"> 
            <div class="row">
                <div class="col col-sm-12 col-md-3 col-lg-3">
                    <span>Donate</span>
                </div>
                <div class="col col-sm-12 col-md-3 col-lg-3">
                    <span>Send flowers</span>
                </div>
                <div class="col col-sm-12 col-md-3 col-lg-3">
                    <span>Share Obituary</span>
                </div>
                 <div class="col col-sm-12 col-md-3 col-lg-3">
                    <span>How to support</span>
                </div>
            </div>
        </div>



    </div>
	<ks:Snippet runat="server" Name="Layout08" />
</asp:Content>
