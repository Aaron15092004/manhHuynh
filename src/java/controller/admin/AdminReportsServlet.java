package controller.admin;

import constant.CommonConst;
import dal.implement.EventDAO;
import dal.implement.PaymentDAO;
import dal.implement.RegistrationDAO;
import dal.implement.UserDAO;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet xử lý báo cáo cho Admin
 *
 * @author Admin
 */
public class AdminReportsServlet extends HttpServlet {

    private final EventDAO eventDAO = new EventDAO();
    private final RegistrationDAO registrationDAO = new RegistrationDAO();
    private final UserDAO userDAO = new UserDAO();
    private final PaymentDAO paymentDAO = new PaymentDAO();

    private static final int ADMIN_ROLE_ID = 1;
    private static final Logger logger = Logger.getLogger(AdminReportsServlet.class.getName());

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
            // Tổng số lượng sự kiện
            int totalEvents = eventDAO.findTotalRecord();

            // Tổng số lượng người dùng
            int totalUsers = userDAO.findAll().size();

            // Tổng số lượng đăng ký
            int totalRegistrations = registrationDAO.findAll().size();

            // Tổng số lượng thanh toán theo trạng thái
            int completedPayments = 0;
            int pendingPayments = 0;
            int failedPayments = 0;

            // Tổng doanh thu
            double totalRevenue = 0.0;

            // Lấy danh sách payment và tính toán các chỉ số
            for (var payment : paymentDAO.findAll()) {
                String status = payment.getStatus();
                if ("completed".equalsIgnoreCase(status)) {
                    completedPayments++;
                    totalRevenue += payment.getAmount();
                } else if ("pending".equalsIgnoreCase(status)) {
                    pendingPayments++;
                } else if ("failed".equalsIgnoreCase(status)) {
                    failedPayments++;
                }
            }

            // Báo cáo sự kiện theo danh mục
            Map<String, Integer> eventsByCategory = new HashMap<>();
            // Tính toán thống kê theo danh mục (có thể implement sau)

            // Hiển thị thông báo lỗi nếu có
            String errorMessage = (String) session.getAttribute("errorMessage");
            if (errorMessage != null) {
                request.setAttribute("errorMessage", errorMessage);
                session.removeAttribute("errorMessage");
            }

            // Set attribute cho request
            request.setAttribute("totalEvents", totalEvents);
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalRegistrations", totalRegistrations);
            request.setAttribute("completedPayments", completedPayments);
            request.setAttribute("pendingPayments", pendingPayments);
            request.setAttribute("failedPayments", failedPayments);
            request.setAttribute("totalRevenue", totalRevenue);
            request.setAttribute("eventsByCategory", eventsByCategory);

            // Forward đến trang JSP
            request.getRequestDispatcher("/view/admin/reports.jsp").forward(request, response);

        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Error generating reports", ex);
            session.setAttribute("errorMessage", "Error generating reports: " + ex.getMessage());
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
            case "export_report" -> {
                // Xử lý xuất báo cáo (có thể implement sau)
                session.setAttribute("errorMessage", "Export report feature is not implemented yet.");
            }
            case "log-out" -> {
                // Xử lý đăng xuất
                session.removeAttribute(CommonConst.SESSION_USER);
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            default -> {
                // Xử lý khi action không hợp lệ - chuyển hướng về trang reports
                logger.log(Level.WARNING, "Invalid action: {0}", action);
            }
        }

        response.sendRedirect(request.getContextPath() + "/admin/reports");
    }
}
