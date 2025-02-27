<%-- 
    Document   : header-bottom
    Created on : Feb 21, 2025, 1:41:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="header-bottom">
    <div class="container">
        <div class="row">

            <!-- site-logo-wrapper - start -->
            <div class="col-lg-3">
                <div class="site-logo-wrapper">
                    <a href="home.jsp" class="logo">
                        <img src="${pageContext.request.contextPath}/assets/images/0.site-logo.png" alt="logo_not_found">
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
                                    <li class="menu-item-has-children">
                                        <a href="home.jsp">home</a>
                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="about.jsp">about</a>
                                        <ul class="sub-menu">
                                            <li><a href="about.jsp">about us</a></li>
                                            <li><a href='service.jsp'>service</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="list-event.jsp">events</a>
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
                                        <a href="#!">
                                            <i class="fas fa-user"></i>
                                        </a>
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
