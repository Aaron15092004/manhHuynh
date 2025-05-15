<%-- 
    Document   : dashboard
    Created on : Mar 8, 2025, 11:21:21 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="description" content="Harmoni - Admin Dashboard">

        <title>Harmoni - Admin Dashboard</title>

        <!-- GOOGLE FONTS -->
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&amp;family=Poppins:wght@300;400;500;600;700;800;900&amp;family=Roboto:wght@400;500;700;900&amp;display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/%40mdi/font%404.4.95/css/materialdesignicons.min.css" rel="stylesheet" />

        <!-- PLUGINS CSS STYLE -->
        <link href="${pageContext.request.contextPath}/assets/plugins/simplebar/simplebar.css" rel="stylesheet" />	

        <!-- Data Tables -->
        <link href='${pageContext.request.contextPath}/assets/plugins/data-tables/datatables.bootstrap5.min.css' rel='stylesheet'>
        <link href='${pageContext.request.contextPath}/assets/plugins/data-tables/responsive.datatables.min.css' rel='stylesheet'>

        <!-- ekka CSS -->
        <link id="ekka-css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ekka.css" />

        <!-- FAVICON -->
        <link href="${pageContext.request.contextPath}/assets/images/favicon.png" rel="shortcut icon" />
    </head>

    <body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-dark ec-header-light" id="body">

        <!-- WRAPPER -->
        <div class="wrapper">

            <!-- LEFT MAIN SIDEBAR -->
            <jsp:include page="../common/admin-common/LEFT-MAIN-SIDEBAR.jsp"></jsp:include>

                <!-- PAGE WRAPPER -->
                <div class="ec-page-wrapper">

                    <!-- Header -->
                <jsp:include page="../common/admin-common/Header.jsp"></jsp:include>

                    <!-- CONTENT WRAPPER -->
                    <div class="ec-content-wrapper">
                        <div class="breadcrumb-wrapper breadcrumb-contacts">
                            <div>
                                <h1>Event List</h1>
                                <p class="breadcrumbs"><span><a href="#!">Home</a></span>
                                    <span><i class="mdi mdi-chevron-right"></i></span>Event</p>
                            </div>
                            <div>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addVendor"> Add Event
                                </button>
                            </div>
                        </div>

                    <%-- Thêm đoạn này để hiển thị thông báo lỗi --%>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            ${errorMessage}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <div class="row">
                        <div class="col-12">
                            <div class="ec-vendor-list card card-default">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="responsive-data-table" class="table">
                                            <thead>
                                                <tr>
                                                    <th>Event Id</th>
                                                    <th>Title</th>
                                                    <th>Description</th>
                                                    <th>Location</th>
                                                    <th>Date</th>
                                                    <th>Max Attendees</th>
                                                    <th>Image</th>
                                                    <th>Category</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:choose>
                                                    <c:when test="${empty listEvent}">
                                                        <tr>
                                                            <td colspan="9" class="text-center">No events found</td>
                                                        </tr>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach items="${listEvent}" var="e">
                                                            <tr>
                                                                <td>${e.event_id}</td>
                                                                <td>${fn:escapeXml(e.title)}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(e.description) > 100}">
                                                                            ${fn:escapeXml(fn:substring(e.description, 0, 100))}...
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            ${fn:escapeXml(e.description)}
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td>${fn:escapeXml(e.location)}</td>
                                                                <td>
                                                                    <fmt:formatDate value="${e.event_date}" pattern="dd/MM/yyyy HH:mm" />
                                                                </td>
                                                                <td>${e.max_attendees}</td>
                                                                <td>
                                                                    <img src="${pageContext.request.contextPath}${e.image}" style="height: 100px; width: auto;" alt="Event Image" />
                                                                </td>
                                                                <td>
                                                                    <c:forEach items="${listCategory}" var="cat">
                                                                        <c:if test="${cat.category_id == e.category_id}">
                                                                            ${fn:escapeXml(cat.category_name)}
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </td>
                                                                <td>
                                                                    <button type="button" class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center" style="width: 80px;"
                                                                            data-bs-toggle="modal" 
                                                                            data-bs-target="#edit-event-modal"
                                                                            data-event-id="${e.event_id}"
                                                                            data-ticket-price="${ticketMap[e.event_id]}">
                                                                        <i class="mdi mdi-pencil me-1"></i> Edit
                                                                    </button>
                                                                    <button type="button" class="btn btn-outline-danger btn-sm d-flex align-items-center justify-content-center" style="width: 80px;"
                                                                            data-bs-toggle="modal" 
                                                                            data-bs-target="#delete-event-modal"
                                                                            data-event-id="${e.event_id}">
                                                                        <i class="mdi mdi-trash-can me-1"></i> Delete
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Vendor Modal  -->
                    <jsp:include page="../admin/addEventModal.jsp"></jsp:include>
                    <jsp:include page="../admin/deleteEventModal.jsp"></jsp:include>
                    <jsp:include page="../admin/editEventModal.jsp"></jsp:include>
                    <jsp:include page="../admin/logoutModal.jsp"></jsp:include>

                    </div> <!-- End Content -->
                </div> <!-- End Content Wrapper -->

                <!-- Footer -->
            <jsp:include page="../common/admin-common/Footer.jsp"></jsp:include>

            </div> <!-- End Page Wrapper -->

        </div> <!-- End Wrapper -->

        <!-- Common Javascript -->
        <script src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/admin/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/jquery-zoom/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/slick/slick.min.js"></script>

    <!-- Data Tables -->
    <script src='${pageContext.request.contextPath}/assets/plugins/data-tables/jquery.datatables.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/data-tables/datatables.bootstrap5.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/data-tables/datatables.responsive.min.js'></script>

    <!-- Option Switcher -->
    <script src="${pageContext.request.contextPath}/assets/plugins/options-sidebar/optionswitcher.js"></script>

    <!-- Ekka Custom -->
    <script src="${pageContext.request.contextPath}/assets/js/admin/ekka.js"></script>

    <!-- Ở cuối trang, ngay trước đóng thẻ body -->
    <script src="${pageContext.request.contextPath}/assets/js/admin/admin-event.js"></script>
</body>

<!-- Mirrored from maraviyainfotech.com/projects/ekka/ekka-v37/ekka-admin/vendor-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 02 Mar 2024 21:57:01 GMT -->
</html>

