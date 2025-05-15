package controller.user;

import constant.CommonConst;
import dal.implement.EventDAO;
import dal.implement.PaymentDAO;
import dal.implement.RegistrationDAO;
import dal.implement.TicketDAO;
import entity.Event;
import entity.Payment;
import entity.Registration;
import entity.Ticket;
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

/**
 * Servlet để xử lý các ticket của người dùng
 * @author YourName
 */
public class UserTicketServlet extends HttpServlet {
    
    private final EventDAO eventDAO = new EventDAO();
    private final TicketDAO ticketDAO = new TicketDAO();
    private final RegistrationDAO registrationDAO = new RegistrationDAO();
    private final PaymentDAO paymentDAO = new PaymentDAO();
    
    private static final int USER_ROLE_ID = 2;

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
        
        // Lấy danh sách đăng ký của user
        int userId = currentUser.getUser_id();
        List<Registration> userRegistrations = registrationDAO.findByUserId(userId);
        
        // Lấy tất cả payment của user
        List<Payment> userPayments = paymentDAO.findByUserId(userId);
        
        // Tạo map để lưu thông tin payment theo payment_id
        Map<Integer, Payment> paymentMap = new HashMap<>();
        for (Payment payment : userPayments) {
            paymentMap.put(payment.getPayment_id(), payment);
        }
        
        // Lấy tất cả event để hiển thị thông tin chi tiết
        List<Event> allEvents = eventDAO.findAll();
        Map<Integer, Event> eventMap = new HashMap<>();
        for (Event event : allEvents) {
            eventMap.put(event.getEvent_id(), event);
        }
        
        // Lấy giá vé cho mỗi sự kiện
        Map<Integer, Double> ticketPriceMap = new HashMap<>();
        for (Event event : allEvents) {
            Ticket ticket = ticketDAO.findByEventId(event.getEvent_id());
            if (ticket != null) {
                ticketPriceMap.put(event.getEvent_id(), ticket.getPrice());
            } else {
                ticketPriceMap.put(event.getEvent_id(), 0.0);
            }
        }
        
        // Hiển thị thông báo lỗi nếu có
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            session.removeAttribute("errorMessage");
        }
        
        // Set attribute cho request
        request.setAttribute("userRegistrations", userRegistrations);
        request.setAttribute("paymentMap", paymentMap);
        request.setAttribute("eventMap", eventMap);
        request.setAttribute("ticketMap", ticketPriceMap);
        
        // Forward đến trang my-tickets.jsp
        request.getRequestDispatcher("../view/user/dashboard/my-tickets.jsp").forward(request, response);
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
            case "log-out" -> {
                // Xử lý đăng xuất
                session.removeAttribute(CommonConst.SESSION_USER);
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            default -> {
                // Xử lý khi action không hợp lệ - chuyển hướng về trang tickets
                System.out.println("Invalid action: " + action);
            }
        }
        
        response.sendRedirect(request.getContextPath() + "/user/tickets");
    }
}