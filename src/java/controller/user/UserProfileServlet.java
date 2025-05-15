package controller.user;

import constant.CommonConst;
import dal.implement.EventDAO;
import dal.implement.PaymentDAO;
import dal.implement.RegistrationDAO;
import dal.implement.UserDAO;
import entity.Event;
import entity.Payment;
import entity.Registration;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet để xử lý thông tin cá nhân của người dùng
 *
 * @author YourName
 */
public class UserProfileServlet extends HttpServlet {

    private final EventDAO eventDAO = new EventDAO();
    private final RegistrationDAO registrationDAO = new RegistrationDAO();
    private final UserDAO userDAO = new UserDAO();
    private final PaymentDAO paymentDAO = new PaymentDAO();

    private static final int USER_ROLE_ID = 2;
    private static final Logger logger = Logger.getLogger(UserProfileServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy thông tin người dùng từ session
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute(CommonConst.SESSION_USER);

        // Kiểm tra người dùng đã đăng nhập chưa
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/authen");
            return;
        }

        // Kiểm tra nếu không phải user thường
        if (currentUser.getRole_id() != USER_ROLE_ID) {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }

        // Lấy các thông tin cần thiết cho profile
        int userId = currentUser.getUser_id();

        // Lấy người dùng hiện tại từ database để đảm bảo dữ liệu mới nhất
        User latestUserInfo = userDAO.findById(userId);
        if (latestUserInfo != null) {
            // Cập nhật thông tin session với dữ liệu mới nhất
            session.setAttribute(CommonConst.SESSION_USER, latestUserInfo);
            // Sử dụng thông tin cập nhật cho request
            currentUser = latestUserInfo;
        }

        // Lấy các sự kiện do user tạo
        List<Event> userEvents = eventDAO.findByUserId(userId);

        // Lấy các đăng ký của user
        List<Registration> userRegistrations = registrationDAO.findByUserId(userId);

        // Lấy tất cả payment của user
        List<Payment> userPayments = paymentDAO.findByUserId(userId);

        // Tính số lượng vé đã mua
        int totalTicketsPurchased = 0;
        for (Registration reg : userRegistrations) {
            totalTicketsPurchased += reg.getTicket_quantity();
        }

        // Tính tổng số tiền đã thanh toán
        double totalPaid = 0;
        for (Payment payment : userPayments) {
            if ("completed".equalsIgnoreCase(payment.getStatus()) || "COMPLETED".equalsIgnoreCase(payment.getStatus())) {
                totalPaid += payment.getAmount();
            }
        }

        // Hiển thị thông báo lỗi nếu có
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            session.removeAttribute("errorMessage");
        }

        // Hiển thị thông báo thành công nếu có
        String successMessage = (String) session.getAttribute("successMessage");
        if (successMessage != null) {
            request.setAttribute("successMessage", successMessage);
            session.removeAttribute("successMessage");
        }

        // Set attribute cho profile
        request.setAttribute("userInfo", currentUser);
        request.setAttribute("totalEvents", userEvents.size());
        request.setAttribute("totalRegistrations", userRegistrations.size());
        request.setAttribute("totalTickets", totalTicketsPurchased);
        request.setAttribute("totalPaid", totalPaid);

        // Đảm bảo thông tin cá nhân hiển thị
        logger.log(Level.INFO, "UserProfile: User ID={0}, Name={1}, Email={2}, Role={3}",
                new Object[]{currentUser.getUser_id(), currentUser.getFull_name(),
                    currentUser.getEmail(), currentUser.getRole_id()});

        // Forward đến trang user-profile.jsp
        request.getRequestDispatcher("../view/user/dashboard/user-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Get session
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute(CommonConst.SESSION_USER);

        // Kiểm tra nếu người dùng chưa đăng nhập
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/authen");
            return;
        }

        // Get action
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");

        switch (action) {
            case "update-profile" -> {
                // Lấy thông tin từ form
                String fullName = request.getParameter("full_name");
                String currentPassword = request.getParameter("current_password");
                String newPassword = request.getParameter("new_password");
                String confirmPassword = request.getParameter("confirm_password");

                logger.log(Level.INFO, "Updating profile for user ID: {0}, name: {1}", new Object[]{currentUser.getUser_id(), fullName});

                // Cập nhật thông tin cơ bản
                if (fullName != null && !fullName.trim().isEmpty()) {
                    currentUser.setFull_name(fullName);

                    // Lưu vào database
                    boolean updateSuccess = userDAO.updateName(currentUser.getUser_id(), fullName);

                    if (updateSuccess) {
                        // Cập nhật lại thông tin trong session
                        session.setAttribute(CommonConst.SESSION_USER, currentUser);
                        logger.log(Level.INFO, "Profile name updated successfully");
                    } else {
                        session.setAttribute("errorMessage", "Failed to update profile information.");
                        response.sendRedirect(request.getContextPath() + "/user/profile");
                        return;
                    }
                }

                // Xử lý đổi mật khẩu nếu có
                if (currentPassword != null && !currentPassword.isEmpty()
                        && newPassword != null && !newPassword.isEmpty()
                        && confirmPassword != null && !confirmPassword.isEmpty()) {

                    logger.log(Level.INFO, "Password change requested for user ID: {0}", currentUser.getUser_id());

                    // Kiểm tra mật khẩu hiện tại
                    boolean isCurrentPasswordValid = userDAO.checkPassword(currentUser.getUser_id(), currentPassword);

                    if (!isCurrentPasswordValid) {
                        session.setAttribute("errorMessage", "Current password is incorrect.");
                        response.sendRedirect(request.getContextPath() + "/user/profile");
                        return;
                    }

                    // Kiểm tra mật khẩu mới và xác nhận mật khẩu
                    if (!newPassword.equals(confirmPassword)) {
                        session.setAttribute("errorMessage", "New password and confirmation do not match.");
                        response.sendRedirect(request.getContextPath() + "/user/profile");
                        return;
                    }

                    // Cập nhật mật khẩu mới
                    boolean updatePasswordSuccess = userDAO.updatePassword(currentUser.getUser_id(), newPassword);

                    if (!updatePasswordSuccess) {
                        session.setAttribute("errorMessage", "Failed to update password.");
                        response.sendRedirect(request.getContextPath() + "/user/profile");
                        return;
                    }

                    logger.log(Level.INFO, "Password updated successfully for user ID: {0}", currentUser.getUser_id());
                }

                // Thông báo thành công
                session.setAttribute("successMessage", "Profile updated successfully.");
            }
            case "log-out" -> {
                // Xử lý đăng xuất
                session.removeAttribute(CommonConst.SESSION_USER);
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            default -> {
                // Xử lý khi action không hợp lệ - chuyển hướng về trang profile
                logger.log(Level.WARNING, "Invalid action: {0}", action);
            }
        }

        response.sendRedirect(request.getContextPath() + "/user/profile");
    }
}
