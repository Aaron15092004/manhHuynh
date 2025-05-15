package controller.homepage;

import constant.CommonConst;
import dal.implement.CategoryDAO;
import dal.implement.EventDAO;
import dal.implement.TicketDAO;
import entity.Category;
import entity.Event;
import entity.Ticket;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeIndex", urlPatterns = {"/homeIndex"})
public class HomeIndex extends HttpServlet {
    
    private final EventDAO eventDAO = new EventDAO();
    private final CategoryDAO categoryDAO = new CategoryDAO();
    private final TicketDAO ticketDAO = new TicketDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy dữ liệu - tương tự như trong HomeController
            List<Event> listEvent = eventDAO.findAll();
            List<Category> listCategory = categoryDAO.findAll();
            List<Ticket> listTicket = ticketDAO.findAll();
            
            // In thông tin debug
            System.out.println("HomeIndex: Found " + listEvent.size() + " events");
            
            // Lưu vào session (sử dụng cùng tên với HomeController)
            request.getSession().setAttribute(CommonConst.SESSION_EVENT, listEvent);
            request.getSession().setAttribute(CommonConst.SESSION_CATEGORY, listCategory);
            request.getSession().setAttribute("listTicket", listTicket);
            
            // Forward đến JSP
            request.getRequestDispatcher("view/homepage/home.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("Error in HomeIndex: " + e.getMessage());
            e.printStackTrace();
            // Chuyển hướng đến trang chính nếu có lỗi
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}