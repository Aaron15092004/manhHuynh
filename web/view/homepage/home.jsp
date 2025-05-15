<%-- 
    Document   : home
    Created on : Feb 20, 2025, 5:02:55 PM
    Author     : Admin
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <!-- Mirrored from jthemes.net/themes/html/harmony-event/home.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:02:54 GMT -->
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Harmoni - Home</title>
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
        <jsp:include page="../common/homepage-common/header-section.jsp"></jsp:include>
            <!-- header-section - end
            ================================================== -->





            <!-- altranative-header - start
            ================================================== -->
        <jsp:include page="../common/homepage-common/altranative-header.jsp"></jsp:include>
            <!-- altranative-header - end
            ================================================== -->





            <!-- slide-section - start
            ================================================== -->
        <jsp:include page="../common/homepage-common/slide-section.jsp"></jsp:include>
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
                    <c:forEach items="${listEvent}" var="e">
                        <!-- item - start -->
                        <div class="item">
                            <div class="event-item">

                                <div class="countdown-timer">
                                    <ul class="countdown-list" data-countdown="<fmt:formatDate value="${e.event_date}" pattern="yyyy/MM/dd" />"></ul>
                                </div>

                                <div class="event-image">
                                    <img src="${pageContext.request.contextPath}${e.image}" alt="alt" />                                    
                                    <div class="post-date">
                                        <fmt:formatDate value="${e.event_date}" pattern="dd" var="eventDay" />
                                        <fmt:formatDate value="${e.event_date}" pattern="MMM" var="eventMonth" />
                                        <span class="date">${eventDay}</span>
                                        <small class="month">${eventMonth}</small>
                                    </div>
                                </div>

                                <div class="event-content">
                                    <div class="event-title mb-30">
                                        <h3 class="title">
                                            ${e.title}
                                        </h3>
                                        <c:set var="ticketPrice" value="0" />

                                        <c:forEach items="${listTicket}" var="ticket">
                                            <c:if test="${ticket.event_id == e.event_id}">
                                                <c:set var="ticketPrice" value="${ticket.price}" />
                                            </c:if>
                                        </c:forEach>

                                        <span class="ticket-price yellow-color">
                                            Tickets from $<fmt:formatNumber value="${ticketPrice}" pattern="#,##0.00"/>
                                        </span>                                    </div>
                                    <div class="event-post-meta ul-li-block mb-30">
                                        <ul>
                                            <li>
                                                <span class="icon">
                                                    <i class="far fa-clock"></i>
                                                </span>
                                                Start at:<fmt:formatDate value="${e.event_date}" pattern="HH:mm" /> 
                                            </li>
                                            <li>
                                                <span class="icon">
                                                    <i class="fas fa-map-marker-alt"></i>
                                                </span>
                                                ${e.location}
                                            </li>
                                        </ul>
                                    </div>
                                    <a href="event-details?id=${e.event_id}" class="custom-btn" >
                                        tickets & details
                                    </a>
                                </div>

                            </div>
                        </div>
                        <!-- item - end -->
                    </c:forEach>
                </div>
                <!-- upcomming-event-carousel - end -->

            </div>
        </section>
        <!-- upcomming-event-section - end
        ================================================== -->





        <!-- about-section - start
        ================================================== -->
        <jsp:include page="../common/homepage-common/about-section.jsp"></jsp:include>
            <!-- about-section - end
            ================================================== -->





            <!-- conference-section - start
            ================================================== -->
        <jsp:include page="../common/homepage-common/conference-section.jsp"></jsp:include>
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
        <jsp:include page="../common/homepage-common/event-expertise-section.jsp"></jsp:include>
            <!-- event-expertise-section - end
            ================================================== -->


            <!-- advertisement-section - start
            ================================================== -->
            <section id="advertisement-section" class="advertisement-section clearfix" style="background-image: url('${pageContext.request.contextPath}/assets/images/special-offer-bg.png');">
            <div class="container">
                <div class="advertisement-content text-center">

                    <h2 class="title-large white-color">Are you ready to make <strong>your Own Special Events?</strong></h2>
                    <p class="mb-31">“Get started now, Harmoni event management PSD template.”</p>
                    <a href="home" class="purchase-btn">purchase now!</a>

                </div>
            </div>
        </section>
        <!-- advertisement-section - end
        ================================================== -->

        <!-- partners-clients-section - start
        ================================================== -->
        <jsp:include page="../common/homepage-common/partners-clients-section.jsp"></jsp:include>
            <!-- partners-clients-section - end
            ================================================== -->

            <!-- google map - start
            ================================================== -->
        <jsp:include page="../common/homepage-common/google map.jsp"></jsp:include>
            <!-- google map - end
            ================================================== -->

            <!-- footer-section2 - start
            ================================================== -->
        <jsp:include page="../common/homepage-common/footer-section2.jsp"></jsp:include>
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