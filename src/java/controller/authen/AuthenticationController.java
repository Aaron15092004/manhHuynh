/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authen;

import constant.CommonConst;
import dal.implement.UserDAO;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Admin
 */
public class AuthenticationController extends HttpServlet {

    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        //get ve action
        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";
        //dua theo action để xử lý request
        switch (action) {
            case "login" ->
                loginDoPost(request, response);
            case "log-out" ->
                logoutDoPost(request, response);
            case "register" ->
                register(request, response);
            default ->
                response.sendRedirect(request.getHeader("Referer"));
        }
    }

    private void loginDoPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get ve cac thong tin nguoi dung nhap
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //kiểm tra thông tin có tồn tại trong DB không
        User user = new User(email, password);
        User userFoundByEmailPass = userDAO.findByEmailAndPassword(user);

        //có: trang home(set account vào trong session)
        if (userFoundByEmailPass != null) {
            // Đăng nhập thành công: lưu thông tin người dùng vào session
            request.getSession().setAttribute(CommonConst.SESSION_USER, userFoundByEmailPass);
            // Xóa các thuộc tính session liên quan đến đăng nhập thất bại
            request.getSession().removeAttribute("error");
            request.getSession().removeAttribute("showLoginModal");
            request.getSession().removeAttribute("loginEmail");

            request.getSession().removeAttribute("showRegisterModal");
            // Chuyển hướng đến trang chủ
            response.sendRedirect("home");
        } //không: giữ nguyên phần modal login (set thêm thông báo lỗi)
        else {
            // Đăng nhập thất bại: thiết lập thông báo lỗi và mở modal
            request.getSession().setAttribute("error", "Email or password incorrect!!!");
            request.getSession().setAttribute("showLoginModal", true);  // Đánh dấu mở modal
            request.getSession().setAttribute("loginEmail", email);  // Lưu lại email đã nhập

            request.getSession().removeAttribute("showRegisterModal");
            // Chuyển hướng về trang hiện tại
            response.sendRedirect(request.getHeader("Referer"));
        }

    }

    private void logoutDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xóa thông tin người dùng khỏi session
        request.getSession().removeAttribute(CommonConst.SESSION_USER);
        request.getSession().removeAttribute("showRegisterModal");
        request.getSession().removeAttribute("showLoginModal");
        // Chuyển hướng về trang chủ
        response.sendRedirect("home");
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //get ve cac thong tin người dùng nhập
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra các trường không được trống
        if (userName == null || userName.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || password == null || password.isEmpty()
                || confirmPassword == null || confirmPassword.isEmpty()) {

            request.getSession().setAttribute("registerError", "All fields are required");
            request.getSession().setAttribute("registerUserName", userName);
            request.getSession().setAttribute("registerEmail", email);
            request.getSession().setAttribute("showRegisterModal", true);
            request.getSession().removeAttribute("showLoginModal");
            response.sendRedirect(request.getHeader("Referer"));
            return;
        }

        // Kiểm tra mật khẩu có ít nhất 6 ký tự
        if (password.length() < 6) {
            request.getSession().setAttribute("registerError", "Password must be at least 6 characters");
            request.getSession().setAttribute("registerUserName", userName);
            request.getSession().setAttribute("registerEmail", email);
            request.getSession().setAttribute("showRegisterModal", true);
            request.getSession().removeAttribute("showLoginModal");
            response.sendRedirect(request.getHeader("Referer"));
            return;
        }

        // Kiểm tra mật khẩu và mật khẩu xác nhận có khớp nhau không
        if (!password.equals(confirmPassword)) {
            request.getSession().setAttribute("registerError", "Passwords do not match");
            request.getSession().setAttribute("registerUserName", userName);
            request.getSession().setAttribute("registerEmail", email);
            request.getSession().setAttribute("showRegisterModal", true);
            request.getSession().removeAttribute("showLoginModal");
            response.sendRedirect(request.getHeader("Referer"));
            return;
        }

        //kiểm tra xem email đã tồn tại trong DB chưa
        User user = new User(email, password, userName);
        boolean isExistEmail = userDAO.checkEmailExist(user);

        //True: set ra thông báo lỗi, quay trở lại form register
        if (isExistEmail) {
            // Lưu thông báo lỗi vào session
            request.getSession().setAttribute("registerError", "Email already exists!");
            // Lưu lại giá trị người dùng đã nhập
            request.getSession().setAttribute("registerUserName", userName);
            request.getSession().setAttribute("registerEmail", email);
            // Đánh dấu mở modal đăng ký
            request.getSession().setAttribute("showRegisterModal", true);

            request.getSession().removeAttribute("showLoginModal");
            // Chuyển hướng về trang hiện tại
            response.sendRedirect(request.getHeader("Referer"));
        } //false: quay trở lại home (ghi tài khoản vào trong DB)
        else {
            // Nếu email chưa tồn tại, thêm người dùng vào DB
            userDAO.insert(user);
            // Xóa các thuộc tính session liên quan đến đăng ký
            request.getSession().removeAttribute("registerError");
            request.getSession().removeAttribute("registerUserName");
            request.getSession().removeAttribute("registerEmail");
            request.getSession().removeAttribute("showRegisterModal");

            request.getSession().removeAttribute("showLoginModal");

            // Thông báo đăng ký thành công
            request.getSession().setAttribute("successMessage", "Registration successful! You can now login.");

            // Chuyển hướng đến trang chủ
            response.sendRedirect("home");
        }
    }
}
