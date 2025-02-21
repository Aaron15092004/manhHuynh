<%-- 
    Document   : altranative-header
    Created on : Feb 21, 2025, 2:07:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="header-altranative">
    <div class="container">
        <div class="logo-area float-left">
            <a href="home.jsp">
                <img src="${pageContext.request.contextPath}/assets/images/1.site-logo.png" alt="logo_not_found">
            </a>
        </div>

        <button type="button" id="sidebarCollapse" class="alt-menu-btn float-right">
            <i class="fas fa-bars"></i>
        </button>
    </div>

    <!-- sidebar menu - start -->
    <div class="sidebar-menu-wrapper">
        <div id="sidebar" class="sidebar">
            <span id="sidebar-dismiss" class="sidebar-dismiss">
                <i class="fas fa-arrow-left"></i>
            </span>

            <div class="sidebar-header">
                <a href="#!">
                    <img src="${pageContext.request.contextPath}/assets/images/2.site-logo.png" alt="logo_not_found">
                </a>
            </div>

            <!-- sidebar-form - start -->
            <div class="sidebar-form">
                <form action="#">
                    <input id="altmenu-sidebar-search" type="search" placeholder="Search">
                    <label for="altmenu-sidebar-search"><i class="fas fa-search"></i></label>
                </form>
            </div>
            <!-- sidebar-form - end -->

            <!-- main-pages-links - start -->
            <div class="menu-link-list main-pages-links">
                <h2 class="menu-title">home page</h2>
                <ul>
                    <li class="active">
                        <a href="home.jsp">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            Home
                        </a>
                    </li>
                </ul>
            </div>
            <!-- main-pages-links - end -->

            <!-- other-pages-links - start -->
            <div class="menu-link-list other-pages-links">
                <h2 class="menu-title">all single pages</h2>
                <ul>
                    <li>
                        <a href="about.jsp">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            About Us
                        </a>
                    </li>
                    <li>
                        <a href="service.jsp">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            our Services
                        </a>
                    </li>
                    <li>
                        <a href="list-event.jsp">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            event list
                        </a>
                    </li>
                    <li>
                        <a href="gallery.jsp">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            our gallery
                        </a>
                    </li>
                    <li>
                        <a href="contact.jsp">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            contact us
                        </a>
                    </li>
                </ul>
            </div>
            <!-- other-pages-links - end -->

            <!-- inner-pages-links - start -->
            <div class="menu-link-list inner-pages-links">
                <h2 class="menu-title">all inner pages</h2>
                <ul>
                    <li>
                        <a href="booking.jsp">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            event booking
                        </a>
                    </li>
                    <li>
                        <a href="event-details.jsp">
                            <span class="icon"><i class="fas fa-home"></i></span>
                            event details
                        </a>
                    </li>
                    <!--                            <li>
                                                    <a href='blog-details.jsp'>
                                                        <span class="icon"><i class="fas fa-home"></i></span>
                                                        blog details
                                                    </a>
                                                </li>-->
                    <!--                            <li>
                                                    <a href="faq.jsp">
                                                        <span class="icon"><i class="fas fa-home"></i></span>
                                                        Frequently Ask Qusetion
                                                    </a>
                                                </li>-->
                    <!--                            <li>
                                                    <a href="404-error.jsp">
                                                        <span class="icon"><i class="fas fa-home"></i></span>
                                                        404 error
                                                    </a>
                                                </li>-->
                </ul>
            </div>
            <!-- inner-pages-links - end -->

            <!-- login-btn-group - start -->
            <div class="login-btn-group">
                <ul>

                    <li>
                        <a href="#alt-register-modal" class="register-modal-btn">
                            Register
                        </a>
                        <div id="alt-register-modal" class="reglog-modal-wrapper register-modal mfp-hide clearfix" style="background-image: url('${pageContext.request.contextPath}/assets/images/login-modal-bg.jpg');">
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
                                            <li><a href="#!">Login</a></li>
                                            <li class="active"><a href="#!">Register</a></li>
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
                                        <h2 class="form-title title-large white-color">Account <strong>Register</strong></h2>
                                        <span class="form-subtitle white-color">Have an account? <strong>LOGIN NOW</strong></span>
                                    </div>

                                    <div class="login-form text-center mb-50">
                                        <form action="#!">
                                            <div class="form-item">
                                                <input type="email" placeholder="User Name">
                                            </div>
                                            <div class="form-item">
                                                <input type="password" placeholder="Password">
                                            </div>
                                            <div class="form-item">
                                                <input type="email" placeholder="Repeat Password">
                                            </div>
                                            <div class="form-item">
                                                <input type="password" placeholder="Email Address">
                                            </div>
                                            <div class="human-verification text-left">
                                                <input type="checkbox" id="alt-imnotarobot">
                                                <label for="alt-imnotarobot">I'm not a robot</label>
                                                <span class="verification-image">
                                                    <img src="${pageContext.request.contextPath}/assets/images/iamnotrobot.png" alt="Image_not_found">
                                                </span>
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
                        <a href="#alt-login-modal" class="login-modal-btn">
                            Login
                        </a>
                        <div id="alt-login-modal" class="reglog-modal-wrapper mfp-hide clearfix" style="background-image: url('${pageContext.request.contextPath}/assets/images/login-modal-bg.jpg');">
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
                                        <p class="m-0">©2018 <a href="#!" class="yellow-color">Harmoni.com</a> all right reserved, made with <i class="fas fa-heart"></i> by jThemes Studio </p>
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

                </ul>
            </div>
            <!-- login-btn-group - end -->

            <!-- social-links - start -->
            <div class="social-links">
                <h2 class="menu-title">get in touch</h2>
                <div class="mb-15">
                    <h3 class="contact-info">
                        <i class="fas fa-phone"></i>
                        100-2222-9999
                    </h3>
                    <h3 class="contact-info">
                        <i class="fas fa-envelope"></i>
                        info@harmoni.com
                    </h3>
                </div>
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
                <a href="contact.jsp" class="contact-btn">contact us</a>
            </div>
            <!-- social-links - end -->

            <div class="overlay"></div>
        </div>
    </div>
    <!-- sidebar menu - end -->
</div>
