<%-- 
    Document   : reports
    Created on : Mar 16, 2025, 2:00:00 PM
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
        <meta name="description" content="Harmoni - Admin Reports">

        <title>Harmoni - Reports</title>

        <!-- GOOGLE FONTS -->
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&amp;family=Poppins:wght@300;400;500;600;700;800;900&amp;family=Roboto:wght@400;500;700;900&amp;display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/%40mdi/font%404.4.95/css/materialdesignicons.min.css" rel="stylesheet" />

        <!-- PLUGINS CSS STYLE -->
        <link href="${pageContext.request.contextPath}/assets/plugins/simplebar/simplebar.css" rel="stylesheet" />	

        <!-- Chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <!-- ekka CSS -->
        <link id="ekka-css" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ekka.css" />

        <!-- FAVICON -->
        <link href="${pageContext.request.contextPath}/assets/images/favicon.png" rel="shortcut icon" />

        <style>
            .dashboard-card {
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                transition: transform 0.3s ease;
            }
            .dashboard-card:hover {
                transform: translateY(-5px);
            }
            .dashboard-card .card-icon {
                font-size: 3rem;
                margin-bottom: 1rem;
            }
            .dashboard-card .card-title {
                font-size: 1.1rem;
                font-weight: 600;
            }
            .dashboard-card .card-value {
                font-size: 1.8rem;
                font-weight: 700;
            }
            .chart-container {
                position: relative;
                margin: auto;
                height: 300px;
                width: 100%;
            }
        </style>
    </head>

    <body class="ec-header-fixed ec-sidebar-fixed ec-sidebar-dark ec-header-light" id="body">

        <!-- WRAPPER -->
        <div class="wrapper">

            <!-- LEFT MAIN SIDEBAR -->
            <jsp:include page="../common/admin-common/LEFT-MAIN-SIDEBAR.jsp">
                <jsp:param name="active" value="reports" />
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
                                    <h1>Reports & Analytics</h1>
                                    <p class="breadcrumbs"><span><a href="${pageContext.request.contextPath}/admin/dashboard">Home</a></span>
                                    <span><i class="mdi mdi-chevron-right"></i></span>Reports</p>
                            </div>
                            <div>
                                <form action="${pageContext.request.contextPath}/admin/reports" method="post">
                                    <input type="hidden" name="action" value="export_report">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="mdi mdi-file-export"></i> Export Report
                                    </button>
                                </form>
                            </div>
                        </div>

                        <!-- Hiển thị thông báo lỗi nếu có -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ${errorMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>

                        <!-- Dashboard Cards -->
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                                <div class="card dashboard-card bg-primary text-white h-100">
                                    <div class="card-body text-center">
                                        <div class="card-icon">
                                            <i class="mdi mdi-calendar-multiple"></i>
                                        </div>
                                        <div class="card-title">Total Events</div>
                                        <div class="card-value">${totalEvents}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                                <div class="card dashboard-card bg-success text-white h-100">
                                    <div class="card-body text-center">
                                        <div class="card-icon">
                                            <i class="mdi mdi-account-group"></i>
                                        </div>
                                        <div class="card-title">Total Users</div>
                                        <div class="card-value">${totalUsers}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                                <div class="card dashboard-card bg-info text-white h-100">
                                    <div class="card-body text-center">
                                        <div class="card-icon">
                                            <i class="mdi mdi-ticket-confirmation"></i>
                                        </div>
                                        <div class="card-title">Total Registrations</div>
                                        <div class="card-value">${totalRegistrations}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                                <div class="card dashboard-card bg-warning text-white h-100">
                                    <div class="card-body text-center">
                                        <div class="card-icon">
                                            <i class="mdi mdi-cash-multiple"></i>
                                        </div>
                                        <div class="card-title">Total Revenue</div>
                                        <div class="card-value">$<fmt:formatNumber value="${totalRevenue}" pattern="#,##0.00"/></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Charts and detailed reports -->
                        <div class="row">
                            <!-- Payments Status Chart -->
                            <div class="col-lg-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-header">
                                        <h5>Payment Status</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="paymentStatusChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Recent Stats -->
                            <div class="col-lg-6 mb-4">
                                <div class="card h-100">
                                    <div class="card-header">
                                        <h5>Payment Statistics</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-borderless">
                                                <tbody>
                                                    <tr>
                                                        <td><strong>Completed Payments:</strong></td>
                                                        <td>
                                                            <span class="badge bg-success">${completedPayments}</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>Pending Payments:</strong></td>
                                                        <td>
                                                            <span class="badge bg-warning">${pendingPayments}</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>Failed Payments:</strong></td>
                                                        <td>
                                                            <span class="badge bg-danger">${failedPayments}</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>Success Rate:</strong></td>
                                                        <td>
                                                            <c:set var="totalPayments" value="${completedPayments + pendingPayments + failedPayments}" />
                                                            <c:set var="successRate" value="${totalPayments > 0 ? (completedPayments / totalPayments) * 100 : 0}" />
                                                            <fmt:formatNumber value="${successRate}" pattern="#,##0.0"/>%
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>Average Revenue per Registration:</strong></td>
                                                        <td>
                                                            <c:set var="avgRevenue" value="${totalRegistrations > 0 ? totalRevenue / totalRegistrations : 0}" />
                                                            $<fmt:formatNumber value="${avgRevenue}" pattern="#,##0.00"/>
                                                        </td>
                                                    </tr>
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

        <!-- Option Switcher -->
        <script src="${pageContext.request.contextPath}/assets/plugins/options-sidebar/optionswitcher.js"></script>

        <!-- Ekka Custom -->
        <script src="${pageContext.request.contextPath}/assets/js/admin/ekka.js"></script>

        <script>
            $(document).ready(function () {
                // Xử lý hiển thị thông báo lỗi nếu có
                if ($('.alert').length > 0) {
                    // Tự động đóng thông báo sau 5 giây
                    setTimeout(function () {
                        $('.alert').alert('close');
                    }, 5000);
                }

                // Payment Status Chart
                const paymentStatusCtx = document.getElementById('paymentStatusChart').getContext('2d');
                const paymentStatusChart = new Chart(paymentStatusCtx, {
                    type: 'doughnut',
                    data: {
                        labels: ['Completed', 'Pending', 'Failed'],
                        datasets: [{
                                data: [${completedPayments}, ${pendingPayments}, ${failedPayments}],
                                backgroundColor: [
                                    'rgba(40, 167, 69, 0.8)',
                                    'rgba(255, 193, 7, 0.8)',
                                    'rgba(220, 53, 69, 0.8)'
                                ],
                                borderColor: [
                                    'rgba(40, 167, 69, 1)',
                                    'rgba(255, 193, 7, 1)',
                                    'rgba(220, 53, 69, 1)'
                                ],
                                borderWidth: 1
                            }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                position: 'bottom'
                            },
                            title: {
                                display: true,
                                text: 'Payment Status Distribution'
                            }
                        }
                    }
                });
            });
        </script>
    </body>
</html>