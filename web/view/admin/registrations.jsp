<%-- 
    Document   : registrations
    Created on : Mar 16, 2025, 1:35:00 PM
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
        <meta name="description" content="Harmoni - Admin User Registrations">

        <title>Harmoni - User Registrations</title>

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
        
        <style>
            .payment-status {
                font-weight: bold;
                padding: 5px 8px;
                border-radius: 4px;
            }
            .status-completed {
                background-color: #d1e7dd;
                color: #0f5132;
            }
            .status-pending {
                background-color: #fff3cd;
                color: #856404;
            }
            .status-failed {
                background-color: #f8d7da;
                color: #721c24;
            }
        </style>
    </head>

    <body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-dark ec-header-light" id="body">

        <!-- WRAPPER -->
        <div class="wrapper">

            <!-- LEFT MAIN SIDEBAR -->
            <jsp:include page="../common/admin-common/LEFT-MAIN-SIDEBAR.jsp">
                <jsp:param name="active" value="registrations" />
            </jsp:include>

            <!-- PAGE WRAPPER -->
            <div class="ec-page-wrapper">

                <!-- Header -->
                <jsp:include page="../common/admin-common/Header.jsp"></jsp:include>

                <!-- CONTENT WRAPPER -->
                <div class="ec-content-wrapper">
                    <div class="content">
                        <div class="breadcrumb-wrapper d-flex align-items-center justify-content-between">
                            <div>
                                <h1>User Registrations</h1>
                                <p class="breadcrumbs"><span><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></span>
                                    <span><i class="mdi mdi-chevron-right"></i></span>User Registrations</p>
                            </div>
                        </div>

                        <!-- Hiển thị thông báo lỗi nếu có -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ${errorMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>

                        <!-- Hiển thị thông báo thành công nếu có -->
                        <c:if test="${not empty successMessage}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                ${successMessage}
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
                                                        <th>ID</th>
                                                        <th>User</th>
                                                        <th>Event</th>
                                                        <th>Tickets</th>
                                                        <th>Amount</th>
                                                        <th>Payment Date</th>
                                                        <th>Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:choose>
                                                        <c:when test="${empty registrations}">
                                                            <tr>
                                                                <td colspan="8" class="text-center">No registrations found.</td>
                                                            </tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach items="${registrations}" var="reg">
                                                                <tr>
                                                                    <td>${reg.registration_id}</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${not empty userMap[reg.user_id]}">
                                                                                ${fn:escapeXml(userMap[reg.user_id].full_name)}<br>
                                                                                <small>${fn:escapeXml(userMap[reg.user_id].email)}</small>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="text-muted">Unknown User</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${not empty eventMap[reg.event_id]}">
                                                                                ${fn:escapeXml(eventMap[reg.event_id].title)}<br>
                                                                                <small class="text-muted">
                                                                                    <fmt:formatDate value="${eventMap[reg.event_id].event_date}" pattern="dd/MM/yyyy HH:mm" />
                                                                                </small>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="text-muted">Unknown Event</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>${reg.ticket_quantity}</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${not empty paymentMap[reg.payment_id]}">
                                                                                $<fmt:formatNumber value="${paymentMap[reg.payment_id].amount}" pattern="#,##0.00"/>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="text-muted">N/A</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${not empty paymentMap[reg.payment_id] && paymentMap[reg.payment_id].payment_date != null}">
                                                                                <fmt:formatDate value="${paymentMap[reg.payment_id].payment_date}" pattern="dd/MM/yyyy HH:mm" />
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="text-muted">Pending</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${not empty paymentMap[reg.payment_id]}">
                                                                                <c:set var="paymentStatus" value="${paymentMap[reg.payment_id].status}" />
                                                                                <c:choose>
                                                                                    <c:when test="${paymentStatus eq 'completed' || paymentStatus eq 'COMPLETED'}">
                                                                                        <span class="payment-status status-completed">Completed</span>
                                                                                    </c:when>
                                                                                    <c:when test="${paymentStatus eq 'pending' || paymentStatus eq 'PENDING'}">
                                                                                        <span class="payment-status status-pending">Pending</span>
                                                                                    </c:when>
                                                                                    <c:when test="${paymentStatus eq 'failed' || paymentStatus eq 'FAILED'}">
                                                                                        <span class="payment-status status-failed">Failed</span>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <span class="payment-status">${paymentStatus}</span>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="text-muted">Unknown</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>
                                                                        <div class="btn-group-vertical">
                                                                            <a href="${pageContext.request.contextPath}/event-details?id=${reg.event_id}" 
                                                                               class="btn btn-outline-info btn-sm mb-1" style="width: 95px;">
                                                                                <i class="mdi mdi-eye me-1"></i> View Event
                                                                            </a>
                                                                            
                                                                            <c:if test="${not empty paymentMap[reg.payment_id] && paymentMap[reg.payment_id].status eq 'pending'}">
                                                                                <form action="${pageContext.request.contextPath}/admin/registrations" method="post" class="mb-1">
                                                                                    <input type="hidden" name="action" value="approve_payment">
                                                                                    <input type="hidden" name="payment_id" value="${reg.payment_id}">
                                                                                    <button type="submit" class="btn btn-outline-success btn-sm" style="width: 95px;">
                                                                                        <i class="mdi mdi-check me-1"></i> Approve
                                                                                    </button>
                                                                                </form>
                                                                                <form action="${pageContext.request.contextPath}/admin/registrations" method="post">
                                                                                    <input type="hidden" name="action" value="reject_payment">
                                                                                    <input type="hidden" name="payment_id" value="${reg.payment_id}">
                                                                                    <button type="submit" class="btn btn-outline-danger btn-sm" style="width: 95px;">
                                                                                        <i class="mdi mdi-close me-1"></i> Reject
                                                                                    </button>
                                                                                </form>
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
                <jsp:include page="../common/admin-common/Footer.jsp"></jsp:include>

            </div> <!-- End Page Wrapper -->
        </div> <!-- End Wrapper -->

        <!-- Modal Logout -->
        <jsp:include page="../admin/logoutModal.jsp"></jsp:include>

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

        <script>
            $(document).ready(function() {
                // Cấu hình DataTable
                if ($('#responsive-data-table').length) {
                    $('#responsive-data-table').DataTable({
                        "language": {
                            "lengthMenu": "Hiển thị _MENU_ mục",
                            "zeroRecords": "Không tìm thấy kết quả phù hợp",
                            "info": "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
                            "infoEmpty": "Hiển thị 0 đến 0 của 0 mục",
                            "infoFiltered": "(lọc từ tổng số _MAX_ mục)",
                            "search": "Tìm kiếm:",
                            "paginate": {
                                "first": "Đầu",
                                "last": "Cuối",
                                "next": "Sau",
                                "previous": "Trước"
                            }
                        },
                        "order": [[0, "desc"]] // Sắp xếp theo registration_id giảm dần
                    });
                }
                
                // Xử lý hiển thị thông báo lỗi nếu có
                if ($('.alert').length > 0) {
                    // Tự động đóng thông báo sau 5 giây
                    setTimeout(function() {
                        $('.alert').alert('close');
                    }, 5000);
                }
            });
        </script>
    </body>
</html>