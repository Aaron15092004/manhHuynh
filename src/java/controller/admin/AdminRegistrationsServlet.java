package controller.admin;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet xử lý danh sách đăng ký của người dùng cho Admin
 *
 * @author Admin
 */
public class AdminRegistrationsServlet extends HttpServlet {

    private final RegistrationDAO registrationDAO = new RegistrationDAO();
    private final UserDAO userDAO = new UserDAO();
    private final EventDAO eventDAO = new EventDAO();
    private final PaymentDAO paymentDAO = new PaymentDAO();

    private static final int ADMIN_ROLE_ID = 1;
    private static final Logger logger = Logger.getLogger(AdminRegistrationsServlet.class.getName());

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

        // Kiểm tra nếu không phải admin
        if (currentUser.getRole_id() != ADMIN_ROLE_ID) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        try {
            // Lấy tất cả các đăng ký
            List<Registration> allRegistrations = registrationDAO.findAll();

            // Lấy thông tin users
            List<User> allUsers = userDAO.findAll();
            Map<Integer, User> userMap = new HashMap<>();
            for (User user : allUsers) {
                userMap.put(user.getUser_id(), user);
            }

            // Lấy thông tin events
            List<Event> allEvents = eventDAO.findAll();
            Map<Integer, Event> eventMap = new HashMap<>();
            for (Event event : allEvents) {
                eventMap.put(event.getEvent_id(), event);
            }

            // Lấy thông tin payments
            List<Payment> allPayments = paymentDAO.findAll();
            Map<Integer, Payment> paymentMap = new HashMap<>();
            for (Payment payment : allPayments) {
                paymentMap.put(payment.getPayment_id(), payment);
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

            // Set attribute cho request
            request.setAttribute("registrations", allRegistrations);
            request.setAttribute("userMap", userMap);
            request.setAttribute("eventMap", eventMap);
            request.setAttribute("paymentMap", paymentMap);

            // Forward đến trang JSP
            request.getRequestDispatcher("/view/admin/registrations.jsp").forward(request, response);

        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Error processing registrations", ex);
            session.setAttribute("errorMessage", "Error loading registrations: " + ex.getMessage());
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        }
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

        // Kiểm tra nếu không phải admin
        if (currentUser.getRole_id() != ADMIN_ROLE_ID) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        // Get action
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");

        switch (action) {
            case "approve_payment" -> {
                try {
                    // Xử lý phê duyệt thanh toán
                    int paymentId = Integer.parseInt(request.getParameter("payment_id"));

                    // Cập nhật trạng thái thanh toán
                    boolean updateSuccess = paymentDAO.updateStatus(paymentId, "completed");

                    if (updateSuccess) {
                        session.setAttribute("successMessage", "Payment approved successfully!");
                    } else {
                        session.setAttribute("errorMessage", "Failed to approve payment.");
                    }
                } catch (Exception ex) {
                    logger.log(Level.SEVERE, "Error approving payment", ex);
                    session.setAttribute("errorMessage", "Error approving payment: " + ex.getMessage());
                }
            }
            case "reject_payment" -> {
                try {
                    // Xử lý từ chối thanh toán
                    int paymentId = Integer.parseInt(request.getParameter("payment_id"));

                    // Cập nhật trạng thái thanh toán
                    boolean updateSuccess = paymentDAO.updateStatus(paymentId, "failed");

                    if (updateSuccess) {
                        session.setAttribute("successMessage", "Payment rejected successfully!");
                    } else {
                        session.setAttribute("errorMessage", "Failed to reject payment.");
                    }
                } catch (Exception ex) {
                    logger.log(Level.SEVERE, "Error rejecting payment", ex);
                    session.setAttribute("errorMessage", "Error rejecting payment: " + ex.getMessage());
                }
            }
            case "log-out" -> {
                // Xử lý đăng xuất
                session.removeAttribute(CommonConst.SESSION_USER);
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            default -> {
                // Xử lý khi action không hợp lệ - chuyển hướng về trang registrations
                logger.log(Level.WARNING, "Invalid action: {0}", action);
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/registrations");
    }
}
