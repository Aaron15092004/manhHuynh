<%-- 
    Document   : LEFT-MAIN-SIDEBAR
    Created on : Mar 16, 2025, 1:00:00 AM
    Author     : YourName
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <div class="ec-left-sidebar ec-bg-sidebar">
        <div id="sidebar" class="sidebar ec-sidebar-footer">
            <div style="text-align: center; margin: 20px 0;">
                <a href="${pageContext.request.contextPath}/home" title="Harmony" style="display: inline-block; border: 1px solid #ddd; padding: 10px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                    <img src="${pageContext.request.contextPath}/assets/images/0.site-logo.png" alt="Harmony Logo" style="max-width: 100%; height: auto; display: block;" />
                </a>
            </div>
            <!-- begin sidebar scrollbar -->
            <div class="ec-navigation" data-simplebar>
                <!-- sidebar menu -->
                <ul class="nav sidebar-inner" id="sidebar-menu">
                    <!-- Dashboard -->
                    <li class="${param.active == 'dashboard' ? 'active' : ''}">
                        <a class="sidenav-item-link" href="${pageContext.request.contextPath}/user/dashboard">
                            <i class="mdi mdi-view-dashboard-outline"></i>
                            <span class="nav-text">Dashboard</span>
                        </a>
                        <hr>
                    </li>
                    <!-- My Events -->
                    <li class="${param.active == 'events' ? 'active' : ''}">
                        <a class="sidenav-item-link" href="${pageContext.request.contextPath}/user/events">
                            <i class="mdi mdi-calendar-multiple"></i>
                            <span class="nav-text">My Events</span>
                        </a>
                    </li>
                    <!-- My Tickets -->
                    <li class="${param.active == 'tickets' ? 'active' : ''}">
                        <a class="sidenav-item-link" href="${pageContext.request.contextPath}/user/tickets">
                            <i class="mdi mdi-ticket"></i>
                            <span class="nav-text">My Tickets</span>
                        </a>
                    </li>
                    <!-- My Registrations -->
                    <li class="${param.active == 'registrations' ? 'active' : ''}">
                        <a class="sidenav-item-link" href="${pageContext.request.contextPath}/user/registrations">
                            <i class="mdi mdi-format-list-bulleted"></i>
                            <span class="nav-text">My Registrations</span>
                        </a>
                    </li>
                    <!-- Profile -->
                    <li class="${param.active == 'profile' ? 'active' : ''}">
                        <a class="sidenav-item-link" href="${pageContext.request.contextPath}/user/profile">
                            <i class="mdi mdi-account"></i>
                            <span class="nav-text">My Profile</span>
                        </a>
                        <hr>
                    </li>
                    <!-- View Site -->
                    <li>
                        <a class="sidenav-item-link" href="${pageContext.request.contextPath}/home">
                            <i class="mdi mdi-web"></i>
                            <span class="nav-text">View Website</span>
                        </a>
                    </li>
                    <!-- Logout -->
                    <li>
                        <a class="sidenav-item-link logout-btn" href="javascript:void(0);" onclick="confirmLogout()">
                            <i class="mdi mdi-logout"></i>
                            <span class="nav-text">Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</html>