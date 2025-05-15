package controller.homepage;

import dal.implement.EventDAO;
import dal.implement.TicketDAO;
import entity.Event;
import entity.Ticket;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EventDetailsController", urlPatterns = {"/event-details"})
public class EventDetailsController extends HttpServlet {

    private final EventDAO eventDAO = new EventDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy event_id từ request
            int event_id = Integer.parseInt(request.getParameter("id"));
            Event event = new Event(event_id);

            // Lấy thông tin sự kiện từ database
            Event eventFoundById = eventDAO.findById(event);

            // Lấy danh sách vé từ session (đã được thiết lập trong HomeController)
            HttpSession session = request.getSession();
            List<Ticket> listTicket = (List<Ticket>) session.getAttribute("listTicket");

            // Nếu listTicket không có trong session, tạo mới thông qua TicketDAO
            if (listTicket == null) {
                TicketDAO ticketDAO = new TicketDAO();
                listTicket = ticketDAO.findAll();
                session.setAttribute("listTicket", listTicket);
            }

            // Debug
            System.out.println("Event ID: " + event_id);
            System.out.println("Event Details: " + eventFoundById);
            System.out.println("Tickets list size: " + (listTicket != null ? listTicket.size() : 0));

            // Set attributes cho request
            request.setAttribute("eventDetails", eventFoundById);
            request.setAttribute("listTicket", listTicket);

            // Forward đến trang chi tiết sự kiện
            request.getRequestDispatcher("view/homepage/event-details.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            System.out.println("Error: Invalid event ID - " + e.getMessage());
            response.sendRedirect("home");
        } catch (Exception e) {
            System.out.println("Error in EventDetailsController: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
