<%-- 
    Document   : event-details
    Created on : Feb 21, 2025, 12:15:34 AM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!-- Mirrored from jthemes.net/themes/html/harmony-event/event-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:04:06 GMT -->
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Harmoni - ${eventDetails.title}</title>
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
            .ticket-quantity-selector {
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .ticket-quantity-selector label {
                font-size: 16px;
                font-weight: bold;
                color: #333;
            }

            .quantity-control {
                display: flex;
                align-items: center;
                height: 40px;
                border-radius: 20px;
                overflow: hidden;
                border: 1px solid #e6e6e6;
                background: #f9f9f9;
                box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            }

            .quantity-control input {
                width: 50px;
                height: 100%;
                padding: 0;
                margin: 0;
                text-align: center;
                border: none;
                background: transparent;
                font-size: 16px;
                font-weight: 500;
                color: #333;
                -webkit-appearance: none;
                -moz-appearance: textfield;
            }

            .quantity-control input::-webkit-outer-spin-button,
            .quantity-control input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            .qty-btn {
                width: 40px;
                height: 100%;
                padding: 0;
                margin: 0;
                border: none;
                background: linear-gradient(to right, #FFA500, #FFD700);
                color: white;
                font-size: 18px;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .qty-btn:hover {
                background: linear-gradient(to right, #FF8C00, #FFC000);
            }

            .qty-btn.minus {
                border-radius: 20px 0 0 20px;
            }

            .qty-btn.plus {
                border-radius: 0 20px 20px 0;
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
            <jsp:include page="../common/homepage-common/header-top.jsp"></jsp:include>
                <!-- header-top - end -->

                <!-- header-bottom - start -->
            <jsp:include page="../common/homepage-common/header-bottom.jsp"></jsp:include>   
                <!-- header-bottom - end -->

            </header>
            <!-- header-section - end
            ================================================== -->





            <!-- altranative-header - start
            ================================================== -->
        <jsp:include page="../common/homepage-common/altranative-header.jsp"></jsp:include>
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
                                    <span class="sub-title">event single</span>
                                    <h2 class="big-title">harmoni <strong>event details</strong></h2>
                                </div>
                                <!-- breadcrumb-title - end -->

                                <!-- breadcrumb-list - start -->
                                <div class="breadcrumb-list">
                                    <ul>
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/homeIndex" class="breadcrumb-link">Home</a></li>
                                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home" class="breadcrumb-link">Events</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">${eventDetails.title}</li>
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





        <!-- event-details-section - start
        ================================================== -->
        <section id="event-details-section" class="event-details-section sec-ptb-100 clearfix">
            <div class="container">
                <div class="row">

                    <!-- col - event-details - start -->
                    <div class="col-lg-8 col-md-12 col-sm-12">

                        <!-- event-details - start -->
                        <div class="event-details mb-80">

                            <div class="event-title mb-30">
                                <span class="tag-item">
                                    <i class="fas fa-bookmark"></i>
                                    Event
                                </span>
                                <h2 class="event-title"><strong>${eventDetails.title}</strong></h2>
                            </div>

                            <div id="event-details-carousel" class="event-details-carousel owl-carousel owl-theme">
                                <img src="${pageContext.request.contextPath}${eventDetails.image}" alt="alt" />
                            </div>

                            <div class="event-info-list ul-li clearfix mb-50">
                                <ul>
                                    <li>
                                        <span class="icon">
                                            <i class="far fa-calendar"></i>
                                        </span>
                                        <div class="event-content">
                                            <small class="event-title">Available Tickets</small>
                                            <c:set var="availableTickets" value="0" />
                                            <c:forEach items="${listTicket}" var="ticket">
                                                <c:if test="${ticket.event_id == eventDetails.event_id}">
                                                    <c:set var="availableTickets" value="${ticket.available_quantity}" />
                                                    <c:set var="ticketPrice" value="${ticket.price}" />
                                                </c:if>
                                            </c:forEach>
                                            <h3 class="event-date">${availableTickets} tickets</h3>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="icon">
                                            <i class="far fa-clock"></i>
                                        </span>
                                        <div class="event-content">
                                            <small class="event-title">Event Date</small>
                                            <h3 class="event-date">
                                                <fmt:formatDate value="${eventDetails.event_date}" pattern="EEEE, MMMM dd, yyyy" />
                                            </h3>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="icon">
                                            <i class="fas fa-map-marker-alt"></i>
                                        </span>
                                        <div class="event-content">
                                            <small class="event-title">Event Location</small>
                                            <h3 class="event-date">${eventDetails.location}</h3>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <p class="black-color mb-30">
                                ${eventDetails.description}
                            </p>



                        </div>
                        <!-- event-details - end -->

                        <!-- register-wrapper - start -->
                        <div class="register-wrapper mb-80 clearfix">

                            <div class="section-title text-left mb-50">
                                <span class="line-style"></span>
                                <h2 class="big-title">register <strong>now</strong></h2>
                            </div>
                            <form action="payment?action=add-event" method="POST">
                                <div class="register-table">
                                    <ul>
                                        <li class="rt-header">
                                            <div class="header-leftside-content"><strong>Select</strong> the number of <strong>tickets</strong> you want to Order now!!!</div>
                                        </li>
                                        <li class="rt-body">
                                            <div class="rt-body-item">
                                                <div class="leftside-content">
                                                    <h3 class="ticket-title">${eventDetails.title}</h3>
                                                    <span class="ticket-price">$${ticketPrice}</span>
                                                </div>
                                                <div class="rightside-content">
                                                    <div class="ticket-quantity-selector">
                                                        <label for="ticket-input">TICKET:</label>
                                                        <div class="quantity-control">
                                                            <button type="button" class="qty-btn minus" onclick="decreaseQuantity()">-</button>
                                                            <input type="number" id="ticket-input" name="ticketQuantity" min="1" max="${availableTickets}" value="1" 
                                                                   oninput="validateTicketQuantity(this)" onchange="updateTotalPrice()">
                                                            <button type="button" class="qty-btn plus" onclick="increaseQuantity()">+</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </li>
                                        <li class="rt-footer">
                                            <div class="footer-leftside-content">
                                                <span class="payment-card">
                                                    <img src="${pageContext.request.contextPath}/assets/images/payment-cards.png" alt="payment_cards_not_found">
                                                </span>
                                                <span class="total-price" id="total-price">TOTAL PRICE: $${ticketPrice}</span>
                                            </div>

                                            <div class="footer-rightside-content">
                                                <input type="hidden" name="event_id" value="${eventDetails.event_id}" />
                                                <c:choose>
                                                    <c:when test="${availableTickets > 0}">
                                                        <a href="#" class="custom-btn" onclick="return this.closest('form').submit();">order now</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="custom-btn" style="background-color: #ccc; cursor: not-allowed;">Sold Out</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                        <!-- register-wrapper - end -->

                    </div>
                    <!-- col - event-details - end -->

                    <!-- sidebar-section - start -->
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="sidebar-section">

                            <!-- Add to Calendar - start -->
                            <div title="Add to Calendar" class="addeventatc">
                                Add to Calendar
                                <fmt:formatDate value="${eventDetails.event_date}" pattern="MM/dd/yyyy" var="eventDateFormatted" />
                                <fmt:formatDate value="${eventDetails.event_date}" pattern="HH:mm" var="eventTimeFormatted" />
                                <span class="start">${eventDateFormatted} ${eventTimeFormatted}</span>
                                <span class="end">${eventDateFormatted} ${eventTimeFormatted}</span>
                                <span class="timezone">Europe/Paris</span>
                                <span class="title">${eventDetails.title}</span>
                                <span class="description">${eventDetails.description}</span>
                                <span class="location">${eventDetails.location}</span>
                                <span class="organizer">Harmoni Events</span>
                                <span class="organizer_email">contact@harmoni.com</span>
                                <span class="all_day_event">false</span>
                                <span class="date_format">MM/DD/YYYY</span>
                            </div>
                            <!-- Add to Calendar - end -->

                            <!-- map-wrapper - start -->
                            <div class="map-wrapper mb-30">

                                <!-- section-title - start -->
                                <div class="section-title mb-30">
                                    <h2 class="big-title">event <strong>location</strong></h2>
                                </div>
                                <!-- section-title - end -->

                                <div id="google-map">
                                    <div id="googleMaps" class="google-map-container"></div>
                                </div>

                            </div>
                            <!-- map-wrapper - end -->

                            <div class="location-wrapper mb-30">
                                <div class="title-wrapper">
                                    <small class="up-arrow-icon">
                                        <i class="fas fa-chevron-circle-up"></i>
                                    </small>
                                    <span class="icon">
                                        <i class="fas fa-map-marker-alt"></i>
                                    </span>
                                    <div class="title-content">
                                        <small>event location</small>
                                        <h3>${eventDetails.location}</h3>
                                    </div>
                                </div>
                                <div class="location-info-list ul-li-block clearfix">
                                    <span class="area-name">${eventDetails.location}</span>
                                    <ul>
                                        <li><i class="fas fa-arrow-circle-right"></i> ${eventDetails.location}</li>
                                        <li><i class="fas fa-arrow-circle-right"></i> <fmt:formatDate value="${eventDetails.event_date}" pattern="EEEE, MMMM dd, yyyy" /></li>
                                        <li><i class="fas fa-arrow-circle-right"></i> From <strong><fmt:formatDate value="${eventDetails.event_date}" pattern="hh:mm a" /></strong></li>
                                    </ul>
                                </div>
                                <div class="button">
                                    <a href="#!" class="custom-btn">ADD TO MY CALENDAR</a>
                                </div>
                                <div class="title-wrapper">
                                    <small class="up-arrow-icon">
                                        <i class="fas fa-chevron-circle-up"></i>
                                    </small>
                                    <span class="icon">
                                        <i class="fas fa-link"></i>
                                    </span>
                                    <div class="title-content">
                                        <small>contact information</small>
                                        <h3>harmoni staff</h3>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <!-- sidebar-section - end -->

                </div>
            </div>
        </section>
        <!-- event-details-section - end
        ================================================== -->





        <!-- default-footer-section - start
        ================================================== -->
        <jsp:include page="../common/homepage-common/default-footer-section.jsp"></jsp:include>
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
                                                            // Giới hạn giá trị nhập vào không vượt quá max
                                                            function validateTicketQuantity(input) {
                                                                // Lấy giá trị min và max
                                                                var min = parseInt(input.min) || 1;
                                                                var max = parseInt(input.max) || ${availableTickets};

                                                                // Lấy giá trị người dùng nhập
                                                                var value = parseInt(input.value) || 0;

                                                                // Đảm bảo giá trị không nhỏ hơn min
                                                                if (value < min) {
                                                                    input.value = min;
                                                                }

                                                                // Đảm bảo giá trị không lớn hơn max
                                                                if (value > max) {
                                                                    input.value = max;
                                                                    // Thêm hiệu ứng để thông báo cho người dùng
                                                                    input.style.borderColor = '#FF0000';
                                                                    setTimeout(function () {
                                                                        input.style.borderColor = 'transparent';
                                                                    }, 500);
                                                                }

                                                                // Cập nhật tổng giá tiền
                                                                updateTotalPrice();
                                                            }

                                                            // Hàm tính và cập nhật tổng tiền
                                                            function updateTotalPrice() {
                                                                const ticketQuantity = document.getElementById('ticket-input').value;
                                                                const ticketPrice = ${ticketPrice};
                                                                const totalPrice = ticketQuantity * ticketPrice;
                                                                document.getElementById('total-price').textContent = 'TOTAL PRICE: $' + totalPrice.toFixed(2);
                                                            }

                                                            // Gọi lần đầu khi tải trang
                                                            window.onload = updateTotalPrice;

                                                            // Tăng số lượng vé
                                                            function increaseQuantity() {
                                                                const input = document.getElementById('ticket-input');
                                                                const max = parseInt(input.max) || ${availableTickets};
                                                                let value = parseInt(input.value) || 0;

                                                                if (value < max) {
                                                                    input.value = value + 1;
                                                                } else {
                                                                    input.value = max;
                                                                    // Hiệu ứng khi đạt giới hạn
                                                                    input.classList.add('max-limit');
                                                                    setTimeout(() => {
                                                                        input.classList.remove('max-limit');
                                                                    }, 500);
                                                                }

                                                                updateTotalPrice();
                                                            }

// Giảm số lượng vé
                                                            function decreaseQuantity() {
                                                                const input = document.getElementById('ticket-input');
                                                                const min = parseInt(input.min) || 1;
                                                                let value = parseInt(input.value) || 0;

                                                                if (value > min) {
                                                                    input.value = value - 1;
                                                                } else {
                                                                    input.value = min;
                                                                }

                                                                updateTotalPrice();
                                                            }

// Xác thực số lượng khi nhập trực tiếp
                                                            function validateTicketQuantity(input) {
                                                                const min = parseInt(input.min) || 1;
                                                                const max = parseInt(input.max) || ${availableTickets};
                                                                let value = parseInt(input.value) || 0;

                                                                if (value < min) {
                                                                    input.value = min;
                                                                }

                                                                if (value > max) {
                                                                    input.value = max;
                                                                    // Hiệu ứng thông báo
                                                                    input.classList.add('max-limit');
                                                                    setTimeout(() => {
                                                                        input.classList.remove('max-limit');
                                                                    }, 500);
                                                                }

                                                                updateTotalPrice();
                                                            }

// Thêm một chút CSS động
                                                            document.head.insertAdjacentHTML('beforeend', `
    <style>
    .max-limit {
        animation: shake 0.5s;
        background-color: rgba(255, 0, 0, 0.1);
    }
    
    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        25% { transform: translateX(-5px); }
        75% { transform: translateX(5px); }
    }
    </style>
`);
        </script>


    </body>

    <!-- Mirrored from jthemes.net/themes/html/harmony-event/event-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 19 Feb 2025 16:04:09 GMT -->
</html>