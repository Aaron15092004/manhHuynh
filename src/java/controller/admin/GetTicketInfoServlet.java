package controller.admin;

import dal.implement.TicketDAO;
import entity.Ticket;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet để lấy thông tin vé theo ID sự kiện qua AJAX
 */
@WebServlet(name = "GetTicketInfoServlet", urlPatterns = {"/admin/get-ticket-info"})
public class GetTicketInfoServlet extends HttpServlet {

    private final TicketDAO ticketDAO = new TicketDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        StringBuilder jsonResponse = new StringBuilder();
        
        try {
            int eventId = Integer.parseInt(request.getParameter("event_id"));
            Ticket ticket = ticketDAO.findByEventId(eventId);
            
            jsonResponse.append("{");
            
            if (ticket != null) {
                jsonResponse.append("\"success\": true,");
                jsonResponse.append("\"price\": ").append(ticket.getPrice()).append(",");
                jsonResponse.append("\"available_quantity\": ").append(ticket.getAvailable_quantity()).append(",");
                jsonResponse.append("\"ticket_id\": ").append(ticket.getTicket_id());
            } else {
                jsonResponse.append("\"success\": false,");
                jsonResponse.append("\"message\": \"No ticket found for this event\"");
            }
            
            jsonResponse.append("}");
        } catch (NumberFormatException e) {
            jsonResponse.append("{");
            jsonResponse.append("\"success\": false,");
            jsonResponse.append("\"message\": \"Invalid event ID\"");
            jsonResponse.append("}");
        } catch (Exception e) {
            jsonResponse.append("{");
            jsonResponse.append("\"success\": false,");
            jsonResponse.append("\"message\": \"Error: ").append(e.getMessage().replace("\"", "\\\"")).append("\"");
            jsonResponse.append("}");
        }
        
        out.print(jsonResponse.toString());
        out.flush();
    }
}