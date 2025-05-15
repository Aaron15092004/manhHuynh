<%-- 
    Document   : Header
    Created on : Mar 16, 2025, 1:05:00 AM
    Author     : YourName
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <!-- Header -->
    <header class="ec-main-header" id="header">
        <nav class="navbar navbar-static-top navbar-expand-lg">
            <!-- Sidebar toggle button -->
            <button id="sidebar-toggler" class="sidebar-toggle"></button>
            <!-- search form -->
            <div class="search-form d-lg-inline-block">
                <div class="input-group">
                    <input type="text" name="query" id="search-input" class="form-control"
                           placeholder="Search for events..." autofocus autocomplete="off" />
                    <button type="button" name="search" id="search-btn" class="btn btn-flat">
                        <i class="mdi mdi-magnify"></i>
                    </button>
                </div>
                <div id="search-results-container">
                    <ul id="search-results"></ul>
                </div>
            </div>

            <!-- navbar right -->
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <!-- User Account -->
                    <li class="dropdown user-menu">
                        <button class="dropdown-toggle nav-link ec-drop" data-bs-toggle="dropdown"
                                aria-expanded="false">
                            <img src="${pageContext.request.contextPath}/assets/img/user/user.png" class="user-image" alt="User Image" />
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right ec-dropdown-menu">
                            <!-- User image -->
                            <li class="dropdown-header">
                                <img src="${pageContext.request.contextPath}/assets/img/user/user.png" class="img-circle" alt="User Image" />
                                <div class="d-inline-block">
                                    ${sessionScope.SESSION_USER.full_name} <small class="pt-1">
                                        ${sessionScope.SESSION_USER.email}</small>
                                </div>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/profile">
                                    <i class="mdi mdi-account"></i> My Profile
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/dashboard">
                                    <i class="mdi mdi-view-dashboard-outline"></i> Dashboard
                                </a>
                            </li>
                            <li class="dropdown-footer">
                                <a href="javascript:void(0);" onclick="confirmLogout()">
                                    <i class="mdi mdi-logout"></i> Log Out
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
</html>