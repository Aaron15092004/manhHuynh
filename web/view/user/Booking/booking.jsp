<%-- 
    Document   : booking
    Created on : Feb 21, 2025, 12:13:54 AM
    Author     : Admin
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


    <!-- Mirrored from jthemes.net/themes/html/harmony-event/booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:04:09 GMT -->
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Harmoni - Booking Event</title>
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

        <style>
            .quantity-input {
                display: flex;
                align-items: center;
                max-width: 120px;
                margin: 0 auto;
            }

            .quantity-input input {
                width: 50px;
                text-align: center;
                border: 1px solid #ddd;
                border-radius: 0;
                padding: 5px;
                height: 36px;
            }

            .quantity-btn {
                width: 30px;
                height: 36px;
                border: 1px solid #ddd;
                background: #f8f9fa;
                color: #333;
                font-size: 16px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.3s;
            }

            .quantity-btn:hover {
                background: #ffc107;
                color: white;
            }

            .quantity-input .minus {
                border-radius: 4px 0 0 4px;
            }

            .quantity-input .plus {
                border-radius: 0 4px 4px 0;
            }

            .btn-remove {
                background: transparent;
                border: none;
                color: #dc3545;
                font-size: 18px;
                cursor: pointer;
                transition: all 0.3s;
            }

            .btn-remove:hover {
                color: #c82333;
                transform: scale(1.2);
            }

            .cart-empty {
                padding: 30px;
                text-align: center;
                border: 1px dashed #ddd;
                border-radius: 5px;
                margin-bottom: 30px;
            }

            .cart-empty i {
                font-size: 50px;
                color: #ddd;
                margin-bottom: 15px;
            }

            /* Styling cho booking timeout section */
            .booking-timeout-section {
                background-color: #f8f9fa;
                padding: 30px 0;
                border-bottom: 1px solid #eee;
            }

            .booking-timeout-section .leftside-wrapper {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .booking-timeout-section .icon-box {
                flex-shrink: 0;
                width: 60px;
                height: 60px;
                border-radius: 50%;
                background: #fff;
                border: 2px solid #ffc107;
                display: flex;
                align-items: center;
                justify-content: center;
                box-shadow: 0 3px 10px rgba(0,0,0,0.05);
            }

            .booking-timeout-section .icon-box i {
                font-size: 30px;
            }

            .booking-timeout-section .content-box h3 {
                font-size: 22px;
                margin-bottom: 8px;
            }

            .booking-timeout-section .content-box p {
                color: #666;
            }

            .booking-timeout-section .countdown-title {
                margin-bottom: 15px;
                font-size: 20px;
                color: #333;
                font-weight: 600;
            }

            .booking-timeout-section .countdown-list {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin: 0;
                padding: 0;
                list-style: none;
            }

            .booking-timeout-section .countdown-list li {
                margin: 0;
                padding: 0;
            }

            .booking-timeout-section .count-item {
                background: linear-gradient(145deg, #ffffff, #f5f5f5);
                border-radius: 10px;
                padding: 15px 10px;
                min-width: 80px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.05);
                border: 1px solid #eee;
                transition: all 0.3s ease;
            }

            .booking-timeout-section .count-item:hover {
                transform: translateY(-3px);
                box-shadow: 0 6px 18px rgba(0,0,0,0.08);
            }

            .booking-timeout-section .count-item span {
                display: block;
                font-size: 28px;
                color: #ffb400;
                font-weight: 700;
                line-height: 1;
                margin-bottom: 5px;
            }

            .booking-timeout-section .count-item small {
                display: block;
                font-size: 14px;
                color: #666;
                font-weight: 500;
                text-transform: uppercase;
            }

            @media (max-width: 768px) {
                .booking-timeout-section .leftside-wrapper {
                    margin-bottom: 30px;
                }

                .booking-timeout-section .count-item {
                    min-width: 65px;
                    padding: 10px 5px;
                }

                .booking-timeout-section .count-item span {
                    font-size: 22px;
                }

                .booking-timeout-section .count-item small {
                    font-size: 12px;
                }
            }
        </style>

    </head>

    <body class="default-header-p">

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
        <header id="header-section" class="header-section default-header-section auto-hide-header clearfix">

            <!-- header-top - start -->
            <jsp:include page="/view/common/homepage-common/header-top.jsp"></jsp:include>
                <!-- header-top - end -->

                <!-- header-bottom - start -->
            <jsp:include page="/view/common/homepage-common/header-bottom.jsp"></jsp:include>   
                <!-- header-bottom - end -->

            </header>
            <!-- header-section - end
            ================================================== -->





            <!-- altranative-header - start
            ================================================== -->
        <jsp:include page="/view/common/homepage-common/altranative-header.jsp"></jsp:include>
            <!-- altranative-header - end
            ================================================== -->





            <!-- breadcrumb-section - start
            ================================================== -->
            <section id="breadcrumb-section" class="breadcrumb-section clearfix">
                <div class="jarallax" style="background-image: url('${pageContext.request.contextPath}/assets/images/breadcrumb/0.breadcrumb-bg.jpg');">
                <div class="overlay-black">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-6 col-md-12 col-sm-12">

                                <!-- breadcrumb-title - start -->
                                <div class="breadcrumb-title text-center mb-50">
                                    <span class="sub-title">ticket booking</span>
                                    <h2 class="big-title">harmoni <strong>booking</strong></h2>
                                </div>
                                <!-- breadcrumb-title - end -->

                                <!-- breadcrumb-list - start -->
                                <div class="breadcrumb-list">
                                    <ul>
                                        <li class="breadcrumb-item"><a href="home" class="breadcrumb-link">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">booking</li>
                                    </ul>
                                </div>
                                <!-- breadcrumb-list - end -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb-section - end
        ================================================== -->





        <!-- booking-timeout-section - start
        ================================================== -->
        <section id="booking-timeout-section" class="booking-timeout-section clearfix">
            <div class="container">
                <div class="row">

                    <!-- leftside-wrapper - start -->
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <div class="leftside-wrapper">
                            <div class="icon-box">
                                <i class="fas fa-hourglass-half yellow-color"></i>
                            </div>
                            <div class="content-box">
                                <h3>Please complete registration <strong class="yellow-color">within 12:00 hours.</strong></h3>
                                <p class="m-0">After 12:00 hours, the reservation we're holding will be released to others.</p>
                            </div>
                        </div>
                    </div>
                    <!-- leftside-wrapper - end -->

                    <!-- rightside-wrapper - start -->
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <div class="rightside-wrapper text-center">
                            <div class="clock-wrapper">
                                <ul id="twelve-hour-countdown" class="countdown-list clearfix">
                                    <li>
                                        <div class="count-item">
                                            <span>00</span>
                                            <small>Day</small>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="count-item">
                                            <span>12</span>
                                            <small>Hours</small>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="count-item">
                                            <span>00</span>
                                            <small>Mins</small>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="count-item">
                                            <span>00</span>
                                            <small>Secs</small>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- rightside-wrapper - end -->

                </div>
            </div>
        </section>
        <!-- booking-timeout-section - end
        ================================================== -->





        <!-- booking-section - start
        ================================================== -->
        <section id="booking-section" class="booking-section bg-gray-light sec-ptb-100 clearfix">
            <div class="container">
                <div class="row">

                    <!-- booking-content-wrapper - start -->
                    <div class="col-lg-8 col-md-12 col-sm-12">
                        <div class="booking-content-wrapper">

                            <!-- order-summary - start -->
                            <div class="order-summary mb-50">
                                <!-- section-title - start -->
                                <div class="section-title mb-30">
                                    <h2 class="big-title">order <strong>summary</strong></h2>
                                </div>
                                <!-- section-title - end -->

                                <!-- Hiển thị thông báo lỗi hoặc thành công -->
                                <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger mb-4">
                                        <i class="fas fa-exclamation-circle"></i> ${errorMessage}
                                    </div>
                                </c:if>

                                <c:if test="${not empty paymentSuccessMessage}">
                                    <div class="alert alert-success mb-4">
                                        <i class="fas fa-check-circle"></i> ${paymentSuccessMessage}
                                    </div>
                                </c:if>

                                <c:choose>
                                    <c:when test="${empty cart.listRegistration}">
                                        <!-- Hiển thị khi giỏ hàng trống -->
                                        <div class="cart-empty">
                                            <i class="fas fa-shopping-cart"></i>
                                            <h3>Your cart is empty</h3>
                                            <p>You haven't added any tickets to your cart yet.</p>
                                            <a href="home" class="custom-btn mt-3">Browse Events</a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Hiển thị nội dung giỏ hàng -->
                                        <div class="order-summary-table table-responsive">
                                            <table class="table text-center">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Event</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Quantity</th>
                                                        <th scope="col">Total</th>
                                                        <th scope="col">Remove</th>
                                                    </tr>
                                                </thead>
                                                <!-- Tạo bean một lần ở đầu trang, ở ngoài vòng lặp -->
                                                <jsp:useBean id="eventDAOBean" class="dal.implement.EventDAO" scope="request" />
                                                <jsp:useBean id="ticketDAOBean" class="dal.implement.TicketDAO" scope="request" />

                                                <tbody>
                                                    <c:forEach items="${cart.listRegistration}" var="re">
                                                        <c:set var="eventInfo" value="${null}" />

                                                        <!-- Tìm thông tin sự kiện từ danh sách sự kiện -->
                                                        <c:forEach items="${listEvent}" var="event">
                                                            <c:if test="${event.event_id == re.event_id}">
                                                                <c:set var="eventInfo" value="${event}" />
                                                            </c:if>
                                                        </c:forEach>

                                                        <!-- Nếu không tìm thấy trong danh sách hiện tại, lấy từ database -->
                                                        <c:if test="${eventInfo == null}">
                                                            <c:set var="eventInfo" value="${eventDAOBean.getById(re.event_id)}" />
                                                        </c:if>

                                                        <!-- Tìm giá vé và số lượng vé còn lại từ listTicket -->
                                                        <c:set var="ticketPrice" value="0" />
                                                        <c:set var="availableQuantity" value="0" />
                                                        <c:forEach items="${listTicket}" var="ticket">
                                                            <c:if test="${ticket.event_id == re.event_id}">
                                                                <c:set var="ticketPrice" value="${ticket.price}" />
                                                                <c:set var="availableQuantity" value="${ticket.available_quantity}" />
                                                            </c:if>
                                                        </c:forEach>

                                                        <!-- Nếu không tìm thấy trong listTicket, lấy từ database -->
                                                        <c:if test="${ticketPrice == 0}">
                                                            <c:set var="ticketPrice" value="${ticketDAOBean.getTicketPriceByEventId(re.event_id)}" />
                                                            <c:set var="availableQuantity" value="${ticketDAOBean.getAvailableQuantityByEventId(re.event_id)}" />
                                                        </c:if>

                                                        <tr class="event-row" data-event-id="${re.event_id}" data-ticket-price="${ticketPrice}">
                                                            <th scope="row">${eventInfo.title}</th>
                                                            <td>$<fmt:formatNumber value="${ticketPrice}" pattern="#,##0.00"/></td>
                                                            <td>
                                                                <div class="quantity-input">
                                                                    <button type="button" class="quantity-btn minus" onclick="decreaseQuantity(${re.event_id}, ${availableQuantity})">-</button>
                                                                    <input type="number" id="quantity-${re.event_id}" value="${re.ticket_quantity}" min="1" max="${availableQuantity}" 
                                                                           onchange="updateQuantity(${re.event_id}, this.value, ${availableQuantity})">
                                                                    <button type="button" class="quantity-btn plus" onclick="increaseQuantity(${re.event_id}, ${availableQuantity})">+</button>

                                                                    <form id="update-form-${re.event_id}" action="payment?action=change-quantity" method="POST" style="display:none;">
                                                                        <input type="hidden" name="event_id" value="${re.event_id}"/>
                                                                        <input type="hidden" name="ticketQuantity" id="hidden-quantity-${re.event_id}" value="${re.ticket_quantity}">
                                                                    </form>
                                                                </div>
                                                            </td>
                                                            <td class="total">$<fmt:formatNumber value="${ticketPrice * re.ticket_quantity}" pattern="#,##0.00"/></td>
                                                            <td>
                                                                <form action="payment?action=delete" method="POST" style="display:inline;">
                                                                    <input type="hidden" name="event_id" value="${re.event_id}"/>
                                                                    <button type="submit" class="btn-remove" title="Remove from cart">
                                                                        <i class="fas fa-times"></i>
                                                                    </button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <tr class="tfooter">
                                                        <th colspan="3" class="text-right">Order Total:</th>
                                                        <td colspan="2" id="totalCart" class="font-weight-bold">$0.00</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <!-- Button section -->
                                        <div class="text-center my-4">
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <a href="home" class="custom-btn">
                                                        <i class="fas fa-arrow-left mr-2"></i> Continue Shopping
                                                    </a>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <form action="payment?action=pay-now" method="POST">
                                                        <button type="submit" class="custom-btn">
                                                            <i class="fas fa-credit-card mr-2"></i> Proceed to Checkout
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <!-- order-summary - end -->

                            <!-- billing-info - start -->
                            <c:if test="${not empty cart.listRegistration}">
                                <div class="billing-info mb-50">
                                    <!-- section-title - start -->
                                    <div class="section-title mb-30">
                                        <h2 class="big-title">billing <strong>information</strong></h2>
                                    </div>
                                    <!-- section-title - end -->

                                    <!-- billing-form - start -->
                                    <div class="billing-form form-wrapper">
                                        <div class="row">
                                            <!-- User Information Section -->
                                            <div class="col-lg-6 col-md-6 col-sm-12">
                                                <div class="form-item">
                                                    <span class="form-label">Full Name</span>
                                                    <input type="text" value="${user.full_name}" class="form-control" readonly>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12">
                                                <div class="form-item">
                                                    <span class="form-label">Email</span>
                                                    <input type="email" value="${user.email}" class="form-control" readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- billing-form - end -->
                                </div>
                            </c:if>
                            <!-- billing-info - end -->

                        </div>
                    </div>
                    <!-- booking-content-wrapper - end -->

                    <!-- sidebar-section - start -->
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="sidebar-section">
                            <!-- section-title - start -->
                            <div class="section-title mb-30">
                                <h2 class="big-title">ticket <strong>info</strong></h2>
                            </div>
                            <!-- section-title - end -->

                            <!-- location-wrapper - start -->
                            <div class="location-wrapper bg-white">
                                <c:choose>
                                    <c:when test="${empty cart.listRegistration}">
                                        <div class="p-4 text-center">
                                            <p>No tickets selected yet.</p>
                                            <p>Browse our events and add tickets to your cart.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${cart.listRegistration}" var="re" varStatus="status">
                                            <!-- Tìm sự kiện -->
                                            <c:set var="e" value="${null}" />

                                            <!-- Tìm từ danh sách sự kiện -->
                                            <c:forEach items="${listEvent}" var="event">
                                                <c:if test="${event.event_id == re.event_id}">
                                                    <c:set var="e" value="${event}" />
                                                </c:if>
                                            </c:forEach>

                                            <!-- Nếu không tìm thấy, lấy từ database -->
                                            <c:if test="${e == null}">
                                                <c:set var="e" value="${eventDAOBean.getById(re.event_id)}" />
                                            </c:if>

                                            <div class="title-wrapper ${status.index > 0 ? 'mt-4' : ''}">
                                                <small class="up-arrow-icon">
                                                    <i class="fas fa-chevron-circle-up"></i>
                                                </small>
                                                <span class="icon">
                                                    <i class="fas fa-calendar-alt"></i>
                                                </span>
                                                <div class="title-content">
                                                    <small>event details</small>
                                                    <h3>${e.title}</h3>
                                                </div>
                                            </div>

                                            <div class="location-info-list ul-li-block clearfix">
                                                <span class="area-name">${e.location}</span>
                                                <ul>
                                                    <li>
                                                        <i class="fas fa-calendar-day"></i> 
                                                        <fmt:formatDate value="${e.event_date}" pattern="EEEE, MMMM dd, yyyy"/>
                                                    </li>
                                                    <li>
                                                        <i class="fas fa-clock"></i> 
                                                        <fmt:formatDate value="${e.event_date}" pattern="hh:mm a"/>
                                                    </li>
                                                    <li>
                                                        <i class="fas fa-map-marker-alt"></i> ${e.location}
                                                    </li>
                                                    <li>
                                                        <i class="fas fa-ticket-alt"></i> 
                                                        <!-- Tìm vé từ listTicket -->
                                                        <c:set var="ticketAvailable" value="0" />
                                                        <c:forEach items="${listTicket}" var="ticket">
                                                            <c:if test="${ticket.event_id == e.event_id}">
                                                                <c:set var="ticketAvailable" value="${ticket.available_quantity}" />
                                                            </c:if>
                                                        </c:forEach>

                                                        <!-- Nếu không tìm thấy, lấy từ database -->
                                                        <c:if test="${ticketAvailable == 0}">
                                                            <c:set var="ticketAvailable" value="${ticketDAOBean.getAvailableQuantityByEventId(e.event_id)}" />
                                                        </c:if>

                                                        <strong>${ticketAvailable}</strong> tickets available
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!-- location-wrapper - end -->
                        </div>
                    </div>
                    <!-- sidebar-section - end -->

                </div>
            </div>
        </section>
        <!-- booking-section - end
        ================================================== -->





        <!-- default-footer-section - start
        ================================================== -->
        <jsp:include page="/view/common/homepage-common/default-footer-section.jsp"></jsp:include>
            <!-- default-footer-section - end
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

        <script>
                                                                        // Chạy khi document đã sẵn sàng
                                                                        $(document).ready(function () {
                                                                            // Khởi tạo đồng hồ đếm ngược 12 giờ
                                                                            initTwelveHourCountdown();

                                                                            // Cập nhật tổng tiền giỏ hàng
                                                                            updateTotal();
                                                                        });

                                                                        // Khởi tạo đồng hồ đếm ngược 12 giờ
                                                                        function initTwelveHourCountdown() {
                                                                            // Tạo ngày mục tiêu (12 giờ từ bây giờ)
                                                                            var now = new Date();
                                                                            var targetDate = new Date(now.getTime() + 12 * 60 * 60 * 1000);

                                                                            // Định dạng đúng cho countdown plugin
                                                                            var countdownDate =
                                                                                    targetDate.getFullYear() + '/' +
                                                                                    (targetDate.getMonth() + 1) + '/' +
                                                                                    targetDate.getDate() + ' ' +
                                                                                    targetDate.getHours() + ':' +
                                                                                    targetDate.getMinutes() + ':' +
                                                                                    targetDate.getSeconds();

                                                                            // Khởi tạo countdown
                                                                            $('#twelve-hour-countdown').countdown(countdownDate, function (event) {
                                                                                $(this).html(event.strftime(
                                                                                        '<li><span>%D</span> <small>Day</small></li>' +
                                                                                        '<li><span>%H</span> <small>Hours</small></li>' +
                                                                                        '<li><span>%M</span> <small>Mins</small></li>' +
                                                                                        '<li><span>%S</span> <small>Secs</small></li>'
                                                                                        ));
                                                                            });
                                                                        }

                                                                        // Tăng số lượng vé
                                                                        function increaseQuantity(eventId, maxQuantity) {
                                                                            const input = document.getElementById('quantity-' + eventId);
                                                                            const currentQuantity = parseInt(input.value) || 1;

                                                                            if (currentQuantity < maxQuantity) {
                                                                                input.value = currentQuantity + 1;
                                                                                updateCartItem(eventId, currentQuantity + 1);
                                                                            }
                                                                        }

                                                                        // Giảm số lượng vé
                                                                        function decreaseQuantity(eventId) {
                                                                            const input = document.getElementById('quantity-' + eventId);
                                                                            const currentQuantity = parseInt(input.value) || 1;

                                                                            if (currentQuantity > 1) {
                                                                                input.value = currentQuantity - 1;
                                                                                updateCartItem(eventId, currentQuantity - 1);
                                                                            }
                                                                        }

                                                                        // Cập nhật số lượng từ input
                                                                        function updateQuantity(eventId, quantity, maxQuantity) {
                                                                            let newQuantity = parseInt(quantity) || 1;

                                                                            // Đảm bảo số lượng không nhỏ hơn 1
                                                                            if (newQuantity < 1) {
                                                                                newQuantity = 1;
                                                                            }

                                                                            // Đảm bảo số lượng không lớn hơn số lượng có sẵn
                                                                            if (newQuantity > maxQuantity) {
                                                                                newQuantity = maxQuantity;
                                                                                alert('Maximum available tickets: ' + maxQuantity);
                                                                            }

                                                                            document.getElementById('quantity-' + eventId).value = newQuantity;
                                                                            updateCartItem(eventId, newQuantity);
                                                                        }

                                                                        // Gửi form cập nhật giỏ hàng
                                                                        function updateCartItem(eventId, quantity) {
                                                                            document.getElementById('hidden-quantity-' + eventId).value = quantity;
                                                                            document.getElementById('update-form-' + eventId).submit();
                                                                        }

                                                                        // Cập nhật tổng giá tiền
                                                                        function updateTotal() {
                                                                            let totalCart = 0;
                                                                            const eventRows = document.querySelectorAll('.event-row');

                                                                            eventRows.forEach(row => {
                                                                                const eventId = row.getAttribute('data-event-id');
                                                                                const ticketPrice = parseFloat(row.getAttribute('data-ticket-price')) || 0;
                                                                                const quantity = parseInt(document.getElementById('quantity-' + eventId)?.value) || 0;

                                                                                const rowTotal = ticketPrice * quantity;
                                                                                totalCart += rowTotal;

                                                                                // Cập nhật giá cho hàng
                                                                                const totalCell = row.querySelector('.total');
                                                                                if (totalCell) {
                                                                                    totalCell.textContent = '$' + rowTotal.toFixed(2);
                                                                                }
                                                                            });

                                                                            // Cập nhật tổng giỏ hàng
                                                                            const totalCartElement = document.getElementById('totalCart');
                                                                            if (totalCartElement) {
                                                                                totalCartElement.textContent = '$' + totalCart.toFixed(2);
                                                                            }
                                                                        }
        </script>
    </body>



    <!-- Mirrored from jthemes.net/themes/html/harmony-event/booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:04:09 GMT -->
</html>
