<%-- 
    Document   : home
    Created on : Feb 20, 2025, 5:02:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


    <!-- Mirrored from jthemes.net/themes/html/harmony-event/home.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:02:54 GMT -->
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Harmoni - Home 1</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.png">

        <!-- fraimwork - css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <!-- icon css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/flaticon.css">

        <!-- carousel css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick-theme.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/owl.theme.default.min.css">

        <!-- others css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery.mCustomScrollbar.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/calendar.css">

        <!-- color switcher css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/colors/style-switcher.css">
        <link id="color_theme" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/colors/default.css">

        <!-- custom css include -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">

    </head>


    <body>





        <!-- backtotop - start -->
        <div id="thetop" class="thetop"></div>
        <div class='backtotop'>
            <a href="#thetop" class='scroll'>
                <i class="fas fa-angle-double-up"></i>
            </a>
        </div>
        <!-- backtotop - end -->

        <!-- preloader - start -->
        <div id="preloader"></div>
        <!-- preloader - end -->





        <!-- header-section - start
        ================================================== -->
        <header id="header-section" class="header-section sticky-header-section not-stuck clearfix">
            <!-- header-bottom - start -->
            <div class="header-bottom">
                <div class="container">
                    <div class="row">

                        <!-- site-logo-wrapper - start -->
                        <div class="col-lg-3">
                            <div class="site-logo-wrapper">
                                <a href="home.jsp" class="logo">
                                    <img src="${pageContext.request.contextPath}/assets/images/1.site-logo.png" alt="logo_not_found">
                                </a>
                            </div>
                        </div>
                        <!-- site-logo-wrapper - end -->

                        <!-- mainmenu-wrapper - start -->
                        <div class="col-lg-9">
                            <div class="mainmenu-wrapper">
                                <div class="row">

                                    <!-- menu-item-list - start -->
                                    <div class="col-lg-10">
                                        <div class="menu-item-list ul-li clearfix">
                                            <ul>
                                                <li class="menu-item-has-children active">
                                                    <a href="home.jsp" class="active" >home</a>
                                                </li>
                                                <li class="menu-item-has-children">
                                                    <a href="#!">about</a>
                                                    <ul class="sub-menu">
                                                        <li><a href="about.jsp">about us</a></li>
                                                        <li><a href='service.jsp'>service</a></li>
                                                        <!--                                                        <li><a href='faq.jsp'>FAQ</a></li>-->
                                                    </ul>
                                                </li>
                                                <li class="menu-item-has-children">
                                                    <a href="#!">events</a>
                                                    <ul class="sub-menu">
                                                        <li class="menu-item-has-children">
                                                            <a href='list-event.jsp'>event List</a>
                                                        </li>
                                                        <li><a href='event-details.jsp'>event details</a></li>
                                                        <li><a href='booking.jsp'>event booking</a></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <a href="gallery.jsp">gallery</a>
                                                </li>
                                                <li class="menu-item-has-children">
                                                    <a href="contact.jsp">contact us</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- menu-item-list - end -->

                                    <!-- menu-item-list - start -->
                                    <div class="col-lg-2">
                                        <div class="user-search-btn-group ul-li clearfix">
                                            <ul>
                                                <li>
                                                    <a href="#login-modal" class="login-modal-btn">
                                                        <i class="fas fa-user"></i>
                                                    </a>
                                                    <div id="login-modal" class="reglog-modal-wrapper mfp-hide clearfix" style="background-image: url('${pageContext.request.contextPath}/assets/images/login-modal-bg.jpg');">
                                                        <div class="overlay-black clearfix">

                                                            <!-- leftside-content - start -->
                                                            <div class="leftside-content">
                                                                <div class="site-logo-wrapper mb-80">
                                                                    <a href="#!" class="logo">
                                                                        <img src="${pageContext.request.contextPath}/assets/images/2.site-logo.png" alt="logo_not_found">
                                                                    </a>
                                                                </div>
                                                                <div class="register-login-link mb-80">
                                                                    <ul>
                                                                        <li class="active"><a href="#!">Login</a></li>
                                                                        <li><a href="#!">Register</a></li>
                                                                    </ul>
                                                                </div>
                                                                <div class="copyright-text">
                                                                    <p class="m-0">©2019 <a href="#!" class="yellow-color">Harmoni.com</a> all right reserved, made with <i class="fas fa-heart"></i> by jThemes Studio </p>
                                                                </div>
                                                            </div>
                                                            <!-- leftside-content - end -->

                                                            <!-- rightside-content - start -->
                                                            <div class="rightside-content text-center">

                                                                <div class="mb-30">
                                                                    <h2 class="form-title title-large white-color">Account <strong>Login</strong></h2>
                                                                    <span class="form-subtitle white-color">Login to our website, or <strong>REGISTER</strong></span>
                                                                </div>

                                                                <div class="fb-login-btn mb-30">
                                                                    <a href="#!">
                                                                        <span class="icon">
                                                                            <i class="fab fa-facebook-f"></i>
                                                                        </span>
                                                                        login with facebook
                                                                    </a>
                                                                </div>

                                                                <div class="or-text mb-30">
                                                                    <span>or sign in</span>
                                                                </div>

                                                                <div class="login-form text-center mb-50">
                                                                    <form action="#!">
                                                                        <div class="form-item">
                                                                            <input type="email" placeholder="example@gmail.com">
                                                                        </div>
                                                                        <div class="form-item">
                                                                            <input type="password" placeholder="Password">
                                                                        </div>
                                                                        <button type="submit" class="login-btn">login now</button>
                                                                    </form>
                                                                </div>

                                                                <div class="bottom-text white-color">
                                                                    <p class="m-0">
                                                                        * Denotes mandatory field.
                                                                    </p>
                                                                    <p class="m-0">** At least one telephone number is required.</p>
                                                                </div>

                                                            </div>
                                                            <!-- rightside-content - end -->

                                                            <a class="popup-modal-dismiss" href="#!">
                                                                <i class="fas fa-times"></i>
                                                            </a>

                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <button type="button" class="toggle-overlay search-btn">
                                                        <i class="fas fa-search"></i>
                                                    </button>
                                                    <!-- search-body - start -->
                                                    <div class="search-body">
                                                        <div class="search-form">
                                                            <form action="#">
                                                                <input class="search-input" type="search" placeholder="Search Here">
                                                                <div class="outer-close toggle-overlay">
                                                                    <button type="button" class="search-close">
                                                                        <i class="fas fa-times"></i>
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <!-- search-body - end -->
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- menu-item-list - end -->

                                </div>
                            </div>
                        </div>
                        <!-- mainmenu-wrapper - end -->

                    </div>
                </div>
            </div>
            <!-- header-bottom - end -->
        </header>
        <!-- header-section - end
        ================================================== -->





        <!-- altranative-header - start
        ================================================== -->
        <jsp:include page="common/altranative-header.jsp"></jsp:include>
        <!-- altranative-header - end
        ================================================== -->


        
        
        
        <!-- slide-section - start
        ================================================== -->
            <section id="slide-section" class="slide-section clearfix">
                <div id="main-carousel1" class="main-carousel1 owl-carousel owl-theme">

                    <div class="item" style="background-image: url('${pageContext.request.contextPath}/assets/images/slider/slider-bg1.jpg');">
                    <div class="overlay-black">
                        <div class="container">
                            <div class="slider-item-content">

                                <span class="medium-text">one stop</span>
                                <h1 class="big-text">Event Planner</h1>
                                <small class="small-text">every event sould be perfect</small>

                                <div class="link-groups">
                                    <a href="about.jsp" class="about-btn custom-btn">about us</a>
                                    <a href="#!" class="start-btn">get started!</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="item" style="background-image: url('${pageContext.request.contextPath}/assets/images/slider/slider-bg2.jpg');">
                    <div class="overlay-black">
                        <div class="container">
                            <div class="slider-item-content">

                                <span class="medium-text">one stop</span>
                                <h1 class="big-text">Event Planner</h1>
                                <small class="small-text">every event sould be perfect</small>

                                <div class="link-groups">
                                    <a href="about.jsp" class="about-btn custom-btn">about us</a>
                                    <a href="#!" class="start-btn">get started!</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="item" style="background-image: url('${pageContext.request.contextPath}/assets/images/slider/slider-bg3.jpg');">
                    <div class="overlay-black">
                        <div class="container">
                            <div class="slider-item-content">

                                <span class="medium-text">one stop</span>
                                <h1 class="big-text">Event Planner</h1>
                                <small class="small-text">every event sould be perfect</small>

                                <div class="link-groups">
                                    <a href="about.jsp" class="about-btn custom-btn">about us</a>
                                    <a href="#!" class="start-btn">get started!</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- slide-section - end
        ================================================== -->





        <!-- upcomming-event-section - start
        ================================================== -->
        <section id="upcomming-event-section" class="upcomming-event-section sec-ptb-100 clearfix">
            <div class="container">

                <!-- section-title - start -->
                <div class="section-title text-center mb-50">
                    <small class="sub-title">upcomming events</small>
                    <h2 class="big-title">Latest <strong>Awesome Events</strong></h2>
                </div>
                <!-- section-title - end -->

                <!-- upcomming-event-carousel - start -->
                <div id="upcomming-event-carousel" class="upcomming-event-carousel owl-carousel owl-theme">

                    <!-- item - start -->
                    <div class="item">
                        <div class="event-item">

                            <div class="countdown-timer">
                                <ul class="countdown-list" data-countdown="2020/08/08"></ul>
                            </div>

                            <div class="event-image">
                                <img src="${pageContext.request.contextPath}/assets/images/upcomming-events/event-1.jpg" alt="Image_not_found">
                                <div class="post-date">
                                    <span class="date">26</span>
                                    <small class="month">june</small>
                                </div>
                            </div>

                            <div class="event-content">
                                <div class="event-title mb-30">
                                    <h3 class="title">
                                        The Governors Music Festival 2019
                                    </h3>
                                    <span class="ticket-price yellow-color">Tickets from $52</span>
                                </div>
                                <div class="event-post-meta ul-li-block mb-30">
                                    <ul>
                                        <li>
                                            <span class="icon">
                                                <i class="far fa-clock"></i>
                                            </span>
                                            Start 20:00pm - 22:00pm
                                        </li>
                                        <li>
                                            <span class="icon">
                                                <i class="fas fa-map-marker-alt"></i>
                                            </span>
                                            Manhattan, New York
                                        </li>
                                    </ul>
                                </div>
                                <a href="#!" class="custom-btn">
                                    tickets & details
                                </a>
                            </div>

                        </div>
                    </div>
                    <!-- item - end -->

                    <!-- item - start -->
                    <div class="item">
                        <div class="event-item">

                            <div class="countdown-timer">
                                <ul class="countdown-list" data-countdown="2020/08/08"></ul>
                            </div>

                            <div class="event-image">
                                <img src="${pageContext.request.contextPath}/assets/images/upcomming-events/event-2.jpg" alt="Image_not_found">
                                <div class="post-date">
                                    <span class="date">28</span>
                                    <small class="month">aug</small>
                                </div>
                            </div>

                            <div class="event-content">
                                <div class="event-title mb-30">
                                    <h3 class="title">
                                        The Governors Music Festival 2019
                                    </h3>
                                    <span class="ticket-price yellow-color">Tickets from $52</span>
                                </div>
                                <div class="event-post-meta ul-li-block mb-30">
                                    <ul>
                                        <li>
                                            <span class="icon">
                                                <i class="far fa-clock"></i>
                                            </span>
                                            Start 20:00pm - 22:00pm
                                        </li>
                                        <li>
                                            <span class="icon">
                                                <i class="fas fa-map-marker-alt"></i>
                                            </span>
                                            Manhattan, New York
                                        </li>
                                    </ul>
                                </div>
                                <a href="#!" class="custom-btn">
                                    tickets & details
                                </a>
                            </div>

                        </div>
                    </div>
                    <!-- item - end -->

                    <!-- item - start -->
                    <div class="item">
                        <div class="event-item">

                            <div class="countdown-timer">
                                <ul class="countdown-list" data-countdown="2020/08/08"></ul>
                            </div>

                            <div class="event-image">
                                <img src="${pageContext.request.contextPath}/assets/images/upcomming-events/event-3.jpg" alt="Image_not_found">
                                <div class="post-date">
                                    <span class="date">20</span>
                                    <small class="month">may</small>
                                </div>
                            </div>

                            <div class="event-content">
                                <div class="event-title mb-30">
                                    <h3 class="title">
                                        The Governors Music Festival 2019
                                    </h3>
                                    <span class="ticket-price yellow-color">Tickets from $52</span>
                                </div>
                                <div class="event-post-meta ul-li-block mb-30">
                                    <ul>
                                        <li>
                                            <span class="icon">
                                                <i class="far fa-clock"></i>
                                            </span>
                                            Start 20:00pm - 22:00pm
                                        </li>
                                        <li>
                                            <span class="icon">
                                                <i class="fas fa-map-marker-alt"></i>
                                            </span>
                                            Manhattan, New York
                                        </li>
                                    </ul>
                                </div>
                                <a href="#!" class="custom-btn">
                                    tickets & details
                                </a>
                            </div>

                        </div>
                    </div>
                    <!-- item - end -->

                    <!-- item - start -->
                    <div class="item">
                        <div class="event-item">

                            <div class="countdown-timer">
                                <ul class="countdown-list" data-countdown="2020/08/08"></ul>
                            </div>

                            <div class="event-image">
                                <img src="${pageContext.request.contextPath}/assets/images/upcomming-events/event-1.jpg" alt="Image_not_found">
                                <div class="post-date">
                                    <span class="date">26</span>
                                    <small class="month">june</small>
                                </div>
                            </div>

                            <div class="event-content">
                                <div class="event-title mb-30">
                                    <h3 class="title">
                                        The Governors Music Festival 2019
                                    </h3>
                                    <span class="ticket-price yellow-color">Tickets from $52</span>
                                </div>
                                <div class="event-post-meta ul-li-block mb-30">
                                    <ul>
                                        <li>
                                            <span class="icon">
                                                <i class="far fa-clock"></i>
                                            </span>
                                            Start 20:00pm - 22:00pm
                                        </li>
                                        <li>
                                            <span class="icon">
                                                <i class="fas fa-map-marker-alt"></i>
                                            </span>
                                            Manhattan, New York
                                        </li>
                                    </ul>
                                </div>
                                <a href="#!" class="custom-btn">
                                    tickets & details
                                </a>
                            </div>

                        </div>
                    </div>
                    <!-- item - end -->

                    <!-- item - start -->
                    <div class="item">
                        <div class="event-item">

                            <div class="countdown-timer">
                                <ul class="countdown-list" data-countdown="2020/08/08"></ul>
                            </div>

                            <div class="event-image">
                                <img src="${pageContext.request.contextPath}/assets/images/upcomming-events/event-2.jpg" alt="Image_not_found">
                                <div class="post-date">
                                    <span class="date">28</span>
                                    <small class="month">aug</small>
                                </div>
                            </div>

                            <div class="event-content">
                                <div class="event-title mb-30">
                                    <h3 class="title">
                                        The Governors Music Festival 2019
                                    </h3>
                                    <span class="ticket-price yellow-color">Tickets from $52</span>
                                </div>
                                <div class="event-post-meta ul-li-block mb-30">
                                    <ul>
                                        <li>
                                            <span class="icon">
                                                <i class="far fa-clock"></i>
                                            </span>
                                            Start 20:00pm - 22:00pm
                                        </li>
                                        <li>
                                            <span class="icon">
                                                <i class="fas fa-map-marker-alt"></i>
                                            </span>
                                            Manhattan, New York
                                        </li>
                                    </ul>
                                </div>
                                <a href="#!" class="custom-btn">
                                    tickets & details
                                </a>
                            </div>

                        </div>
                    </div>
                    <!-- item - end -->

                    <!-- item - start -->
                    <div class="item">
                        <div class="event-item">

                            <div class="countdown-timer">
                                <ul class="countdown-list" data-countdown="2020/08/08"></ul>
                            </div>

                            <div class="event-image">
                                <img src="${pageContext.request.contextPath}/assets/images/upcomming-events/event-3.jpg" alt="Image_not_found">
                                <div class="post-date">
                                    <span class="date">20</span>
                                    <small class="month">may</small>
                                </div>
                            </div>

                            <div class="event-content">
                                <div class="event-title mb-30">
                                    <h3 class="title">
                                        The Governors Music Festival 2019
                                    </h3>
                                    <span class="ticket-price yellow-color">Tickets from $52</span>
                                </div>
                                <div class="event-post-meta ul-li-block mb-30">
                                    <ul>
                                        <li>
                                            <span class="icon">
                                                <i class="far fa-clock"></i>
                                            </span>
                                            Start 20:00pm - 22:00pm
                                        </li>
                                        <li>
                                            <span class="icon">
                                                <i class="fas fa-map-marker-alt"></i>
                                            </span>
                                            Manhattan, New York
                                        </li>
                                    </ul>
                                </div>
                                <a href="#!" class="custom-btn">
                                    tickets & details
                                </a>
                            </div>

                        </div>
                    </div>
                    <!-- item - end -->

                </div>
                <!-- upcomming-event-carousel - end -->

            </div>
        </section>
        <!-- upcomming-event-section - end
        ================================================== -->





        <!-- about-section - start
        ================================================== -->
        <section id="about-section" class="about-section sec-ptb-100 clearfix">
            <div class="container">
                <div class="row">

                    <!-- section-title - start -->
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="section-title text-left mb-30">
                            <span class="line-style"></span>
                            <small class="sub-title">we are harmoni</small>
                            <h2 class="big-title"><strong>No.1</strong> Events Management</h2>
                            <p class="black-color mb-50">
                                Lorem ipsum dollor site amet the best  consectuer adipiscing elites sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat insignia the consectuer adipiscing elit. 
                            </p>
                            <a href="#!" class="custom-btn">
                                about harmonei
                            </a>
                        </div>
                    </div>
                    <!-- section-title - end -->

                    <!-- about-item-wrapper - start -->
                    <div class="col-lg-8 col-md-12 col-sm-12">
                        <div class="about-item-wrapper ul-li">
                            <ul>

                                <li>
                                    <a href="#!" class="about-item">
                                        <span class="icon">
                                            <i class="flaticon-handshake"></i>
                                        </span>
                                        <strong class="title">
                                            Friendly Team
                                        </strong>
                                        <small class="sub-title">
                                            More than 200 teams
                                        </small>
                                    </a>
                                </li>
                                <li>
                                    <a href="#!" class="about-item">
                                        <span class="icon">
                                            <i class="flaticon-two-balloons"></i>
                                        </span>
                                        <strong class="title">
                                            perfact venues
                                        </strong>
                                        <small class="sub-title">
                                            perfact venues
                                        </small>
                                    </a>
                                </li>
                                <li>
                                    <a href="#!" class="about-item">
                                        <span class="icon">
                                            <i class="flaticon-cheers"></i>
                                        </span>
                                        <strong class="title">
                                            Unique Scenario
                                        </strong>
                                        <small class="sub-title">
                                            We thinking out of the box
                                        </small>
                                    </a>
                                </li>

                                <li>
                                    <a href="#!" class="about-item">
                                        <span class="icon">
                                            <i class="flaticon-clown-hat"></i>
                                        </span>
                                        <strong class="title">
                                            Unforgettable Time
                                        </strong>
                                        <small class="sub-title">
                                            We make you perfect event
                                        </small>
                                    </a>
                                </li>
                                <li>
                                    <a href="#!" class="about-item">
                                        <span class="icon">
                                            <i class="flaticon-speech-bubble"></i>
                                        </span>
                                        <strong class="title">
                                            24/7 Hours Support
                                        </strong>
                                        <small class="sub-title">
                                            Anytime anywhere
                                        </small>
                                    </a>
                                </li>
                                <li>
                                    <a href="#!" class="about-item">
                                        <span class="icon">
                                            <i class="flaticon-light-bulb"></i>
                                        </span>
                                        <strong class="title">
                                            Briliant Idea
                                        </strong>
                                        <small class="sub-title">
                                            We have million idea
                                        </small>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <!-- about-item-wrapper - end -->

                </div>
            </div>
        </section>
        <!-- about-section - end
        ================================================== -->





        <!-- conference-section - start
        ================================================== -->
        <section id="conference-section" class="conference-section clearfix">
            <div class="jarallax" style="background-image: url('${pageContext.request.contextPath}/assets/images/conference/pexels-photo-262669.jpg');">
                <div class="overlay-black sec-ptb-100">

                    <div class="mb-50">
                        <div class="container">
                            <div class="row">

                                <!-- section-title - start -->
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="section-title text-left">
                                        <span class="line-style"></span>
                                        <small class="sub-title">harmoni venues</small>
                                        <h2 class="big-title">Conference <strong>Rooms & Hotels</strong></h2>
                                    </div>
                                </div>
                                <!-- section-title - end -->

                                <!-- conference-location - start -->
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="conference-location ul-li clearfix">
                                        <ul>

                                            <!-- country-select - start -->
                                            <li class="country-select">
                                                <form action="#!">
                                                    <label for="country">Country :</label>
                                                    <select class="custom-select" id="country">
                                                        <option selected>Netherland</option>
                                                        <option value="1">USA</option>
                                                        <option value="2">england</option>
                                                        <option value="3">germany</option>
                                                    </select>	
                                                </form>
                                            </li>
                                            <!-- country-select - end -->

                                            <!-- city-select - start -->
                                            <li class="city-select">
                                                <form action="#!">
                                                    <label for="city">city :</label>
                                                    <select class="custom-select" id="city">
                                                        <option selected>Amsterdam</option>
                                                        <option value="1">washington</option>
                                                        <option value="2">london</option>
                                                        <option value="3">berlin</option>
                                                    </select>	
                                                </form>
                                            </li>
                                            <!-- city-select - end -->

                                        </ul>
                                    </div>
                                </div>
                                <!-- conference-location - end -->

                            </div>
                        </div>
                    </div>

                    <!-- conference-content-wrapper - start -->
                    <div class="tab-wrapper">

                        <!-- tab-menu - start -->
                        <div class="container">
                            <div class="row justify-content-lg-start">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="tab-menu">
                                        <ul class="nav tab-nav mb-50">

                                            <li class="nav-item">
                                                <a class="nav-link active" id="nav-one-tab" data-toggle="tab" href="#nav-one" aria-expanded="true">
                                                    <span class="image">
                                                        <img src="${pageContext.request.contextPath}/assets/images/conference/RCJAKPP_00016_coddddnversion.jpg" alt="Image_not_found">
                                                    </span>
                                                    <span class="title">
                                                        <strong class="yellow-color">5 <i class="fas fa-star"></i> Chocolato </strong>
                                                        Hotel
                                                    </span>
                                                    <small class="sub-title">Party Room 2.500 seats</small>
                                                    <small class="price yellow-color">Price from $52/night</small>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="nav-two-tab" data-toggle="tab" href="#nav-two" aria-expanded="false">
                                                    <span class="image">
                                                        <img src="${pageContext.request.contextPath}/assets/images/conference/fresh-conference-room-microphones-decoration-ideas-collection-gallery-to-conference-room-microphones-home-ideas.jpg" alt="Image_not_found">
                                                    </span>
                                                    <span class="title">
                                                        <strong class="yellow-color">4 <i class="fas fa-star"></i> Vanila </strong>
                                                        Hotel
                                                    </span>
                                                    <small class="sub-title">Party Room 2.500 seats</small>
                                                    <small class="price yellow-color">Price from $52/night</small>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="nav-three-tab" data-toggle="tab" href="#nav-three" aria-expanded="false">
                                                    <span class="image">
                                                        <img src="${pageContext.request.contextPath}/assets/images/conference/RCTORON_00047ss.jpg" alt="Image_not_found">
                                                    </span>
                                                    <span class="title">
                                                        <strong class="yellow-color">3 <i class="fas fa-star"></i> Pear </strong>
                                                        Hotel
                                                    </span>
                                                    <small class="sub-title">Party Room 2.500 seats</small>
                                                    <small class="price yellow-color">Price from $52/night</small>
                                                </a>
                                            </li>

                                            <li class="nav-item">
                                                <a class="nav-link" id="nav-four-tab" data-toggle="tab" href="#nav-four" aria-expanded="false">
                                                    <span class="image">
                                                        <img src="${pageContext.request.contextPath}/assets/images/conference/clayton-hotel-leopardstown-meeting-room-1.jpg" alt="Image_not_found">
                                                    </span>
                                                    <span class="title">
                                                        <strong class="yellow-color">5 <i class="fas fa-star"></i> Chocolato </strong>
                                                        Hotel
                                                    </span>
                                                    <small class="sub-title">Party Room 2.500 seats</small>
                                                    <small class="price yellow-color">Price from $52/night</small>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="nav-five-tab" data-toggle="tab" href="#nav-five" aria-expanded="false">
                                                    <span class="image">
                                                        <img src="${pageContext.request.contextPath}/assets/images/conference/conference-room-with-projection-facilities-3d-model-max.jpg" alt="Image_not_found">
                                                    </span>
                                                    <span class="title">
                                                        <strong class="yellow-color">4 <i class="fas fa-star"></i> Vanila </strong>
                                                        Hotel
                                                    </span>
                                                    <small class="sub-title">Party Room 2.500 seats</small>
                                                    <small class="price yellow-color">Price from $52/night</small>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="nav-six-tab" data-toggle="tab" href="#nav-six" aria-expanded="false">
                                                    <span class="image">
                                                        <img src="${pageContext.request.contextPath}/assets/images/conference/midlands-park-hotel-meeting-rooms.jpg" alt="Image_not_found">
                                                    </span>
                                                    <span class="title">
                                                        <strong class="yellow-color">3 <i class="fas fa-star"></i> pear </strong>
                                                        Hotel
                                                    </span>
                                                    <small class="sub-title">Party Room 2.500 seats</small>
                                                    <small class="price yellow-color">Price from $52/night</small>
                                                </a>
                                            </li>

                                        </ul>
                                        <div class="more-btn">
                                            <a href="#!">
                                                <strong class="yellow-color">VIEW ALL</strong> HOTEL & RESORT
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- tab-menu - end -->

                        <!-- tab-content - start -->
                        <div class="tab-content">
                            <!-- tab-pane - start -->
                            <div class="tab-pane fade active show" id="nav-one" role="tabpanel" aria-labelledby="nav-one-tab" aria-expanded="true">
                                <div class="image">
                                    <img src="${pageContext.request.contextPath}/assets/images/conference/RCJAKPP_00016_coddddnversion.jpg" alt="Image_not_found">
                                    <a href="#!" class="custom-btn">
                                        booking now
                                    </a>
                                    <div class="badge-item">
                                        <div class="content">
                                            <i class="fas fa-star"></i>
                                            <strong>5.0</strong>
                                            <small>featured hotel</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- tab-pane - end -->

                            <!-- tab-pane - start -->
                            <div class="tab-pane fade" id="nav-two" role="tabpanel" aria-labelledby="nav-two-tab" aria-expanded="false">
                                <div class="image">
                                    <img src="${pageContext.request.contextPath}/assets/images/conference/fresh-conference-room-microphones-decoration-ideas-collection-gallery-to-conference-room-microphones-home-ideas.jpg" alt="Image_not_found">
                                    <a href="#!" class="custom-btn">
                                        booking now
                                    </a>
                                    <div class="badge-item">
                                        <div class="content">
                                            <i class="fas fa-star"></i>
                                            <strong>5.0</strong>
                                            <small>featured hotel</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- tab-pane - end -->

                            <!-- tab-pane - start -->
                            <div class="tab-pane fade" id="nav-three" role="tabpanel" aria-labelledby="nav-three-tab" aria-expanded="false">
                                <div class="image">
                                    <img src="${pageContext.request.contextPath}/assets/images/conference/RCTORON_00047ss.jpg" alt="Image_not_found">
                                    <a href="#!" class="custom-btn">
                                        booking now
                                    </a>
                                    <div class="badge-item">
                                        <div class="content">
                                            <i class="fas fa-star"></i>
                                            <strong>5.0</strong>
                                            <small>featured hotel</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- tab-pane - end -->

                            <!-- tab-pane - start -->
                            <div class="tab-pane fade" id="nav-four" role="tabpanel" aria-labelledby="nav-four-tab" aria-expanded="false">
                                <div class="image">
                                    <img src="${pageContext.request.contextPath}/assets/images/conference/clayton-hotel-leopardstown-meeting-room-1.jpg" alt="Image_not_found">
                                    <a href="#!" class="custom-btn">
                                        booking now
                                    </a>
                                    <div class="badge-item">
                                        <div class="content">
                                            <i class="fas fa-star"></i>
                                            <strong>5.0</strong>
                                            <small>featured hotel</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- tab-pane - end -->

                            <!-- tab-pane - start -->
                            <div class="tab-pane fade" id="nav-five" role="tabpanel" aria-labelledby="nav-five-tab" aria-expanded="false">
                                <div class="image">
                                    <img src="${pageContext.request.contextPath}/assets/images/conference/conference-room-with-projection-facilities-3d-model-max.jpg" alt="Image_not_found">
                                    <a href="#!" class="custom-btn">
                                        booking now
                                    </a>
                                    <div class="badge-item">
                                        <div class="content">
                                            <i class="fas fa-star"></i>
                                            <strong>5.0</strong>
                                            <small>featured hotel</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- tab-pane - end -->

                            <!-- tab-pane - start -->
                            <div class="tab-pane fade" id="nav-six" role="tabpanel" aria-labelledby="nav-six-tab" aria-expanded="false">
                                <div class="image">
                                    <img src="${pageContext.request.contextPath}/assets/images/conference/midlands-park-hotel-meeting-rooms.jpg" alt="Image_not_found">
                                    <a href="#!" class="custom-btn">
                                        booking now
                                    </a>
                                    <div class="badge-item">
                                        <div class="content">
                                            <i class="fas fa-star"></i>
                                            <strong>5.0</strong>
                                            <small>featured hotel</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- tab-pane - end -->

                        </div>
                        <!-- tab-content - end -->

                    </div>
                    <!-- conference-content-wrapper - end -->

                </div>
            </div>
        </section>
        <!-- conference-section - end
        ================================================== -->





        <!-- special-offer-section - start
        ================================================== -->
        <section id="special-offer-section" class="special-offer-section clearfix" style="background-image: url('${pageContext.request.contextPath}/assets/images/special-offer-bg.png');">
            <div class="container">
                <div class="row">

                    <!-- special-offer-content - start -->
                    <div class="col-lg-9 col-md-12 col-sm-12">
                        <div class="special-offer-content">
                            <h2><strong>30%</strong> Off in June~July for <span>Birthday Events</span></h2>
                            <p class="m-0">
                                Contact us now and we will make your event unique & unforgettable
                            </p>
                        </div>
                    </div>
                    <!-- special-offer-content - end -->

                    <!-- event-makeing-btn - start -->
                    <div class="col-lg-3 col-md-12 col-sm-12">
                        <div class="event-makeing-btn">
                            <a href="#!">make an event now</a>
                        </div>
                    </div>
                    <!-- event-makeing-btn - end -->

                </div>
            </div>
        </section>
        <!-- special-offer-section - end
        ================================================== -->





        <!-- event-section - start
        ================================================== -->
        <section id="event-section" class="event-section sec-ptb-100 bg-gray-light clearfix">
            <div class="container">

                <div class="mb-50">
                    <div class="row">

                        <!-- section-title - start -->
                        <div class="col-lg-3 col-md-12 col-sm-12">
                            <div class="section-title text-left">
                                <span class="line-style"></span>
                                <small class="sub-title">harmoni events</small>
                                <h2 class="big-title"><strong>event</strong> listing</h2>
                            </div>
                        </div>
                        <!-- section-title - end -->

                        <!-- event-tab-menu - start -->
                        <div class="col-lg-8 col-md-12 col-sm-12">
                            <div class="event-tab-menu clearfix">
                                <ul class="nav">
                                    <li>
                                        <a data-toggle="tab" href="#conference-event">
                                            <strong><i class="fas fa-microphone"></i> conference</strong> event
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#playground-event">
                                            <strong><i class="fas fa-birthday-cake"></i> play ground</strong> event
                                        </a>
                                    </li>
                                    <li>
                                        <a class="active" data-toggle="tab" href="#musical-event">
                                            <strong><i class="fas fa-music"></i> musical</strong> event
                                        </a>
                                    </li>
                                    <li>
                                        <a data-toggle="tab" href="#other-event">
                                            <strong><i class="far fa-check-square"></i> other</strong> event
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- event-tab-menu - end -->

                    </div>
                </div>

                <!-- tab-content - start -->
                <div class="tab-content">

                    <!-- conference-event - start -->
                    <div id="conference-event" class="tab-pane fade">
                        <div class="row">
                            <c:forEach items="${listEvent}" var="e">
                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-1.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                ${e.title}
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->
                            </c:forEach>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="pagination ul-li clearfix">
                                    <ul>
                                        <li class="page-item prev-item">
                                            <a class="page-link" href="#">Prev</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">01</a></li>
                                        <li class="page-item active"><a class="page-link" href="#">02</a></li>
                                        <li class="page-item"><a class="page-link" href="#">03</a></li>
                                        <li class="page-item"><a class="page-link" href="#">04</a></li>
                                        <li class="page-item"><a class="page-link" href="#">05</a></li>
                                        <li class="page-item next-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                                    
                    </div>
                    <!-- conference-event - end -->

                    <!-- playground-event - start -->
                    <div id="playground-event" class="tab-pane fade">
                        <div class="row">

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-1.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-2.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-3.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-4.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-5.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-6.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="pagination ul-li clearfix">
                                    <ul>
                                        <li class="page-item prev-item">
                                            <a class="page-link" href="#">Prev</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">01</a></li>
                                        <li class="page-item active"><a class="page-link" href="#">02</a></li>
                                        <li class="page-item"><a class="page-link" href="#">03</a></li>
                                        <li class="page-item"><a class="page-link" href="#">04</a></li>
                                        <li class="page-item"><a class="page-link" href="#">05</a></li>
                                        <li class="page-item next-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- playground-event - end -->

                    <!-- musical-event - start -->
                    <div id="musical-event" class="tab-pane fade in active show">
                        <div class="row">

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-1.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-2.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-3.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-4.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-5.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-6.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="pagination ul-li clearfix">
                                    <ul>
                                        <li class="page-item prev-item">
                                            <a class="page-link" href="#">Prev</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">01</a></li>
                                        <li class="page-item active"><a class="page-link" href="#">02</a></li>
                                        <li class="page-item"><a class="page-link" href="#">03</a></li>
                                        <li class="page-item"><a class="page-link" href="#">04</a></li>
                                        <li class="page-item"><a class="page-link" href="#">05</a></li>
                                        <li class="page-item next-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- musical-event - end -->

                    <!-- other-event - start -->
                    <div id="other-event" class="tab-pane fade">
                        <div class="row">

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-1.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-2.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-3.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-4.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-5.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <!-- event-item - start -->
                            <div class="col-lg-6 col-md-12 col-sm-12">
                                <div class="event-item clearfix">

                                    <!-- event-image - start -->
                                    <div class="event-image">
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <small class="month">june</small>
                                        </div>
                                        <img src="${pageContext.request.contextPath}/assets/images/event/event-6.jpg" alt="Image_not_found">
                                    </div>
                                    <!-- event-image - end -->

                                    <!-- event-content - start -->
                                    <div class="event-content">
                                        <div class="event-title mb-15">
                                            <h3 class="title">
                                                Barcelona Food truck Festival 2018
                                            </h3>
                                            <span class="ticket-price yellow-color">Tickets from $52</span>
                                        </div>
                                        <div class="event-post-meta ul-li-block mb-30">
                                            <ul>
                                                <li>
                                                    <span class="icon">
                                                        <i class="far fa-clock"></i>
                                                    </span>
                                                    Start 20:00pm - 22:00pm
                                                </li>
                                                <li>
                                                    <span class="icon">
                                                        <i class="fas fa-map-marker-alt"></i>
                                                    </span>
                                                    Manhattan, New York
                                                </li>
                                            </ul>
                                        </div>
                                        <a href="#!" class="tickets-details-btn">
                                            tickets & details
                                        </a>
                                    </div>
                                    <!-- event-content - end -->

                                </div>
                            </div>
                            <!-- event-item - end -->

                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="pagination ul-li clearfix">
                                    <ul>
                                        <li class="page-item prev-item">
                                            <a class="page-link" href="#">Prev</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">01</a></li>
                                        <li class="page-item active"><a class="page-link" href="#">02</a></li>
                                        <li class="page-item"><a class="page-link" href="#">03</a></li>
                                        <li class="page-item"><a class="page-link" href="#">04</a></li>
                                        <li class="page-item"><a class="page-link" href="#">05</a></li>
                                        <li class="page-item next-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- other-event - end -->

                </div>
                <!-- tab-content - end -->

            </div>
        </section>
        <!-- event-section - end
        ================================================== -->





        <!-- event-gallery-section - start
        ================================================== -->
        <section id="event-gallery-section" class="event-gallery-section sec-ptb-100 clearfix">

            <!-- section-title - start -->
            <div class="section-title text-center mb-50">
                <small class="sub-title">harmoni gallery</small>
                <h2 class="big-title">Beautiful & <strong>Unforgettable Times</strong></h2>
            </div>
            <!-- section-title - end -->

            <div class="button-group filters-button-group mb-30">
                <button class="button is-checked" data-filter="*">
                    <i class="fas fa-star"></i>
                    <strong>all</strong> gallery
                </button>
                <button class="button" data-filter=".video-gallery">
                    <i class="fas fa-play-circle"></i>
                    <strong>video</strong> gallery
                </button>
                <button class="button" data-filter=".photo-gallery">
                    <i class="far fa-image"></i>
                    <strong>photo</strong> gallery
                </button>
            </div>

            <div class="grid zoom-gallery clearfix mb-80" data-isotope="{ &quot;masonry&quot;: { &quot;columnWidth&quot;: 0 } }">
                <div class="grid-item grid-item--height2 photo-gallery " data-category="photo-gallery">
                    <a class="popup-link" href="${pageContext.request.contextPath}/assets/images/gallery/1.image.jpg">
                        <img src="${pageContext.request.contextPath}/assets/images/gallery/1.image.jpg" alt="Image_not_found">
                    </a>
                    <div class="item-content">
                        <h3>John Doe Wedding day</h3>
                        <span>Wedding Party, 24 June 2016</span>
                    </div>
                </div>
                <div class="grid-item grid-item--width2 video-gallery " data-category="video-gallery">
                    <a class="popup-youtube" href="https://youtu.be/-haiaZ011OM">
                        <img src="${pageContext.request.contextPath}/assets/images/gallery/2.image.jpg" alt="Image_not_found">
                    </a>
                    <div class="item-content">
                        <h3>Business Conference in Dubai</h3>
                        <span>Food Festival, 24 June 2016</span>
                    </div>
                </div>
                <div class="grid-item photo-gallery " data-category="photo-gallery">
                    <a class="popup-link" href="${pageContext.request.contextPath}/assets/images/gallery/3.image.jpg">
                        <img src="${pageContext.request.contextPath}/assets/images/gallery/3.image.jpg" alt="Image_not_found">
                    </a>
                    <div class="item-content">
                        <h3>Envato Author Fun Hiking</h3>
                        <span>Food Festival, 24 June 2016</span>
                    </div>
                </div>

                <div class="grid-item photo-gallery " data-category="photo-gallery">
                    <a class="popup-link" href="${pageContext.request.contextPath}/assets/images/gallery/4.image.jpg">
                        <img src="${pageContext.request.contextPath}/assets/images/gallery/4.image.jpg" alt="Image_not_found">
                    </a>
                    <div class="item-content">
                        <h3>John Doe Wedding day</h3>
                        <span>Wedding Party, 24 June 2016</span>
                    </div>
                </div>
                <div class="grid-item grid-item--width2 video-gallery " data-category="video-gallery">
                    <a class="popup-youtube" href="https://youtu.be/-haiaZ011OM">
                        <img src="${pageContext.request.contextPath}/assets/images/gallery/5.image.jpg" alt="Image_not_found">
                    </a>
                    <div class="item-content">
                        <h3>New Year Celebration</h3>
                        <span>Food Festival, 24 June 2016</span>
                    </div>
                </div>

                <div class="grid-item grid-item--width2 photo-gallery " data-category="photo-gallery">
                    <a class="popup-link" href="${pageContext.request.contextPath}/assets/images/gallery/6.image.jpg">
                        <img src="${pageContext.request.contextPath}/assets/images/gallery/6.image.jpg" alt="Image_not_found">
                    </a>
                    <div class="item-content">
                        <h3>John Doe Wedding day</h3>
                        <span>Wedding Party, 24 June 2016</span>
                    </div>
                </div>
                <div class="grid-item video-gallery " data-category="video-gallery">
                    <a class="popup-youtube" href="https://youtu.be/-haiaZ011OM">
                        <img src="${pageContext.request.contextPath}/assets/images/gallery/7.image.jpg" alt="Image_not_found">
                    </a>
                    <div class="item-content">
                        <h3>New Year Celebration</h3>
                        <span>Food Festival, 24 June 2016</span>
                    </div>
                </div>
                <div class="grid-item photo-gallery " data-category="photo-gallery">
                    <a class="popup-link" href="${pageContext.request.contextPath}/assets/images/gallery/8.image.jpg">
                        <img src="${pageContext.request.contextPath}/assets/images/gallery/8.image.jpg" alt="Image_not_found">
                    </a>
                    <div class="item-content">
                        <h3>Envato Author Fun Hiking</h3>
                        <span>Food Festival, 24 June 2016</span>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <a href="#!" class="custom-btn">view all gallery</a>
            </div>


        </section>
        <!-- event-gallery-section - end
        ================================================== -->





        <!-- event-expertise-section - start
        ================================================== -->
        <section id="event-expertise-section" class="event-expertise-section bg-gray-light sec-ptb-100 clearfix">
            <div class="container">

                <!-- section-title - start -->
                <div class="section-title text-center mb-50">
                    <small class="sub-title">our services</small>
                    <h2 class="big-title">harmony <strong>Expertise</strong></h2>
                </div>
                <!-- section-title - end -->

                <!-- event-expertise-carousel - start -->
                <div id="event-expertise-carousel" class="event-expertise-carousel owl-carousel owl-theme">

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img1.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">Wedding Party</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img2.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">birthday Party</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img3.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">business meeting</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img1.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">Wedding Party</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img2.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">birthday Party</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img3.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">business meeting</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img1.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">Wedding Party</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img2.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">birthday Party</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img3.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">business meeting</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img1.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">Wedding Party</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img2.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">birthday Party</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                    <!-- expertise-item - start -->
                    <div class="item">
                        <span class="expertise-title">harmoni party events</span>
                        <div class="expertise-item">
                            <div class="image image-wrapper">
                                <img src="${pageContext.request.contextPath}/assets/images/experties/img3.jpg" alt="Image_not_found">
                                <a href="#!" class="plus-effect"></a>
                            </div>
                            <div class="content">
                                <h3 class="title">business meeting</h3>
                                <p>Start from <strong>$1.200-$2.000</strong></p>
                            </div>
                        </div>
                    </div>
                    <!-- expertise-item - end -->

                </div>
                <!-- event-expertise-carousel - end -->

            </div>
        </section>
        <!-- event-expertise-section - end
        ================================================== -->





        <!-- speaker-section - start
        ================================================== -->
        
        <!-- speaker-section - end
        ================================================== -->





        <!-- advertisement-section - start
        ================================================== -->
        <section id="advertisement-section" class="advertisement-section clearfix" style="background-image: url('${pageContext.request.contextPath}/assets/images/special-offer-bg.png');">
            <div class="container">
                <div class="advertisement-content text-center">

                    <h2 class="title-large white-color">Are you ready to make <strong>your Own Special Events?</strong></h2>
                    <p class="mb-31">“Get started now, Harmoni event management PSD template.”</p>
                    <a href="#!" class="purchase-btn">purchase now!</a>

                </div>
            </div>
        </section>
        <!-- advertisement-section - end
        ================================================== -->





        <!-- partners-clients-section - start
        ================================================== -->
        <section id="partners-clients-section" class="partners-clients-section bg-gray-light sec-ptb-100 clearfix">
            <div class="container">

                <!-- section-title - start -->
                <div class="section-title text-center mb-50">
                    <small class="sub-title">we are harmoni</small>
                    <h2 class="big-title">We have <strong>Best Partners & Clients</strong></h2>
                    <p class="m-0 black-color">
                        Lorem ipsum dollor site amet the best  consectuer adipiscing elites sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat insignia the consectuer adipiscing elit. 
                    </p>
                </div>
                <!-- section-title - end -->

                <div class="row">

                    <!-- partners-wrapper - start -->
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <div class="partners-wrapper">
                            <span class="carousel-title">
                                harmoni <strong>sponsors</strong>
                            </span>
                            <div id="partners-carousel" class="partners-carousel owl-carousel owl-theme">

                                <div class="item">
                                    <ul>

                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>

                                    </ul>
                                </div>

                                <div class="item">
                                    <ul>

                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>

                                    </ul>
                                </div>

                                <div class="item">
                                    <ul>

                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#!">
                                                <img src="${pageContext.request.contextPath}/assets/images/partners/image1.png" alt="Image_not_found">
                                            </a>
                                        </li>

                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- partners-wrapper - end -->

                    <!-- clients-testimonial - start -->
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <div class="clients-testimonial" style="background-image: url('${pageContext.request.contextPath}/assets/images/1.testimonial-bg.jpg');">
                            <div class="overlay-black">

                                <div class="section-title text-center mb-50">
                                    <small class="sub-title">testimonial</small>
                                    <h2 class="big-title">client <strong>says</strong></h2>
                                </div>

                                <div id="clients-testimonial-carousel" class="clients-testimonial-carousel owl-carousel owl-theme">
                                    <div class="item text-center">
                                        <p class="mb-30">
                                            “Bring people together, or turn your passion into a business. Harmoni gives you everything you need to host your best event yet. lorem ipsum diamet adispiscing dispend.”
                                        </p>
                                        <div class="client-info">
                                            <h3 class="client-name">Jenni Hernandes</h3>
                                            <span class="client-sub-title">Graphic Designer</span>
                                        </div>
                                    </div>

                                    <div class="item text-center">
                                        <p class="mb-30">
                                            “Bring people together, or turn your passion into a business. Harmoni gives you everything you need to host your best event yet. lorem ipsum diamet adispiscing dispend.”
                                        </p>
                                        <div class="client-info">
                                            <h3 class="client-name">Jenni Hernandes</h3>
                                            <span class="client-sub-title">Graphic Designer</span>
                                        </div>
                                    </div>

                                    <div class="item text-center">
                                        <p class="mb-30">
                                            “Bring people together, or turn your passion into a business. Harmoni gives you everything you need to host your best event yet. lorem ipsum diamet adispiscing dispend.”
                                        </p>
                                        <div class="client-info">
                                            <h3 class="client-name">Jenni Hernandes</h3>
                                            <span class="client-sub-title">Graphic Designer</span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- clients-testimonial - end -->

                </div>

            </div>
        </section>
        <!-- partners-clients-section - end
        ================================================== -->





        <!-- news-update-section - start
        ================================================== -->
        
        <!-- news-update-section - end
        ================================================== -->





        <!-- google map - start
        ================================================== -->
        <jsp:include page="common/google map.jsp"></jsp:include>
        <!-- google map - end
        ================================================== -->





        <!-- footer-section2 - start
        ================================================== -->
        <footer id="footer-section" class="footer-section footer-section2 clearfix">

            <!-- footer-top - start -->
            <div class="footer-top sec-ptb-100 clearfix">
                <div class="container">
                    <div class="row">

                        <!-- about-wrapper - start -->
                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="about-wrapper">

                                <!-- site-logo-wrapper - start -->
                                <div class="site-logo-wrapper mb-30">
                                    <a href="home.jsp" class="logo">
                                        <img src="${pageContext.request.contextPath}/assets/images/1.site-logo.png" alt="logo_not_found">
                                    </a>
                                </div>
                                <!-- site-logo-wrapper - end -->

                                <p class="mb-30">
                                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna.
                                </p>

                                <!-- basic-info - start -->
                                <div class="basic-info ul-li-block mb-50">
                                    <ul>
                                        <li>
                                            <i class="fas fa-map-marker-alt"></i>
                                            100 highland ave, california, united state
                                        </li>
                                        <li>
                                            <i class="fas fa-envelope"></i>
                                            <a href="#!">contact@pantero.com</a>
                                        </li>
                                        <li>
                                            <i class="fas fa-phone"></i>
                                            <a href="#!">100 800 1234 5555</a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- basic-info - end -->

                                <!-- social-links - start -->
                                <div class="social-links ul-li">
                                    <h3 class="social-title">network</h3>
                                    <ul>
                                        <li>
                                            <a href="#!"><i class="fab fa-facebook-f"></i></a>
                                        </li>
                                        <li>
                                            <a href="#!"><i class="fab fa-twitter"></i></a>
                                        </li>
                                        <li>
                                            <a href="#!"><i class="fab fa-twitch"></i></a>
                                        </li>
                                        <li>
                                            <a href="#!"><i class="fab fa-google-plus-g"></i></a>
                                        </li>
                                        <li>
                                            <a href="#!"><i class="fab fa-instagram"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- social-links - end -->

                            </div>
                        </div>
                        <!-- about-wrapper - end -->

                        <!-- usefullinks-wrapper - start -->
                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="usefullinks-wrapper ul-li-block">
                                <h3 class="footer-item-title">
                                    useful <strong>links</strong>
                                </h3>
                                <ul>
                                    <li><a href="#!">About Harmoni</a></li>
                                    <li><a href="#!">Disclaimer</a></li>
                                    <li><a href="#!">Contact us</a></li>
                                    <li><a href="#!">Events Schedule</a></li>
                                    <li><a href="#!">Sponsors</a></li>
                                    <li><a href="#!">Venues</a></li>
                                    <li><a href="#!">Tickets</a></li>
                                    <li><a href="#!">Pricing Plans</a></li>
                                </ul>

                            </div>
                        </div>
                        <!-- usefullinks-wrapper - end -->

                        <!-- instagram-wrapper - start -->
                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="instagram-wrapper ul-li">
                                <h3 class="footer-item-title">
                                    harmoni <strong>instagram</strong>
                                </h3>
                                <ul>
                                    <li class="image-wrapper">
                                        <img src="${pageContext.request.contextPath}/assets/images/footer/instagram/img1.png" alt="Image_not_found">
                                        <a href="#!"><i class="fab fa-instagram"></i></a>
                                    </li>
                                    <li class="image-wrapper">
                                        <img src="${pageContext.request.contextPath}/assets/images/footer/instagram/img2.png" alt="Image_not_found">
                                        <a href="#!"><i class="fab fa-instagram"></i></a>
                                    </li>
                                    <li class="image-wrapper">
                                        <img src="${pageContext.request.contextPath}/assets/images/footer/instagram/img3.png" alt="Image_not_found">
                                        <a href="#!"><i class="fab fa-instagram"></i></a>
                                    </li>
                                    <li class="image-wrapper">
                                        <img src="${pageContext.request.contextPath}/assets/images/footer/instagram/img4.png" alt="Image_not_found">
                                        <a href="#!"><i class="fab fa-instagram"></i></a>
                                    </li>
                                    <li class="image-wrapper">
                                        <img src="${pageContext.request.contextPath}/assets/images/footer/instagram/img5.png" alt="Image_not_found">
                                        <a href="#!"><i class="fab fa-instagram"></i></a>
                                    </li>
                                    <li class="image-wrapper">
                                        <img src="${pageContext.request.contextPath}/assets/images/footer/instagram/img6.png" alt="Image_not_found">
                                        <a href="#!"><i class="fab fa-instagram"></i></a>
                                    </li>
                                </ul>
                                <h4 class="followus-link">
                                    Follow Our Instagram <a href="#!">#Harmoni</a>
                                </h4>
                            </div>
                        </div>
                        <!-- instagram-wrapper - end -->

                    </div>
                </div>
            </div>
            <!-- footer-top - end -->

            <div class="footer-bottom">
                <div class="container">
                    <div class="row">

                        <!-- copyright-text - start -->
                        <div class="col-lg-7 col-md-12 col-sm-12">
                            <div class="copyright-text">
                                <p class="m-0">©2018 <a href="#!" class="site-link">Harmoni.com</a> all right reserved, made with <i class="fas fa-heart"></i> by <a href="#!" class="author-link"><strong>jThemes Studio</strong></a></p>
                            </div>
                        </div>
                        <!-- copyright-text - end -->

                        <!-- footer-menu - start -->
                        <div class="col-lg-5 col-md-12 col-sm-12">
                            <div class="footer-menu">
                                <ul>
                                    <li><a href="contact.jsp">Contact us</a></li>
                                    <li><a href="about.jsp">About us</a></li>
                                    <li><a href="#!">Site map</a></li>
                                    <li><a href="#!">Privacy policy</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- footer-menu - end -->

                    </div>
                </div>
            </div>

        </footer>
        <!-- footer-section2 - end
        ================================================== -->










        <!-- fraimwork - jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.3.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

        <!-- carousel jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>

        <!-- map jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/gmap3.min.js"></script>
        <script src="http://maps.google.com/maps/api/js?key=AIzaSyC61_QVqt9LAhwFdlQmsNwi5aUJy9B2SyA"></script>

        <!-- calendar jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/atc.min.js"></script>

        <!-- others jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jarallax.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>

        <!-- gallery img loaded - jqury include -->
        <script src="${pageContext.request.contextPath}/assets/js/imagesloaded.pkgd.min.js"></script>

        <!-- multy count down - jqury include -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery.countdown.js"></script>

        <!-- color panal - jqury include -->
        <script src="${pageContext.request.contextPath}/assets/js/style-switcher.js"></script>

        <!-- custom jquery include -->
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>





    </body>

    <!-- Mirrored from jthemes.net/themes/html/harmony-event/home.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:03:32 GMT -->
</html>
