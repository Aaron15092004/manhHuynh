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
 * Controller cho User Dashboard
 * @author YourName
 */
public class DashboardUserServlet extends HttpServlet {
    
    private final EventDAO eventDAO = new EventDAO();
    private final TicketDAO ticketDAO = new TicketDAO();
    private final RegistrationDAO registrationDAO = new RegistrationDAO();
    private final PaymentDAO paymentDAO = new PaymentDAO(); // Thêm PaymentDAO
    
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
            // Có thể chuyển hướng đến dashboard phù hợp với role
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            return;
        }
        
        // Lấy các thông tin cần thiết cho dashboard
        int userId = currentUser.getUser_id();
        
        // Lấy các sự kiện do user tạo
        List<Event> userEvents = eventDAO.findByUserId(userId);
        
        // Lấy các đăng ký của user
        List<Registration> userRegistrations = registrationDAO.findByUserId(userId);
        
        // Lấy tất cả payment của user
        List<Payment> userPayments = paymentDAO.findByUserId(userId);
        
        // Tạo map để lưu thông tin payment theo payment_id
        Map<Integer, Payment> paymentMap = new HashMap<>();
        for (Payment payment : userPayments) {
            paymentMap.put(payment.getPayment_id(), payment);
        }
        
        // Tạo map để lưu thông tin event theo event_id
        Map<Integer, Event> eventMap = new HashMap<>();
        for (Event event : userEvents) {
            eventMap.put(event.getEvent_id(), event);
        }
        
        // Tất cả event để hiển thị chi tiết registration
        List<Event> allEvents = eventDAO.findAll();
        for (Event event : allEvents) {
            if (!eventMap.containsKey(event.getEvent_id())) {
                eventMap.put(event.getEvent_id(), event);
            }
        }
        
        // Tính số lượng vé đã mua
        int totalTicketsPurchased = 0;
        for (Registration reg : userRegistrations) {
            totalTicketsPurchased += reg.getTicket_quantity();
        }
        
        // Lấy giá vé cho mỗi sự kiện
        Map<Integer, Double> ticketPriceMap = new HashMap<>();
        for (Event event : userEvents) {
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
        
        // Set attribute cho dashboard
        request.setAttribute("userEvents", userEvents);
        request.setAttribute("userRegistrations", userRegistrations);
        request.setAttribute("totalEvents", userEvents.size());
        request.setAttribute("totalRegistrations", userRegistrations.size());
        request.setAttribute("totalTickets", totalTicketsPurchased);
        request.setAttribute("ticketMap", ticketPriceMap);
        request.setAttribute("paymentMap", paymentMap);
        request.setAttribute("eventMap", eventMap);
        
        // Forward đến trang dashboard
        request.getRequestDispatcher("../view/user/dashboard/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý các action từ form trong dashboard nếu cần
        String action = request.getParameter("action");
        
        if (action != null) {
            switch (action) {
                case "update-profile":
                    // Xử lý cập nhật thông tin cá nhân
                    break;
                case "log-out":
                    // Xử lý đăng xuất
                    HttpSession session = request.getSession();
                    session.removeAttribute(CommonConst.SESSION_USER);
                    response.sendRedirect(request.getContextPath() + "/home");
                    return;
                default:
                    // Không có action hoặc action không hợp lệ
                    break;
            }
        }
        
        // Redirect lại trang dashboard
        response.sendRedirect(request.getContextPath() + "/user/dashboard");
    }
}