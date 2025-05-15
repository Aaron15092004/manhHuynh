<%-- 
    Document   : header-top
    Created on : Feb 21, 2025, 1:38:06 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="header-top">
    <div class="container">
        <div class="row">

            <!-- basic-contact - start -->
            <div class="col-lg-6">
                <div class="basic-contact">
                    <ul>
                        <li>
                            <a href="#!">
                                <i class="fas fa-envelope"></i>
                                info@harmoni.com
                            </a>
                        </li>
                        <li>
                            <a href="#!">
                                <i class="fas fa-phone"></i>
                                100-2222-9999
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- basic-contact - end -->

            <!-- register-login-group - start -->
            <div class="col-lg-6">
                <div class="register-login-group">
                    <ul>
                        <c:choose>
                            <c:when test="${not empty user}">
                                <!-- Hiển thị khi người dùng đã đăng nhập -->
                                <li>
                                    <c:choose>
                                        <c:when test="${user.role_id == 1}">
                                            <!-- Nếu role_id = 1 (admin), chuyển hướng đến admin/dashboard -->
                                            <a href="${pageContext.request.contextPath}/admin/dashboard">
                                                <i class="fas fa-user"></i>
                                                <span class="welcome-text">Welcome, <strong>${user.full_name}</strong></span>
                                            </a>
                                        </c:when>
                                        <c:when test="${user.role_id == 2}">
                                            <!-- Nếu role_id = 2 (user), chuyển hướng đến user/dashboard -->
                                            <a href="${pageContext.request.contextPath}/user/dashboard">
                                                <i class="fas fa-user"></i>
                                                <span class="welcome-text">Welcome, <strong>${user.full_name}</strong></span>
                                            </a>
                                        </c:when>
                                    </c:choose>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" onclick="document.getElementById('logoutForm').submit();">
                                        <i class="fas fa-sign-out-alt"></i>
                                        Sign out
                                    </a>
                                    <form id="logoutForm" action="authen" method="POST" style="display: none;">
                                        <input type="hidden" name="action" value="log-out">
                                    </form>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <!-- Hiển thị khi người dùng chưa đăng nhập -->
                                <li>
                                    <a href="#register-modal" class="register-modal-btn">
                                        <i class="fas fa-user"></i>
                                        Register
                                    </a>
                                </li>
                                <li>
                                    <a href="#login-modal" class="login-modal-btn">
                                        <i class="fas fa-lock"></i>
                                        Login
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
            <!-- register-login-group - end -->
        </div>
    </div>
</div>

<!-- Modal đăng ký -->
<div id="register-modal" class="reglog-modal-wrapper register-modal mfp-hide clearfix" style="background-image: url('${pageContext.request.contextPath}/assets/images/login-modal-bg.jpg');">
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
                    <li><a href="#!">Login</a></li>
                    <li class="active"><a href="#!">Register</a></li>
                </ul>
            </div>
            <div class="copyright-text">
                <p class="m-0">©2018 <a href="#!" class="yellow-color">Harmoni.com</a> all right reserved, made with <i class="fas fa-heart"></i> by jThemes Studio </p>
            </div>
        </div>
        <!-- leftside-content - end -->

        <!-- rightside-content - start -->
        <div class="rightside-content text-center">
            <div class="mb-30">
                <h2 class="form-title title-large white-color">Account <strong>Register</strong></h2>
                <span class="form-subtitle white-color">Have an account? <strong>LOGIN NOW</strong></span>
            </div>

            <!-- Trong form đăng ký -->
            <div class="login-form text-center mb-50">
                <form action="authen?action=register" method="POST" id="registerForm">
                    <div class="form-item">
                        <input type="text" placeholder="User Name" name="userName" value="${registerUserName != null ? registerUserName : ''}">
                    </div>
                    <div class="form-item">
                        <input type="password" placeholder="Password" name="password" id="registerPassword">
                        <button type="button" id="toggleRegisterPassword" style="background: none; border: none; cursor: pointer; position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="form-item">
                        <input type="password" placeholder="Confirm Password" name="confirmPassword" id="confirmPassword">
                        <button type="button" id="toggleConfirmPassword" style="background: none; border: none; cursor: pointer; position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="form-item">
                        <input type="email" placeholder="Email Address" name="email" value="${registerEmail != null ? registerEmail : ''}">
                    </div>
                    <button type="submit" class="login-btn">Register now</button>
                    <!-- Hiển thị thông báo lỗi -->
                    <c:if test="${not empty registerError}">
                        <div class="error-message" style="color: #ff5757; margin-top: 15px; background-color: rgba(230, 247, 255, 0.9); padding: 10px; border-radius: 5px; font-size: 14px; text-align: left; border-left: 3px solid #ff5757; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
                            <i class="fas fa-exclamation-circle" style="margin-right: 5px;"></i> ${registerError}
                        </div>
                        <c:remove var="registerError" scope="session" />
                    </c:if>
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

