<%@ Page Title="ObitDetail" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,900" rel="stylesheet">
    <script async custom-element="amp-font" src="https://cdn.ampproject.org/v0/amp-font-0.1.js"></script>
    <script async custom-element="amp-iframe" src="https://cdn.ampproject.org/v0/amp-iframe-0.1.js"></script>
    <script async custom-element="amp-accordion" src="https://cdn.ampproject.org/v0/amp-accordion-0.1.js"></script>
    <script async custom-element="amp-social-share" src="https://cdn.ampproject.org/v0/amp-social-share-0.1.js"></script>
    <script async custom-element="amp-youtube" src="https://cdn.ampproject.org/v0/amp-youtube-0.1.js"></script>
    <script async src="https://cdn.ampproject.org/v0.js"></script>

    <meta name="viewport" content="width=device-width,minimum-scale=1">

    <style amp-custom>
        /*@import url('https://fonts.googleapis.com/css?family=Lato:400,700,900');

        @font-face {
            font-family: "Lato-Regular";
            src: url("https://fonts.googleapis.com/css?family=Lato:400,700,900"); 
        }*/
        @import url("../content/sci/css/core.min.css");

        .lato-regular {
            font-family: 'Lato-Regular';
        }

        .lato-bold {
            font-family: 'Lato-Bold';
        }

        .lato-italic {
            font-family: 'Lato-Italic';
        }

        .h1-style {
            font-family: 'MrsEaves-Italic';
            color: #4A3C31;
            font-size: 86px;
        }

        .h2-style {
            font-family: 'MrsEaves-Italic';
            color: #4A3C31;
            font-size: 72px;
        }

        .h3-style {
            font-family: 'MrsEaves-Italic';
            color: #4A3C31;
            font-size: 48px;
        }

        .h4-style {
            font-family: 'MrsEaves-Italic';
            color: #4A3C31;
            font-size: 36px;
        }

        .h5-style {
            font-family: 'MrsEaves-Italic';
            color: #4A3C31;
            font-size: 24px;
        }

        .h6-style {
            font-family: 'Lato';
            color: #4A3C31;
            font-size: 24px;
            font-weight: bold;
        }

        .h-110 {
            height: 110px;
        }

        .nav {
            font-family: 'Lato-Bold';
            color: #4A3C31;
            font-size: 16px;
            letter-spacing: 0.3em;
        }

        .p-style {
            font-family: 'Lato';
            color: #4A3C31;
            font-size: 16px;
        }

        .p-big-style {
            font-family: 'Lato-Bold';
            color: #4A3C31;
            font-size: 20px;
        }

        .hyperlink {
            font-family: 'Lato';
            color: #4A3C31;
            font-size: 16px;
            letter-spacing: 0.3em;
        }

        .no-margin {
            margin: 0;
        }

        .no-padding {
            padding: 0;
        }

        .m-auto {
            margin: auto;
        }

        .mt-0 {
            margin-top: 0;
        }

        .mt-10 {
            margin-top: 10px;
        }

        .mt-30 {
            margin-top: 30px;
        }

        .mb-0 {
            margin-bottom: 0;
        }

        .mb-10 {
            margin-bottom: 10px;
        }

        .mb-20 {
            margin-bottom: 20px;
        }

        .mb-30 {
            margin-bottom: 30px;
        }

        .mbp-50 {
            margin-top: 50%;
        }

        .mbp-25 {
            margin-top: 25%;
        }

        .mbp-30 {
            margin-bottom: 30%;
        }

        .pt-10 {
            padding-top: 10px;
        }

        .pt-30 {
            padding-top: 30px;
        }

        .pt-40 {
            padding-top: 40px;
        }

        .pb-30 {
            padding-bottom: 30px;
        }

        .pb-40 {
            padding-bottom: 40px;
        }

        .pl-10 {
            padding-left: 10px;
        }

        .ptp-20 {
            padding-top: 20%;
        }

        .fc-green {
            color: #47d4cc;
        }

        .font08 {
            font-size: 8px;
        }

        .font10 {
            font-size: 10px;
        }

        .font12 {
            font-size: 12px;
        }

        .font15 {
            font-size: 15px;
        }

        .font30 {
            font-size: 30px;
        }

        .font40 {
            font-size: 40px;
        }

        .fs-40 {
            font-size: 40px;
        }

        .fs-50 {
            font-size: 50px;
        }

        .bg-white {
            background-color: #fff;
        }

        .bg-gray {
            background-color: #f7f7f7;
        }

        .bg-green {
            background-color: #75e0da;
        }

        .bg-gray-02 {
            background-color: #888785;
        }

        .bg-gg {
            background-color: #eeebe6;
        }

        .color-wh {
            color: #fff;
        }

        .color-g {
            color: gray;
        }

        .color-b {
            color: black;
        }

        .color-gr {
            color: #888888;
        }

        .border-b {
            border-bottom: 1px solid #75e0da;
        }


        .txt-center {
            text-align: center;
        }
        /*amp-youtube{
            margin-top:10px;
        }*/
        .content-msg {
            margin: auto;
            width: 50%;
            min-height: 250px;
            font-family: Lato-Regular, sans-serif;
        }

        .line {
            width: 170px;
            margin: auto;
            border: 0.1px #4a3c31 solid;
            border-radius: 400px/5px;
        }

        .container-line {
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
            width: 100%;
            height: 40%;
            background: grey;
            top: 30%;
            box-shadow: 0px 0px 30px 20px grey;
        }

        .link, .link:visited {
            padding-bottom: 5px;
            color: #4a3c31;
            text-decoration: none;
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

        h4.i-amphtml-accordion-header:focus {
            border: none;
            border-color: transparent;
            outline: 0px;
        }

        amp-accordion, .show-more, .show-less {
            margin-bottom: 5px;
        }

        .fixed-container-img {
            position: relative;
            width: 100%;
            height: 350px;
        }

        .fixed-container {
            position: relative;
            width: 250px;
            height: 250px;
            margin: auto;
        }

        .f-container {
            position: relative;
            width: 100%;
            height: 300px;
        }

        amp-img.cover img {
            object-fit: cover;
        }

        .line-border {
            border: 5px solid rgba(71, 212, 204, .7);
            top: -40px;
            position: relative;
        }

        .line-border-img {
            border: 5px solid rgba(71, 212, 204, .7);
            top: 0px;
            position: relative;
            z-index: 1;
        }

        .shape {
            border-right: 2px solid #dbd9da;
            height: 100%;
        }

        .w-content {
            text-align: left;
            margin: auto;
            width: 65%;
            top: -100px;
            padding-top: 30px;
            position: relative;
        }

        amp-iframe {
            width: 100%;
        }

        .wrapper-c {
            padding-top: 20px;
            padding-left: 20px;
            margin-left: 20px;
        }

        .capitalLetter:first-letter {
            font-size: 120px;
            line-height: 50px;
            padding: 5px;
            font-family: 'Times New Roman';
            font-style: italic;
            margin-right: 5px;
            float: left;
        }

        .box {
            width: 70%;
            height: 300px;
            position: relative;
            margin: auto;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        }

        .shape-2 {
            border-right: 2px solid #dbd9da;
            height: 100%;
            position: relative;
        }

        .bar-options {
            margin-top: 5%;
            margin-bottom: 5%;
            width: 70%;
            margin-left: auto;
            margin-right: auto;
        }

        .bio {
            width: 70%;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 10%;
            margin-top: 10%;
        }

        .content-bio {
            padding-top: 10px;
        }

        .container-line-h {
            width: 70%;
        }

        .line-h {
            width: 100%;
            height: 1px;
            margin: auto;
            position: relative;
            overflow: hidden;
        }

        .line-h-inner {
            position: absolute;
            height: 100%;
            width: 30%;
            background: grey;
            right: 20%;
            box-shadow: 0px 0px 30px 20px grey;
        }

        amp-social-share[type="facebook"] {
            /*background:transparent;*/
            /*background-image: url(datauri:svg/myownsvgicon);*/
            /*background-image: url("../content/sci/img/icons/icon-share.png");
            background-repeat: no-repeat;
            background-position: center center;*/
            background: url("../content/sci/img/icons/icon-share.png") center no-repeat;
            background-size: cover;
            /*border:solid 1px #47D5CD;*/
            outline: 0;
        }

        /*   ---------- box ----------------*/
        .date-cont {
            position: relative;
            margin-top: 50%;
        }

        .link-cont {
            position: relative;
            /*margin-top: 50%;*/
        }

        .w-40 {
            width: 40px;
        }

        /*---------card services---------*/

        .card {
            max-width: 955px;
            width: 70%;
            height: 255px;
            background-color: #fff;
            position: relative;
            margin-right: auto;
            margin-left: auto;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
        }

        .col-link {
            height: 255px;
            display: table;
            padding-right: 5px;
            padding-left: 5px;
        }

        .row-link, .row-date {
            display: table-cell;
            vertical-align: middle;
        }

        .col-date {
            height: 200px;
            display: table;
            padding-right: 5px;
            padding-left: 5px;
        }

        .content-d {
            width: 130px;
            height: 130px;
            position: absolute;
            top: 40px;
            display: block;
        }

        /*------section remembering------*/

        /*-----nav----*/

        #sub-nav {
            text-align: center;
            width: auto;
        }

            #sub-nav ul {
                list-style-type: none;
                /*margin-left: auto;
                margin-right: auto;*/
            }

            #sub-nav li {
                margin-right: 15px;
                display: inline-block;
                float: none;
            }

                #sub-nav li a {
                    display: block;
                    text-align: center;
                    text-decoration: none;
                }

        .active {
            border-bottom: dashed 0.5px;
        }


        #buttons-rem {
            text-align: center;
            width: auto;
        }

            #buttons-rem a {
                margin-right: 15px;
                margin-left: 15px;
                display: inline-block;
                float: none;
            }


        .fixed-container-rem01 {
            position: relative;
            width: 350px;
            height: 450px;
            margin: auto;
        }

        .fixed-container-rem02 {
            position: relative;
            width: auto;
            height: 450px;
            margin: auto;
        }


        /* nav */
        .sub-nav-main {
            text-align: center;
            /*width:auto;*/
            /*width:90%;*/
        }

            .sub-nav-main ul {
                list-style-type: none;
                display: block;
            }

            .sub-nav-main li {
                margin-right: 15px;
                padding-right: 15px;
                display: inline-block;
                float: none;
                height: 100px;
                max-width: 147px;
                vertical-align: middle;
            }

                .sub-nav-main li a {
                    display: block;
                    text-align: center;
                    text-decoration: none;
                    /*letter-spacing:0;*/
                }

                .sub-nav-main li.first:after {
                    content: ' ';
                    background-image: url(../content/sci/img/icons.png);
                    background-position: -500px 0;
                    overflow: hidden;
                    width: 2px;
                    height: 55px;
                    transform: translate(-50%,-50%);
                    top: -50%;
                    position: relative;
                    float: right;
                    left: 20px;
                }

                .sub-nav-main li:after {
                }

        .container-icon {
            position: relative;
            width: 50px;
            height: 50px;
            margin: auto;
        }

        .item-desc {
            height: 30px;
            width: 20px;
            font-size: 10px;
        }

        .nav-buttons {
            position: absolute;
            top: 100px;
            left: -165px;
            width: 185px;
        }

            .nav-buttons > .nav {
                letter-spacing: 1.5px;
            }

        .btn-nav {
            border-radius: 0;
            font-size: .875rem;
            margin: .125rem;
            background-color: transparent;
            border: 2px solid #47d5cd;
            color: #4a3c31;
            font-family: Lato-Bold;
            position: relative;
            text-transform: uppercase;
            max-width: 100%;
            width: 170px;
            padding: 10px 5px;
        }

        .f-left {
            float: left;
        }

        .f-right {
            float: right;
        }

        .center-block {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }


        .close-msg {
            position: relative;
            top: -53px;
            padding-right: 10px;
            margin-right: 5%;
        }

        .content-m {
            margin: auto;
            width: 50%;
            font-family: Lato-Regular, sans-serif;
        }

        .container-p {
            width: 250px;
            padding: 10px 15px;
            margin: auto;
        }

        .container-share {
            width: 70%;
            margin-left: auto;
            margin-right: auto;
        }

        .container-icon-share {
            position: relative;
            width: 70px;
            height: 70px;
            margin: auto;
        }
        /*------- media queries  -----*/

        /*@screen-xs-max*/

        @media (max-width: 768px) {


            .font40 {
                font-size: 30px;
            }

            .font15 {
                font-size: 10px;
            }
            /*.h2-style {font-size: 35px;}*/
            .h2-style-sm {
                font-size: 55px;
            }

            .h3-style {
                font-size: 25px;
            }

            .h5-style {
                font-size: 15px;
            }

            .h4-style {
                font-size: 20px;
            }

            .hyperlink {
                font-size: 10px;
            }


            /*.container-line {
                top: -50px;
            }*/

            /*.link-cont {
                position: relative;
                margin-top: 0;
            }*/

            .box {
                width: auto;
                height: 350px;
                margin-right: 10%;
                margin-left: 10%;
            }

            .fixed-container-rem01 {
                /*width: 250px;
              height: 149px;*/
                /*width: 120px;
                height: 150px;*/
                width: 150px;
                height: 220px;
            }

            .container-icon {
                width: 50px;
                height: 50px;
            }

            .sub-nav-main li {
                height: 80px;
                max-width: 100px;
                margin: 0 5px;
                padding: 0;
            }

                .sub-nav-main li.first:after {
                    left: 10px;
                }

            .card {
                height: 300px;
            }

            .row-link {
                display: block;
            }

            .col-link {
                height: 0;
            }

            .content-d {
                position: static;
                display: block;
                float: right;
            }

            .link-cont {
                margin-top: 20px;
            }

            .container-line {
                top: -70px;
                left: 0;
            }

            .container-p {
                width: auto;
            }
        }

        /* @screen-sm-min @screen-sm-max*/
        @media (min-width: 768px) and (max-width: 992px) {


            .fixed-container-rem01 {
                /*width: 150px;
                 height: 220px;*/
            }

            .card {
                width: auto;
                height: 300px;
                margin-left: 10%;
                margin-right: 10%;
            }

            .col-link {
                height: 255px;
                display: table;
                padding-right: 5px;
                padding-left: 5px;
            }

            .row-link, .row-date {
                display: table-cell;
                vertical-align: middle;
            }

            f-sm-none {
                float: none;
            }
        }


        @media (max-width: 961px) {
            /*.font40 {
                font-size: 30px;
            }
            .font15 {font-size: 10px;}
            /*.h2-style {font-size: 35px;}*/

            /*.h3-style {
                font-size: 25px;
            }
            .h5-style {
                font-size: 15px;
            }
            .h4-style {font-size: 20px;}
            .hyperlink {
                font-size: 10px;
            }*/

            .fixed-container {
                width: 120px;
                height: 170px;
            }

            .fixed-container-img {
                height: 150px;
            }

            .w-content {
                width: 90%;
                top: -80px;
                padding-top: 30px;
            }

            .full {
                padding-left: 0;
                padding-right: 0;
                margin-right: 0;
                margin-left: 0;
                width: 100%;
            }

            .line-border {
                border: 2px solid rgba(71, 212, 204, .7);
                top: -34px;
            }

            .line-border-img {
                border: 2px solid rgba(71, 212, 204, .7);
            }

            .content-msg {
                width: 80%;
                min-height: 170px;
            }

            .bar-options {
                width: 95%;
            }

            mt-30 {
                margin-top: 10px;
            }

            .capitalLetter:first-letter {
                font-size: 80px;
                line-height: 40px;
            }

            .box {
                width: 90%;
                height: 370px;
            }
        }

        @media (max-width:641px) {
            /*.box{
                width: 90%;
                height: 320px;
            }*/
            /*.box {
                    width: auto;
                    height: 350px;
                    margin-right: 10%;
                    margin-left: 10%;
                }*/
            .row-link {
                display: block;
            }

            .col-link {
                height: 0;
            }

            .content-d {
                position: static;
                display: block;
            }

            .link-cont {
                margin-top: 20px;
            }

            .container-line {
                top: -70px;
                left: 0;
            }

            .row-date {
                display: block;
            }
        }


        @media (max-width: 548px ) {
            .container-icon {
                width: 30px;
                height: 30px;
            }

            .sub-nav-main li {
                font-size: 10px;
                height: 50px;
                max-width: 70px;
                margin: 0 5px;
            }
        }

        @media(max-width:540px) {
            .card {
                /*height:300px;*/
                height: auto;
                width: auto;
            }

            .row-link {
                display: block;
            }

            .col-link {
                height: 0;
            }

            .content-d {
                position: static;
                display: block;
            }

            .link-cont {
                margin-top: 20px;
            }

            .container-line {
                top: -70px;
                left: 0;
            }
        }

        @media (max-width: 400px) {
            .font40 {
                font-size: 20px;
            }

            .h2-style {
                font-size: 20px;
            }

            .h3-style {
                font-size: 15px;
            }

            .nav {
                font-size: 7px;
            }

            .p-style {
                font-size: 12px;
            }

            .h2-style-xs {
                font-size: 55px;
            }


            .box {
                width: auto;
                height: 270px;
            }

            .cont-dates {
                padding-top: 5px;
            }

            .container-icon {
                width: 30px;
                height: 30px;
            }

            .sub-nav-main li {
                height: 50px;
                max-width: 45px;
                margin: 0 5px;
            }

            .card {
                width: auto;
                height: 300px;
                margin-left: auto;
                margin-right: auto;
            }
        }

        .sub-nav-main > ul {
            padding: 0;
        }

        @media(max-width:767px) {
            .f-left-sm {
                float: left;
            }

            .f-right-sm {
                float: right;
            }

            .link, .link:visited {
                padding-bottom: 1px;
            }
        }

        @media (max-width: 400px) {
            .sub-nav-main li {
                font-size: 7px;
            }
        }

        @media(max-width:310px) {
            .card {
                height: auto;
            }

            .col-date {
                display: block;
                padding-left: 0;
                padding-right: 0;
            }

            .content-d {
                width: auto;
                float: none;
            }

            .container-line {
                left: -10px;
            }

            .pl-0-xs {
                padding-left: 0;
            }
        }

        /*.icon {
	        background-repeat: no-repeat;
	        display: inline-block;
	        position: relative;
        }
        .icon-facebook{
        (200px, 300px, -200px, -300px, 100px, 100px, 502px, 499px, '../content/sci/img/icons.png', 'icon-facebook', );

        }*/
    </style>



    <div class="content-body mt-30 pt-30">


        <div class="  full mt-30">
            <div class="fixed-container-img">
                <amp-img class="fill" src="../content/site/header.jpg" alt="photo" layout="fill"></amp-img>
            </div>
        </div>

        <div class="w-content bg-white">
            <div class="line-border"></div>
            <div class="row">
                <div class="col col-xs-12 col-md-12 col-lg-12">
                    <h2 class="text-center  h2-style h2-style-sm">Gladys Marion Dunton</h2>
                    <h3 class="text-center fs-40 mt-30 h3-style">Gladys Marion Dutton was born October 21, 1923 in Dallas, TX, and passed away August 4, 2017 in Houston, TX</h3>

                    <div class="content-m mt-30  hidden-xs">
                        <h6 class="text-center p-style  font15 color-g mt-30 mb-30">Obituary and service information are unavailable at this time. Please check back later for updates.
                        </h6>
                    </div>
                    <div class="mt-30 ">
                        <p class="text-uppercase text-center nav font12 first"><a class="link" href="#">Recieve updates</a></p>
                    </div>
                </div>
            </div>



        </div>



        <%-- share the memories --%>

        <section class="container-fluid pt-40  bg-gg pb-40">
            <h3 class="text-center h3-style h2-style-sm mb-30">Share the memories</h3>


            <div class="mt-30">
                <p class="p-style font15 color-gr text-center container-share mb-30">
                    Even the simplest memory providers comfort to family and friends. Share a favorite memory or anything that made you laught or smile.
                </p>
                <a href="#">
                    <div class="container-icon-share mt-30">
                        <amp-img class="cover" src="../content/sci/img/icons/chat.png" alt="icon" layout="fill"></amp-img>
                    </div>
                    <h5 class="nav text-center text-uppercase font12 ">share a memory</h5>
                </a>

            </div>
            <div class="mt-30 mb-30">
                <div class="row">
                    <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6 text-center">

                        <p class="text-center text-uppercase font12  nav mt-30"><a class="link" href="#">recieve updates</a></p>
                        <div class="container-p">
                            <p class="text-center nav text-uppercase font10 mt-10 color-gr">when friends and family add new memories</p>
                        </div>
                    </div>
                    <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6">

                        <p class="text-center text-uppercase  font12 nav mt-30"><a class="link" href="#">tips</a></p>
                        <div class="container-p">
                            <p class="text-center nav text-uppercase font10 mt-10 color-gr">for sharing memories and condolences</p>
                        </div>
                    </div>

                </div>
            </div>


            <%--  --%>
            <div class="clearfix"></div>


        </section>




        <div class="text-center pb-40 pt-40">
            <span class="text-uppercase nav hidden-xs">in the care of</span>
            <span class="text-uppercase nav hidden-sm hidden-md hidden-lg">under the care of</span>
            <h4 class="h4-style mt-30">Chattanooga Funeral Home North Chapel
            </h4>
            <h4 class="h4-style">Hamilton Memorial Gardens Chattanooga, TN
            </h4>
        </div>


    </div>
    <%--<ks:Snippet runat="server" Name="Layout08" />--%>
</asp:Content>
