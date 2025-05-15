package controller.admin;

import constant.CommonConst;
import dal.implement.CategoryDAO;
import dal.implement.EventDAO;
import dal.implement.TicketDAO;
import entity.Category;
import entity.Event;
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
 *
 * @author Admin
 */
public class DashboardServlet extends HttpServlet {

    private final EventDAO eventDAO = new EventDAO();
    private final CategoryDAO categoryDAO = new CategoryDAO();
    private final TicketDAO ticketDAO = new TicketDAO();  // Thêm TicketDAO
    private static final int ADMIN_ROLE_ID = 1;
    private static final int USER_ROLE_ID = 2;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute(CommonConst.SESSION_USER);

        // Kiểm tra người dùng đã đăng nhập chưa
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/authen");
            return;
        }

        List<Event> listEvent;

        // Admin xem tất cả sự kiện, User chỉ xem sự kiện của mình
        if (currentUser.getRole_id() == ADMIN_ROLE_ID) {
            listEvent = eventDAO.findAll();
        } else {
            // User thường chỉ xem sự kiện của mình
            listEvent = eventDAO.findByUserId(currentUser.getUser_id());
        }

        List<Category> listCategory = categoryDAO.findAll();

        // Tạo map lưu giá vé cho mỗi sự kiện
        Map<Integer, Double> ticketPriceMap = new HashMap<>();

        // Lấy giá vé cho từng sự kiện
        for (Event event : listEvent) {
            Ticket ticket = ticketDAO.findByEventId(event.getEvent_id());
            if (ticket != null) {
                ticketPriceMap.put(event.getEvent_id(), ticket.getPrice());
            } else {
                ticketPriceMap.put(event.getEvent_id(), 0.0); // Giá mặc định nếu không có vé
            }
        }

        // Hiển thị thông báo lỗi nếu có
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            session.removeAttribute("errorMessage"); // Xóa thông báo sau khi hiển thị
        }

        request.setAttribute("listEvent", listEvent);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("ticketMap", ticketPriceMap);

        // Chuyển sang trang dashboard
        request.getRequestDispatcher("../view/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