<!-- Modal đăng nhập -->
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
                <p class="m-0">©2018 <a href="#!" class="yellow-color">Harmoni.com</a> all right reserved, made with <i class="fas fa-heart"></i> by jThemes Studio </p>
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

            <!-- Trong form đăng nhập -->
            <div class="login-form text-center mb-50">
                <form action="authen?action=login" method="POST">
                    <div class="form-item">
                        <input type="email" placeholder="example@gmail.com" name="email" id="loginEmail" value="${loginEmail != null ? loginEmail : ''}">
                    </div>
                    <div class="form-item">
                        <input type="password" placeholder="Password" name="password" id="loginPassword">
                        <button type="button" id="toggleLoginPassword" style="background: none; border: none; cursor: pointer; position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <button type="submit" class="login-btn">login now</button>
                    <!-- Hiển thị thông báo lỗi -->
                    <c:if test="${not empty error}">
                        <div class="error-message" style="color: #ff5757; margin-top: 15px; background-color: rgba(230, 247, 255, 0.9); padding: 10px; border-radius: 5px; font-size: 14px; text-align: left; border-left: 3px solid #ff5757; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
                            <i class="fas fa-exclamation-circle" style="margin-right: 5px;"></i> ${error}
                        </div>
                        <c:remove var="error" scope="session" />
                    </c:if>
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

<!-- Script để kiểm tra và mở modal login -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra nếu có thông báo lỗi đăng nhập
        var loginError = "${sessionScope.error}";
        var showLoginModal = "${sessionScope.showLoginModal}";

        // Kiểm tra nếu có thông báo lỗi đăng ký
        var registerError = "${sessionScope.registerError}";
        var showRegisterModal = "${sessionScope.showRegisterModal}";

        // Tự động mở modal đăng nhập nếu có lỗi
        if (showLoginModal === "true" || loginError) {
            setTimeout(function () {
                if (typeof $.magnificPopup !== 'undefined') {
                    $.magnificPopup.open({
                        items: {
                            src: '#login-modal'
                        },
                        type: 'inline'
                    });
                }
            }, 300);
        }

        // Tự động mở modal đăng ký nếu có lỗi
        if (showRegisterModal === "true" || registerError) {
            setTimeout(function () {
                if (typeof $.magnificPopup !== 'undefined') {
                    $.magnificPopup.open({
                        items: {
                            src: '#register-modal'
                        },
                        type: 'inline'
                    });
                }
            }, 300);
        }

        // Đóng modal nếu đăng nhập thành công
        var isLoggedIn = "${user != null}";
        if (isLoggedIn === "true") {
            if (typeof $.magnificPopup !== 'undefined') {
                $.magnificPopup.close();  // Đóng modal
            }
        }

        // Hàm toggle password
        function togglePassword(passwordFieldId, toggleButtonId) {
            const passwordField = document.getElementById(passwordFieldId);
            const toggleButton = document.getElementById(toggleButtonId);

            if (passwordField && toggleButton) {
                toggleButton.addEventListener("click", function () {
                    const type = passwordField.getAttribute("type") === "password" ? "text" : "password";
                    passwordField.setAttribute("type", type);

                    const icon = toggleButton.querySelector("i");
                    if (type === "password") {
                        icon.classList.remove("fa-eye-slash");
                        icon.classList.add("fa-eye");
                    } else {
                        icon.classList.remove("fa-eye");
                        icon.classList.add("fa-eye-slash");
                    }
                });
            }
        }

        // Áp dụng cho form đăng ký
        togglePassword("registerPassword", "toggleRegisterPassword");

        // Áp dụng cho form đăng nhập
        togglePassword("loginPassword", "toggleLoginPassword");

        // Áp dụng cho trường xác nhận mật khẩu
        togglePassword("confirmPassword", "toggleConfirmPassword");
    });

    // Hiển thị lỗi
    function showFormError(message) {
        const registerForm = document.getElementById('registerForm');

        // Xóa thông báo lỗi cũ nếu có
        const oldError = registerForm.querySelector('.error-message');
        if (oldError) {
            oldError.remove();
        }

        // Tạo thông báo lỗi mới với màu nền trắng giống như lỗi cố định
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.style.cssText = 'color: #ff5757; margin-top: 15px; background-color: rgba(230, 247, 255, 0.9); padding: 10px; border-radius: 5px; font-size: 14px; text-align: left; border-left: 3px solid #ff5757; box-shadow: 0 2px 4px rgba(0,0,0,0.1);';
        errorDiv.innerHTML = `<i class="fas fa-exclamation-circle" style="margin-right: 5px;"></i> ${message}`;

        // Thêm vào form
        registerForm.appendChild(errorDiv);
    }
</script>