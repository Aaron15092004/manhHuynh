<%-- 
    Document   : header-section
    Created on : Mar 16, 2025, 2:37:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header-section" class="header-section sticky-header-section not-stuck clearfix">
    <!-- header-bottom - start -->
    <div class="header-bottom">
        <div class="container">
            <div class="row">

                <!-- site-logo-wrapper - start -->
                <div class="col-lg-3">
                    <div class="site-logo-wrapper">
                        <a href="${pageContext.request.contextPath}/homeIndex" class="logo">
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
                                            <a href="${pageContext.request.contextPath}/homeIndex" class="active">home</a>
                                        </li>
                                        <li class="menu-item-has-children">
                                            <a href="${pageContext.request.contextPath}/about">about</a>
                                            <ul class="sub-menu">
                                                <li><a href="${pageContext.request.contextPath}/about">about us</a></li>
                                                <li><a href='${pageContext.request.contextPath}/service'>service</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children">
                                            <a href="#!">events</a>
                                            <ul class="sub-menu">
                                                <li class="menu-item-has-children">
                                                    <a href='${pageContext.request.contextPath}/home'>event List</a>
                                                </li>
                                                <li><a href='${pageContext.request.contextPath}/payment'>event booking</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/gallery">gallery</a>
                                        </li>
                                        <li class="menu-item-has-children">
                                            <a href="${pageContext.request.contextPath}/contact">contact us</a>
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
                                                    <form action="${pageContext.request.contextPath}/home" method="GET">
                                                        <input class="search-input" type="search" placeholder="Search Event Name Here..." name="keyword">
                                                        <input type="hidden" name="search" value="searchByName">
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