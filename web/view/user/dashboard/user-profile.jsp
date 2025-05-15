<%-- 
    Document   : user-profile
    Created on : Mar 16, 2025, 12:45:00 AM
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
        <meta name="description" content="Harmoni - User Profile">

        <title>Harmoni - My Profile</title>

        <!-- GOOGLE FONTS -->
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700;800&amp;family=Poppins:wght@300;400;500;600;700;800;900&amp;family=Roboto:wght@400;500;700;900&amp;display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/%40mdi/font%404.4.95/css/materialdesignicons.min.css" rel="stylesheet" />

        <!-- PLUGINS CSS STYLE -->
        <link href="${pageContext.request.contextPath}/assets/plugins/simplebar/simplebar.css" rel="stylesheet" />	

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
                <jsp:param name="active" value="profile" />
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
                                    <h1>My Profile</h1>
                                    <p class="breadcrumbs"><span><a href="${pageContext.request.contextPath}/home">Home</a></span>
                                    <span><i class="mdi mdi-chevron-right"></i></span>My Profile</p>
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
                            <div class="col-xl-8 col-lg-12">
                                <div class="ec-cat-list card card-default">
                                    <div class="card-header">
                                        <h2>Profile Information</h2>
                                    </div>
                                    <div class="card-body">
                                        <form action="${pageContext.request.contextPath}/user/profile" method="POST">
                                            <input type="hidden" name="action" value="update-profile">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form-group row">
                                                        <label for="full_name" class="col-sm-3 col-form-label">Full Name</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="full_name" name="full_name" 
                                                                   value="${user.full_name}" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="email" class="col-sm-3 col-form-label">Email</label>
                                                        <div class="col-sm-9">
                                                            <input type="email" class="form-control" id="email" name="email" 
                                                                   value="${user.email}" readonly>
                                                            <small class="form-text text-muted">Email cannot be changed</small>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row mt-4">
                                                        <div class="col-sm-3">
                                                            <label class="form-label">Change Password</label>
                                                            <small class="d-block text-muted">Leave blank if you don't want to change</small>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <div class="mb-3">
                                                                <label class="form-label">Current Password</label>
                                                                <input type="password" class="form-control" name="current_password">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">New Password</label>
                                                                <input type="password" class="form-control" name="new_password" 
                                                                       minlength="6" id="new_password">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Confirm Password</label>
                                                                <input type="password" class="form-control" name="confirm_password" 
                                                                       minlength="6" id="confirm_password">
                                                                <div id="passwordHelp" class="form-text text-danger"></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <div class="col-sm-9 offset-sm-3">
                                                            <button type="submit" class="btn btn-primary">Save Changes</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-4 col-lg-12">
                                <div class="ec-cat-list card card-default">
                                    <div class="card-header">
                                        <h2>Account Summary</h2>
                                    </div>
                                    <div class="card-body">
                                        <div class="mb-4">
                                            <h5 class="text-primary mb-3">
                                                <i class="mdi mdi-account-circle"></i> Account Information
                                            </h5>
                                            <p><strong>Name:</strong> ${user.full_name}</p>
                                            <p><strong>Email:</strong> ${user.email}</p>
                                            <p><strong>Role:</strong> 
                                                <c:choose>
                                                    <c:when test="${user.role_id == 1}">
                                                        Admin
                                                    </c:when>
                                                    <c:when test="${user.role_id == 2}">
                                                        User
                                                    </c:when>
                                                    <c:otherwise>
                                                        Unknown
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                        </div>

                                        <div class="mb-4">
                                            <h5 class="text-primary mb-3">
                                                <i class="mdi mdi-calendar-multiple"></i> Event Statistics
                                            </h5>
                                            <p><strong>Events Created:</strong> ${totalEvents}</p>
                                            <p><strong>Tickets Purchased:</strong> ${totalTickets}</p>
                                            <p><strong>Registrations:</strong> ${totalRegistrations}</p>
                                            <p><strong>Total Amount Paid:</strong> $<fmt:formatNumber value="${totalPaid}" pattern="#,##0.00"/></p>
                                        </div>

                                        <div class="mt-4">
                                            <a href="${pageContext.request.contextPath}/home" class="btn btn-primary btn-block">
                                                <i class="mdi mdi-home"></i> Back to Home
                                            </a>
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

        <!-- Option Switcher -->
        <script src="${pageContext.request.contextPath}/assets/plugins/options-sidebar/optionswitcher.js"></script>

        <!-- Ekka Custom -->
        <script src="${pageContext.request.contextPath}/assets/js/admin/ekka.js"></script>

        <script>
            // Xác thực mật khẩu khớp nhau
            document.addEventListener('DOMContentLoaded', function () {
                const newPassword = document.getElementById('new_password');
                const confirmPassword = document.getElementById('confirm_password');
                const passwordHelp = document.getElementById('passwordHelp');

                function validatePassword() {
                    if (newPassword.value !== confirmPassword.value) {
                        passwordHelp.textContent = 'Passwords do not match';
                        confirmPassword.setCustomValidity('Passwords do not match');
                    } else {
                        passwordHelp.textContent = '';
                        confirmPassword.setCustomValidity('');
                    }
                }

                if (newPassword && confirmPassword) {
                    newPassword.addEventListener('change', validatePassword);
                    confirmPassword.addEventListener('keyup', validatePassword);
                }
            });
        </script>
    </body>
</html>