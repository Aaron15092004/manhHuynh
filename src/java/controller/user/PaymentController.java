package controller.user;

import entity.Payment;
import entity.Registration;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;  // THÊM annotation WebServlet
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import constant.CommonConst;
import constant.SendMail;
import dal.implement.EventDAO;
import dal.implement.PaymentDAO;
import dal.implement.RegistrationDAO;
import dal.implement.TicketDAO;
import entity.Event;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/payment"})  // THÊM annotation WebServlet
public class PaymentController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(PaymentController.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // SỬA: Thêm đoạn code chuyển thông báo từ session sang request
        HttpSession session = request.getSession();

        if (session.getAttribute("errorMessage") != null) {
            request.setAttribute("errorMessage", session.getAttribute("errorMessage"));
            session.removeAttribute("errorMessage");
        }

        if (session.getAttribute("paymentSuccessMessage") != null) {
            request.setAttribute("paymentSuccessMessage", session.getAttribute("paymentSuccessMessage"));
            session.removeAttribute("paymentSuccessMessage");
        }

        request.getRequestDispatcher("view/user/Booking/booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {
            case "add-event" -> {
                addEvent(request, response);
            }
            case "change-quantity" -> {
                changeQuantity(request, response);
            }
            case "delete" -> {
                delete(request, response);
            }
            case "pay-now" -> {
                Payment cart = (Payment) request.getSession().getAttribute("cart");
                payNow(request, response);

                // Lấy thông tin user từ session
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute(CommonConst.SESSION_USER);

                // Kiểm tra user và thông tin giỏ hàng trước khi gửi email
                if (user != null && cart != null && !cart.getListRegistration().isEmpty()) {
                    String email = user.getEmail();
                    String name = user.getFull_name();

                    // Lưu danh sách đăng ký để gửi email chi tiết
                    List<Registration> registrations = new ArrayList<>(cart.getListRegistration());

                    // Tạo bản sao của payment để gửi trong email
                    Payment paymentCopy = new Payment();
                    paymentCopy.setAmount(cart.getAmount());
                    paymentCopy.setPaymentDate(cart.getPaymentDate());
                    paymentCopy.setStatus(cart.getStatus());
                    paymentCopy.setUser_id(cart.getUser_id());

                    // Gửi email xác nhận với thông tin chi tiết
                    SendMail sm = new SendMail();
                    sm.sendConfirmationEmail(email, name, paymentCopy, registrations);
                }
                return;
            }
            default ->
                throw new AssertionError();
        }
        response.sendRedirect("payment");
    }

    private void addEvent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //get ve session
        HttpSession session = request.getSession();
        //get ve Event id
        int eventId = Integer.parseInt(request.getParameter("event_id"));
        //get ve quantity
        int ticketQuantity = Integer.parseInt(request.getParameter("ticketQuantity"));
        //lay ve cart o tren session
        Payment cart = (Payment) session.getAttribute("cart");
        if (cart == null) {
            cart = new Payment();
        }
        Registration re = new Registration();
        re.setEvent_id(eventId);
        re.setTicket_quantity(ticketQuantity);

        //
        //them registration vao cart
        addRegistrationToPayment(re, cart);
        //set cart moi len sesson
        session.setAttribute("cart", cart);
    }

    private void addRegistrationToPayment(Registration re, Payment cart) {
        boolean isAdd = false;
        for (Registration obj : cart.getListRegistration()) {
            if (obj.getEvent_id() == re.getEvent_id()) {
                obj.setTicket_quantity(obj.getTicket_quantity() + re.getTicket_quantity());
                isAdd = true;
            }
        }
        if (isAdd == false) {
            cart.getListRegistration().add(re);
        }
    }

    private void changeQuantity(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try {
            //get ve event_id
            int eventId = Integer.parseInt(request.getParameter("event_id"));
            //get ve quantity
            int ticketQuantity = Integer.parseInt(request.getParameter("ticketQuantity"));

            //lay ve cart
            Payment cart = (Payment) session.getAttribute("cart");

            //thay doi quantity
            for (Registration obj : cart.getListRegistration()) {
                if (obj.getEvent_id() == eventId) {
                    obj.setTicket_quantity(ticketQuantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        //get ve event_id
        int eventId = Integer.parseInt(request.getParameter("event_id"));

        Payment cart = (Payment) session.getAttribute("cart");
        Registration re = null;
        for (Registration obj : cart.getListRegistration()) {
            if (obj.getEvent_id() == eventId) {
                re = obj;
            }
        }
        cart.getListRegistration().remove(re);
        session.setAttribute("cart", cart);
    }

    private void payNow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //lấy về cart
        HttpSession session = request.getSession();
        Payment cart = (Payment) session.getAttribute("cart");

        // Kiểm tra giỏ hàng
        if (cart == null || cart.getListRegistration() == null || cart.getListRegistration().isEmpty()) {
            // SỬA: Sử dụng session thay vì request
            session.setAttribute("errorMessage", "Your shopping cart is empty.");
            response.sendRedirect("payment");
            return;
        }

        //lấy về user_id
        User user = (User) session.getAttribute(CommonConst.SESSION_USER);
        if (user == null) {
            // SỬA: Sử dụng session thay vì request
            session.setAttribute("errorMessage", "You need to login to pay.");
            response.sendRedirect("payment");
            return;
        }

        int userId = user.getUser_id();

        // Lấy thông tin đầy đủ về sự kiện từ database thay vì phụ thuộc vào session
        TicketDAO ticketDAO = new TicketDAO();

        // Kiểm tra số lượng vé
        for (Registration reg : cart.getListRegistration()) {
            int availableQuantity = ticketDAO.getAvailableQuantityByEventId(reg.getEvent_id());
            if (reg.getTicket_quantity() > availableQuantity) {
                // SỬA: Sử dụng session thay vì request
                session.setAttribute("errorMessage", "The event is out of tickets. Please reduce the number of Ticket");
                response.sendRedirect("payment");
                return;
            }
        }

        //amount
        double amount = calculateTotalAmount(cart, ticketDAO);
        //set information
        cart.setUser_id(userId);
        cart.setAmount(amount);
        cart.setPaymentDate(Timestamp.valueOf(LocalDateTime.now()));
        cart.setStatus("completed");

        // Sử dụng transaction để đảm bảo tính nhất quán
        PaymentDAO paymentDAO = new PaymentDAO();
        RegistrationDAO reDAO = new RegistrationDAO();
        Connection conn = null;

        try {
            // Lấy connection và bắt đầu transaction
            conn = paymentDAO.getConnection();
            conn.setAutoCommit(false);

            // Insert payment
            int paymentId = paymentDAO.insertWithConnection(cart, conn);

            // Insert registrations và cập nhật số lượng vé
            for (Registration reg : cart.getListRegistration()) {
                reg.setPayment_id(paymentId);
                reg.setUser_id(userId);
                reDAO.insertWithConnection(reg, conn);

                // Cập nhật số lượng vé
                ticketDAO.updateAvailableQuantity(reg.getEvent_id(), reg.getTicket_quantity(), conn);
            }

            // Commit transaction
            conn.commit();

            // Xóa giỏ hàng
            session.removeAttribute("cart");

            // SỬA: Sử dụng session thay vì request
            session.setAttribute("paymentSuccessMessage", "Payment successful! Thank you for booking.");
            response.sendRedirect("payment");
            return;
        } catch (SQLException e) {
            e.printStackTrace();
            // Rollback nếu có lỗi
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                LOGGER.log(Level.SEVERE, "Lỗi khi rollback transaction", ex);
            }

            // SỬA: Sử dụng session thay vì request và thêm thông báo lỗi chi tiết
            session.setAttribute("errorMessage", "An error occurred during payment: " + e.getMessage());
            response.sendRedirect("payment");
            return;
        } finally {
            // Đóng connection
            try {
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Lỗi khi đóng connection", e);
            }
        }
    }

    // Phương thức mới để tính tổng số tiền dựa trên ticketDAO
    private double calculateTotalAmount(Payment cart, TicketDAO ticketDAO) {
        double amount = 0;
        for (Registration reg : cart.getListRegistration()) {
            // Lấy giá vé trực tiếp từ database thay vì từ danh sách sự kiện trong session
            double ticketPrice = ticketDAO.getTicketPriceByEventId(reg.getEvent_id());
            amount += (reg.getTicket_quantity() * ticketPrice);
        }
        return amount;
    }
}
