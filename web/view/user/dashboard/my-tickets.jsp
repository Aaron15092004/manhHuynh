<%-- 
    Document   : my-tickets
    Created on : Mar 16, 2025, 12:10:00 AM
    Author     : YourName
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
        <meta name="description" content="Harmoni - User Tickets">

        <title>Harmoni - My Tickets</title>

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
            <jsp:include page="../../common/user-common/LEFT-MAIN-SIDEBAR.jsp">
                <jsp:param name="active" value="tickets" />
            </jsp:include>

            <!-- PAGE WRAPPER -->
            <div class="ec-page-wrapper">

                <!-- Header -->
                <jsp:include page="../../common/user-common/Header.jsp"></jsp:include>

                    <!-- CONTENT WRAPPER -->
                    <div class="ec-content-wrapper">
                        <div class="content">
                            <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                                <div>
                                    <h1>My Tickets</h1>
                                    <p class="breadcrumbs"><span><a href="${pageContext.request.contextPath}/home">Home</a></span>
                                    <span><i class="mdi mdi-chevron-right"></i></span>My Tickets</p>
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Browse Events</a>
                            </div>
                        </div>

                        <!-- Hiển thị thông báo lỗi nếu có -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ${errorMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>

                        <div class="row">
                            <div class="col-12">
                                <div class="card card-default">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="responsive-data-table" class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Ticket ID</th>
                                                        <th>Event</th>
                                                        <th>Quantity</th>
                                                        <th>Price</th>
                                                        <th>Total</th>
                                                        <th>Payment Status</th>
                                                        <th>Event Date</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:choose>
                                                        <c:when test="${empty userRegistrations}">
                                                            <tr>
                                                                <td colspan="8" class="text-center">No tickets found</td>
                                                            </tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${userRegistrations}" var="reg">
                                                                <tr>
                                                                    <td>${reg.registration_id}</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${not empty eventMap[reg.event_id]}">
                                                                                ${fn:escapeXml(eventMap[reg.event_id].title)}
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="text-muted">Unknown Event</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>${reg.ticket_quantity}</td>
                                                                    <td>
                                                                        <c:forEach items="${ticketMap}" var="entry">
                                                                            <c:if test="${entry.key == reg.event_id}">
                                                                                $<fmt:formatNumber value="${entry.value}" pattern="#,##0.00"/>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </td>
                                                                    <td>
                                                                        <c:forEach items="${ticketMap}" var="entry">
                                                                            <c:if test="${entry.key == reg.event_id}">
                                                                                $<fmt:formatNumber value="${entry.value * reg.ticket_quantity}" pattern="#,##0.00"/>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${not empty paymentMap[reg.payment_id]}">
                                                                                <c:set var="paymentStatus" value="${paymentMap[reg.payment_id].status}" />
                                                                                <c:choose>
                                                                                    <c:when test="${paymentStatus eq 'completed' || paymentStatus eq 'COMPLETED'}">
                                                                                        <span class="badge bg-success">Paid</span>
                                                                                    </c:when>
                                                                                    <c:when test="${paymentStatus eq 'pending' || paymentStatus eq 'PENDING'}">
                                                                                        <span class="badge bg-warning">Pending</span>
                                                                                    </c:when>
                                                                                    <c:when test="${paymentStatus eq 'failed' || paymentStatus eq 'FAILED'}">
                                                                                        <span class="badge bg-danger">Failed</span>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <span class="badge bg-secondary">${paymentStatus}</span>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="badge bg-secondary">Unknown</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${not empty eventMap[reg.event_id]}">
                                                                                <fmt:formatDate value="${eventMap[reg.event_id].event_date}" pattern="dd/MM/yyyy HH:mm" />
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="text-muted">Unknown</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>
                                                                        <div class="btn-group">
                                                                            <a href="${pageContext.request.contextPath}/event-details?id=${reg.event_id}" 
                                                                               class="btn btn-outline-primary btn-sm">
                                                                                <i class="mdi mdi-eye"></i> View Event
                                                                            </a>
                                                                            <c:if test="${not empty paymentMap[reg.payment_id] && (paymentMap[reg.payment_id].status eq 'pending' || paymentMap[reg.payment_id].status eq 'PENDING')}">
                                                                                <a href="${pageContext.request.contextPath}/payment?registration_id=${reg.registration_id}" 
                                                                                   class="btn btn-outline-success btn-sm">
                                                                                    <i class="mdi mdi-cash-multiple"></i> Pay Now
                                                                                </a>
                                                                            </c:if>
                                                                        </div>
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
                    </div> <!-- End Content -->
                </div> <!-- End Content Wrapper -->

                <!-- Footer -->
                <jsp:include page="../../common/user-common/Footer.jsp"></jsp:include>

                </div> <!-- End Page Wrapper -->

            </div> <!-- End Wrapper -->

            <!-- Modal Logout -->
        <jsp:include page="../../common/user-common/logoutModal.jsp"></jsp:include>

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
    </body>
</html>