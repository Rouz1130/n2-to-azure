<%@ Page Title="Layout08" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,900" rel="stylesheet">
    <script async custom-element="amp-font" src="https://cdn.ampproject.org/v0/amp-font-0.1.js"></script>
    <script async custom-element="amp-iframe" src="https://cdn.ampproject.org/v0/amp-iframe-0.1.js"></script>
    <script async custom-element="amp-accordion" src="https://cdn.ampproject.org/v0/amp-accordion-0.1.js"></script>
    <script async custom-element="amp-youtube" src="https://cdn.ampproject.org/v0/amp-youtube-0.1.js"></script>    
    <script async src="https://cdn.ampproject.org/v0.js"></script>
    
    <meta name="viewport" content="width=device-width,minimum-scale=1">

    <style amp-custom>
        /*@import url('https://fonts.googleapis.com/css?family=Lato:400,700,900');

        @font-face {
            font-family: "Lato-Regular";
            src: url("https://fonts.googleapis.com/css?family=Lato:400,700,900"); 
        }*/

        .lato-regular{font-family:'Lato-Regular';}
        .lato-italic{font-family:'Lato-Italic';}
        
        .h1-style{font-family:'MrsEaves-Italic';color:#4A3C31;font-size: 86px;}
        .h2-style{font-family:'MrsEaves-Italic';color:#4A3C31;font-size: 72px;}
        .h3-style{font-family:'MrsEaves-Italic';color:#4A3C31;font-size: 48px;}
        .h4-style{font-family:'MrsEaves-Italic';color:#4A3C31;font-size: 36px;}
        .h5-style{font-family:'MrsEaves-Italic';color:#4A3C31;font-size: 24px;}
        .h6-style{font-family:'Lato';color:#4A3C31;font-size: 24px;font-weight:bold;}
        .nav{font-family:'Lato-Bold';color:#4A3C31;font-size: 16px;letter-spacing:0.3em;}
        .p-style{font-family:'Lato';color:#4A3C31;font-size: 16px;}
        .p-big-style{font-family:'Lato-Bold';color:#4A3C31;font-size: 20px;}
        .hyperlink{font-family:'Lato';color:#4A3C31;font-size: 16px;letter-spacing:0.3em;}

        .no-margin{margin:0;}
        .no-padding{padding:0;}
        .m-auto{margin:auto;}
        .mt-0{margin-top:0;}
        .mt-10{margin-top:10px;}
        .mt-30{margin-top:30px;}
        .mb-0{margin-bottom:0;}
        .mb-10{margin-bottom:10px;}
        .mb-20{margin-bottom:20px;}
        .mb-30{margin-bottom:30px;}
        .mbp-50{margin-top:50%;}
        .mbp-25{margin-top:25%;}

        .pt-30{padding-top:30px;}
        .pt-40{padding-top:40px;}
        .pb-30{padding-bottom:30px;}
        .pb-40{padding-bottom:40px;}

        .ptp-20{padding-top:20%;}
        .fc-green{color:#47d4cc;}

        .font08{font-size:8px;}
        .font10{font-size:10px;}
        .font12{font-size:12px;}
        .font15{font-size:15px;}
        .font30{font-size:30px;}
        .font40{font-size:40px;}
        .fs-40{font-size:40px;}
        .fs-50{font-size:50px;}

        .bg-white{background-color:#fff}
        .bg-gray{background-color:#f7f7f7;}
        .bg-green{background-color:#75e0da;}
        .bg-gray-02{background-color:#888785;}
        .bg-red{background-color:red;}
        
        .color-wh{color:#fff;}
        .color-g{color:gray;}
        .color-b{color:black;}
        .color-gr{color:#888888;}
        


        .txt-center{text-align:center;}
        /*amp-youtube{
            margin-top:10px;
        }*/
        .content-msg{
           margin: auto;
           width: 50%;
           min-height:250px;
           font-family: Lato-Regular, sans-serif; 
        }
        .line{
            width:170px;
            margin:auto;
            border:0.1px #4a3c31 solid;
            border-radius: 400px/5px;  
        }
        /*.line-card{
            width: 175px;
            border: 0.1px #4a3c31 solid;
            border-radius: 400px/5px;
            position: relative;
            display: -webkit-box;
            top: -40px;
            left: 20px;
            -webkit-transform: rotate(-90deg); 
            -moz-transform: rotate(-90deg);

        }*/
        .container-line{
            height: 100px;
            float: right;
            position: relative;
            top: -80px;
            left: 20px;
       }

        .line-card {
          width: 1px;
          height: 100%;
          margin: auto;
          position: relative;
          overflow: hidden;
        }
        .line-af {
          position: absolute;
          width:100%;
          height: 40%;
          background: grey;
          top: 30%;
          box-shadow: 0px 0px 30px 20px grey;
        }
    
    .link, .link:visited{
        padding-bottom:5px;
        color: #4a3c31;
        text-decoration:none;
        border-bottom: 2px solid #47D5CD;
    }
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
            border: none;
            border-color:transparent;
            outline:0px;
        }
        
        amp-accordion,.show-more,.show-less{
            /*float: right;
            top: -29px;*/
            margin-bottom:5px;
        }
               
        .fixed-container-img{
           position: relative;
           width: 100%;
           height: 350px;
        }

        .fixed-container {
           position: relative;
           width: 250px;
           height: 250px;
           margin:auto;
         }
        .f-container{
           position: relative;
           width: 100%;
           height: 300px;
        }

        amp-img.cover img {
            object-fit: cover;
        }
        .line-border{
            border:5px solid rgba(71, 212, 204, .7);
            top:-40px;
            position:relative;
        }
        .line-border-img{
            border:5px solid rgba(71, 212, 204, .7);
            top: 0px;
            position: relative;
            z-index: 1;
        }
        .shape{
            border-right: 2px solid #dbd9da;
            height: 100%;
        }
        .w-content{
            text-align:left;
            margin: auto;
            width: 65%;
            top:-100px;
            padding-top: 30px;
            position: relative;
        }
        amp-iframe{
            width:100%;
        }
        .wrapper-c{
            padding-top:20px;
            padding-left:20px;
            margin-left:20px;
        }
        .capitalLetter:first-letter{  
           font-size:120px;
           line-height:50px;
           padding:5px;
           font-family:'Times New Roman';
           font-style:italic;
           margin-right: 5px;
           float:left;
           }

        .box{
            width: 70%;
            height: 300px;
            position: relative;
            margin:auto;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);          
        }
       .shape-2{
           border-right: 2px solid #dbd9da;
           height: 100%;
           position:relative;

       }

       .bar-options{
            margin-top:5%;
            margin-bottom: 5%;
            width: 70%;
            margin-left:auto;
            margin-right:auto;
        }
       .bio{
            width:70%;
            margin-left:auto;
            margin-right:auto;
            margin-bottom:10%;
            margin-top:10%;
        }
        .content-bio{
            padding-top:10px;
        }
        /*.mem{
            height:300px;
            width:100%;
            background-color:lightgray;
        }
        footer{
            width:100%;
            height:30%;
            background-color:lightgray;
            text-align:center;
            padding-top:5%;
            padding-bottom: 5%;
        }*/
       
       
        .container-line-h { width: 70%; }
        .line-h {
          width: 100%;
          height:1px;
          margin: auto;
          position: relative;
          overflow: hidden;
        }
        .line-h-inner {
          position: absolute;
          height:100%;
          width: 30%;
          background: grey;
          right: 20%;
          box-shadow: 0px 0px 30px 20px grey;
        }
        
    </style>
    
 
    
    <div class="content-body">
      
        
        <div class="content-msg mb-30">
            <div class="row"> 
                <div class="col col-xs-12 col-md-12 col-lg-12">
               <p class="text-center text-uppercase mb-20 nav">A message from the family</p>
                    
                    <%--<div class="line"></div>--%>
                    <div class="container-line-h ">
                        <div class="line-h">
                            <div class="line-h-inner"></div>
                        </div>
                    </div>
                    <p class="text-left p-style mt-30">
                        Aliquam semper justo in nulla aliquet elementum. 
                        Nunc suscipit vulputate elementum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae
                        ; Etiam aliquam risus mi, ac vehicula tortor porta a.
                    </p>
                    <amp-accordion disable-session-states>
                      <section>
                        <h4 class="nav font15">
                          <span class="show-more text-uppercase ">see more</span>
                          <span class="show-less text-uppercase ">see less</span>
                        </h4>
                        <p class="p-style">Id lacus amet. Aliquam eos nunc ut scelerisque lacinia, eu rutrum id, vestibulum aliqua vivamus luctus eu rhoncus ut, sodales id. Velit lacus, fermentum neque et sagittis, ac venenatis volutpat, dolore neque feugiat proin fermentum odio, odio arcu
                          in eu wisi. </p>
                      </section>
                    </amp-accordion>
                   </div>
                </div>
        </div>
        
        <div class="container-fluid mt-30">
            <div class="fixed-container-img">
                        <amp-img  class="cover" src="../content/site/header.jpg"
                          alt="photo"
                          layout="fill"
                          >
                        </amp-img>
             </div>
        </div>

       <div class="w-content bg-white">
           <div class="line-border"></div>
            <div class="row"> 
                <div class="col col-xs-12 col-md-12 col-lg-12">
                    <h2 class="text-center  h2-style">Gladys Marion Dunton</h2>
                    <h6 class="text-center text-uppercase font15 h6-style">october 21, 1923 - august 4, 2017</h6>
                    <p class="text-center text-uppercase mb-30 p-style">"the plant whisperer"</p>

                    <div class="fixed-container">
                        <div class="line-border-img"></div>
                        <amp-img  class="cover" src="../content/site/surfaced-item.jpg" 
                          alt="user-photo"
                          layout="fill"
                          >
                        </amp-img>
                     </div>

                    <p class="text-center text-uppercase mt-30 hyperlink"><a class="link" href="#">play tribute video</a></p>
                    <h3 class="text-center fs-40 mt-30 h3-style">Gladys Marion Dutton was born October 21, 1923 in Dallas, TX, and passed away August 4, 2017 in Houston, TX</h3>
                
                    <p class="text-left capitalLetter p-style mt-30">
                        sellentesque sit amet elit metus. Sed vitae elit massa. Pellentesque ac dui ac ipsum semper dictum vel ac turpis. Fusce cursus risus sit amet elit tempus imperdiet. Cras justo ligula, fringilla ut facilisis sed, varius quis magna. Duis blandit, dui a fermentum egestas, turpis augue rutrum nunc, non interdum enim nibh et ipsum. Morbi consectetur arcu vel ipsum venenatis mattis. Integer iaculis molestie luctus.
                    </p>
                    <p class="text-left p-style mt-30">
                        Proin luctus posuere rutrum. Nullam facilisis tincidunt maximus. Proin porta risus massa, at iaculis est ultrices nec. Suspendisse eleifend sodales tempus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas in tempor purus. Praesent eleifend suscipit lacus, at tempus ex commodo non.
                    </p>
                     <p class="text-left p-style mt-30">
                          Quisque magna libero, iaculis sed posuere in, molestie a neque. Nunc ut vehicula ipsum. Maecenas ut aliquet nulla. Maecenas justo nisi, tempor aliquet mi vel, tincidunt dignissim dolor. Vestibulum ullamcorper urna a nunc luctus consequat. Vivamus at sapien imperdiet ante porta rutrum ac in metus.
                    </p>

                </div>
                           
        </div>

            <div class="row mt-30"> 
                 <div  class="col col-xs-12 col-md-6 col-lg-6 col-6">
                    <h6 class="text-uppercase font15 h6-style">family</h6>
                    <span class="h5-style">Herald Loyd Dunton,</span><span class="p-style"> husband</span><br />
                    <span class="h5-style">Dorianna Cliford, </span><span class="p-style"> daughter</span><br />         
                </div>
                <div  class="col col-xs-12 col-md-6 col-lg-6 col-6">
                    <h6 class="text-uppercase font15 h6-style">Pallbearers</h6>
                    <span class="h5-style">Herald Loyd Dunto</span><br />
                    <span class="h5-style">Matthew Cliford</span><br />
                    <span class="h5-style">Joe Whitacker, honorary</span><span class="p-style"> honorary</span><br />
                    <span class="h5-style">Denis Patterson, honorary</span><span class="p-style"> honorary</span><br />         
                </div>
            </div>

        </div> 
           
            <%-- bar options --%>
        <div class="container bar-options text-center nav font10"> 
            <div class="row">
                <div class="col-xs-3 col-md-3 col-lg-3 shape">
                    <a href="#"><span class="text-uppercase">the family requests donations to lorem ipsum</span></a>
                </div>
                <div class=" col-xs-3 col-md-3 col-lg-3">
                    <a href="#"><span class="text-uppercase">Send flowers</span></a>
                </div>
                <div class=" col-xs-3 col-md-3 col-lg-3">
                    <a href="#"><span class="text-uppercase">Share Obituary</span></a>
                </div>
                 <div class=" col-xs-3 col-md-3 col-lg-3">
                    <a href="#"><span class="text-uppercase">How to support</span></a>
                </div>
            </div>
        </div>     
        
        <%-- services --%>  
 
        <section class="container-fluid mt-30 pt-40 bg-gray pb-40">
            <h2 class="text-center h2-style  mb-30">Services</h2>
           <div class="row mb-30 ">
                <div class="box bg-white ">
                    <div class="col col-xs-3 col-md-3 col-lg-3 text-center"> 
                        <h2 class="h2-style mbp-50">23</h2>
                        <span class="text-uppercase p-style ">december</span>
                        <div  class="container-line" >
                            <div class="line-card">
                                  <div class="line-af"></div>
                            </div>
                       </div>                  
                    </div>
                    <div class="col col-xs-6 col-md-6 col-lg-6 ">
                        <h4 class="h4-style mt-30">Visitation</h4>
                        <p class="p-style ">5:30pm - 9:00pm</p>
                        <h6 class="h6-style text-uppercase font15 mt-30">heights funeral home</h6>
                        <span class="p-style">6873 Rainbow Rd</span><br />
                        <span class="p-style">Houston, TX 77008</span><br />
                        <span class="h5-style mt-30">Don't wear black.</span><br />
                    </div>
                    <div class="col col-xs-3 col-md-3 col-lg-3">
                        <p class="text-center text-uppercase mt-30 pt-30"><a class="link" href="#">get directions</a></p>
                        <p class="text-center text-uppercase mt-30 "><a class="link" href="#">send flowers</a></p>  
                                
                    </div>
                </div>
            </div>
             <div class="row mb-30 ">
                <div class="box bg-white ">
                    <div class="col col-xs-6 col-md-3 col-lg-3 text-center"> 
                        <h2 class="h2-style mbp-50">24</h2>
                        <span class="text-uppercase p-style ">december</span>
                        <div  class="container-line" >
                            <div class="line-card">
                                  <div class="line-af"></div>
                            </div>
                       </div>                  
                    </div>
                    <div class="col col-xs-6 col-md-6 col-lg-6 ">
                        <h4 class="h4-style mt-30">Funeral Service</h4>
                        <p class="p-style ">2:30pm - 5:00pm</p>
                        <h6 class="h6-style text-uppercase font15 mt-30">heights funeral home</h6>
                        <span class="p-style">6873 Rainbow Rd</span><br />
                        <span class="p-style">Houston, TX 77008</span><br />
                        <span class="h5-style mt-30">Bring your guitar.</span><br />
                    </div>
                    <div class="col col-xs-12 col-md-3 col-lg-3">
                        <p class="text-center text-uppercase mt-30 h6-style font15 pt-30"><a class="link" href="#">get directions</a></p>
                        <p class="text-center text-uppercase mt-30 h6-style font15"><a class="link" href="#">send flowers</a></p>  
                                
                    </div>
                </div>
            </div>
            <h6 class="text-center mt-30 pt-30"><span class="text-uppercase h6-style font15">other services: </span><span class="h5-style">Family Viewing</span></h6>
             <div class="container bar-options nav font10 text-center"> 
            <div class="row">
                <div class="col col-xs-4 col-md-4 col-lg-4">
                   <%-- <h4 class="text-center text-uppercase">get event updates</h4>--%>
                    <a href="#" ><h6 class="text-uppercase">get event updates</h6></a>
                </div>
                <div class="col col-xs-4 col-md-4 col-lg-4">
                    <%--<h4 class="text-center text-uppercase">Share services</h4>--%>
                    <a href="#" ><h6 class="text-uppercase">Share services</h6></a>
                </div>
                 <div class="col col-xs-4 col-md-4 col-lg-4">
                    <%--<h4 class="text-center text-uppercase">How to support</h4>--%>
                     <a href="#"><h6 class="text-uppercase">How to support</h6></a>
                </div>
            </div>
        </div>
    </section>
    
     <%-- Remembering --%>
        <div class="mt-30 mb-30 pt-40 pb-40">
            <h6  class="text-center text-uppercase h6-style color-gr mb-10">REMEMBERING</h6>
            <h2 class="text-center h2-style">Gladys Marion Dunton</h2>
       </div>

        <div class="containder-fluid  pb-40 pt-40 mb-30">
            <div class="row bg-gray">
                <div class="col col-xs-12 col-md-6 col-lg-6  pb-40 pt-40 mb-30 mt-30">
                    <h5 class="text-left h5-style">
                        My mom made me who I am.... And I love her so much for showing me to never compromise who I am whether prople like it or not...showing me how to be strong and independent...
                    </h5>
                    <p class="mt-30 p-style color-gr"><span>Salley Peterson </span><span>Posted July 24th, 2017</span></p>
                </div>
                <div class="col col-xs-12 col-md-6 col-lg-6 bg-green">
                    <div class="row">
                        <div class="col col-xs-4 col-md-4 col-lg-4 no-padding">
                            <div class="f-container">
                                <amp-img  class="cover"  src="../content/site/header-narrow.jpg"
                                  alt="user-photo"
                                  layout="fill"
                                  >
                                </amp-img>
                            </div>
                        </div>
                        <div class="col col-xs-4 col-md-4 col-lg-4 no-padding">
                            <div class="f-container">
                                <amp-img  class="cover" src="../content/site/surfaced-item.jpg"  
                                  alt="user-photo"
                                  layout="fill"
                                  >
                                </amp-img>
                            </div>
                        </div>
                        <div class="col col-xs-4 col-md-4 col-lg-4 bg-green" style="height:300px;"> 
                            <h2 class="text-center  mt-30 h2-style pt-30 color-wh">+45</h2>
                            <p class="text-center p-style mt-10 color-wh "><span class="text-uppercase">More memories shared by family and friends</span></p> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-30 mb-30 pt-40 pb-40 text-center">
            <h4 class="text-center h4-style">Have a memory or condolence to share?</h4>
            <h6 class="text-uppercase h6-style font12">share a memory</h6>
       </div>

        <%-- Biography --%>
        <section class="container-fluid bg-gray mb-30">
            <div class="bio">
                <h2 class="text-center h2-style mb-30">Biography</h2>
            <div class="content-bio">
                <p class="p-style">
                    Morbi sed libero quis dui fringilla venenatis. Donec eleifend leo sed tellus facilisis, eu ornare quam laoreet. Duis augue massa, rutrum a scelerisque ut, dapibus et sem. Proin elementum porta nunc, eget commodo turpis vehicula eget. Phasellus eu magna eros. Integer sagittis mauris id cursus tristique. Nam dapibus, lacus nec egestas hendrerit, ante nisi congue augue, eget fringilla eros enim a mauris. Nullam sapien massa, dignissim eu nisi commodo, mattis faucibus tellus. Donec felis nunc, tempor vel lectus molestie, auctor luctus erat. Aliquam tempor suscipit lacus a porttitor. Suspendisse potenti. Nulla luctus dapibus tristique. Mauris vitae sapien quis felis congue finibus at quis risus. In hac habitasse platea dictumst.
                </p>
                <p class="p-style">
                    Proin gravida mauris et enim sagittis fermentum. Fusce quis ullamcorper felis, at viverra diam. Vivamus id vehicula tellus. In ut fermentum orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse vitae viverra ligula, sed vulputate nisl. Suspendisse lorem nulla, porttitor ac felis vel, porta ultrices ex.
                </p>
                <p class="p-style">
                    Mauris quis eleifend nisl. Nullam lacus velit, malesuada at cursus a, imperdiet eget tellus. Nullam varius, nunc sed porta efficitur, eros libero congue ex, tempor laoreet odio sapien sagittis sem. Ut condimentum eros pharetra, maximus tellus sed, aliquam lacus. Integer congue eleifend tellus a eleifend. Morbi pellentesque sit amet nulla ac malesuada. Phasellus elementum vel arcu et porttitor. Duis eget est placerat, fermentum ex ut, ultricies massa. Curabitur non tincidunt justo. Pellentesque vel tellus lectus. Proin vitae orci pharetra, accumsan turpis non, malesuada mauris. Etiam ut metus id dolor imperdiet tempus nec vel diam. Ut finibus massa sapien. Aliquam quis egestas erat. Ut tellus orci, ullamcorper ac accumsan sed, efficitur at sem.
                </p>
                <p class="p-style">
                    Mauris quis eleifend nisl. Nullam lacus velit, malesuada at cursus a, imperdiet eget tellus. Nullam varius, nunc sed porta efficitur, eros libero congue ex, tempor laoreet odio sapien sagittis sem. Ut condimentum eros pharetra, maximus tellus sed, aliquam lacus. Integer congue eleifend tellus a eleifend. Morbi pellentesque sit amet nulla ac malesuada. Phasellus elementum vel arcu et porttitor. Duis eget est placerat, fermentum ex ut, ultricies massa. Curabitur non tincidunt justo. Pellentesque vel tellus lectus. Proin vitae orci pharetra, accumsan turpis non, malesuada mauris. Etiam ut metus id dolor imperdiet tempus nec vel diam. Ut finibus massa sapien. Aliquam quis egestas erat. Ut tellus orci, ullamcorper ac accumsan sed, efficitur at sem.
                </p>
               

            </div>
            </div>
        </section>

        
            <div class="text-center pb-40 pt-40">
                <span class="text-uppercase">in the care of</span>
                <p class="">
                    Chattanooga Funeral Home North Chapel
                </p>
                <p class="">
                    Hamilton Memorial Gardens Chattanooga, TN
                </p>
            </div>

            <div class="container-fluid bg-gray text-center pb-40 pt-40">
                    <h2 class="text-uppercase">life well celebrated</h2>
            </div>
        
    </div>
	<ks:Snippet runat="server" Name="Layout08" />
</asp:Content>
