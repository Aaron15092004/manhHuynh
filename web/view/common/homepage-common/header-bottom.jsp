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
                    <a href="${pageContext.request.contextPath}/homeIndex" class="logo">
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
                                        <a href="${pageContext.request.contextPath}/homeIndex">home</a>
                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="${pageContext.request.contextPath}/about">about</a>
                                        <ul class="sub-menu">
                                            <li><a href="${pageContext.request.contextPath}/about">about us</a></li>
                                            <li><a href='${pageContext.request.contextPath}/service.jsp'>service</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="${pageContext.request.contextPath}/home">events</a>
                                        <ul class="sub-menu">
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
