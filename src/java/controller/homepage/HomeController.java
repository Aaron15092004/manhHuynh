package controller.homepage;

import constant.CommonConst;
import dal.implement.CategoryDAO;
import dal.implement.EventDAO;
import dal.implement.TicketDAO;
import entity.Category;
import entity.Event;
import entity.PageControl;
import entity.Ticket;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


public class HomeController extends HttpServlet {

    private final EventDAO eventDAO = new EventDAO();
    private final CategoryDAO categoryDAO = new CategoryDAO();
    private final TicketDAO ticketDAO = new TicketDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PageControl pagecontrol = new PageControl();

        // Lấy danh sách không cần phân trang và lưu trong session
        List<Category> listCategory = categoryDAO.findAll();
        List<Ticket> listTicket = ticketDAO.findAll();

        // Lấy danh sách sự kiện có phân trang
        List<Event> listEvent = findEventDoGet(request, pagecontrol);

        // Lưu vào cả session và request
        HttpSession session = request.getSession();

        // Lưu các dữ liệu không phân trang vào session
        session.setAttribute("listCategory", listCategory);
        session.setAttribute("listTicket", listTicket);

        // Lưu dữ liệu có phân trang vào cả session và request 
        session.setAttribute("listEvent", listEvent);
        request.setAttribute("listEvent", listEvent);

        // Lưu thông tin phân trang vào request (vì phân trang thay đổi theo từng request)
        request.setAttribute("pageControl", pagecontrol);
        request.setAttribute("totalRecord", pagecontrol.getTotalRecord());

        // Forward đến view
        request.getRequestDispatcher("view/homepage/list-event.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("home");
    }

    private List<Event> findEventDoGet(HttpServletRequest request, PageControl pagecontrol) {
        //get ve Page
        String pageRaw = request.getParameter("page");
        //valid page
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (Exception e) {
            page = 1;
        }

        //get ve search
        String actionSearch = request.getParameter("search") == null
                ? "default"
                : request.getParameter("search");
        //get ve list event dao
        List<Event> listEvent;
        //get request URL
        String requestURL = request.getContextPath() + "/home";
        int totalRecord = 0;

        switch (actionSearch) {
            case "category" -> {
                String categoryId = request.getParameter("category_id");
                if (categoryId == null || categoryId.isEmpty()) {
                    // Khi chọn "All Category", áp dụng phân trang
                    totalRecord = eventDAO.findTotalRecord(); // Lấy tổng số record
                    listEvent = eventDAO.findAll(page); // Áp dụng phân trang
                    pagecontrol.setUrlPattern(requestURL + "?page=");
                } else {
                    // Khi chọn một category cụ thể
                    totalRecord = eventDAO.findTotalRecordByCategory(categoryId);
                    listEvent = eventDAO.findByCategory(categoryId, page);
                    pagecontrol.setUrlPattern(requestURL + "?category_id=" + categoryId + "&search=category&page=");
                }
            }
            case "searchByName" -> { // Xử lý tìm kiếm theo keyword
                String keyword = request.getParameter("keyword");
                if (keyword == null || keyword.trim().isEmpty()) {
                    // Khi không có keyword, hiển thị tất cả sự kiện với phân trang
                    totalRecord = eventDAO.findTotalRecord();
                    listEvent = eventDAO.findAll(page);
                    pagecontrol.setUrlPattern(requestURL + "?page=");
                } else {
                    // Khi có keyword, tìm kiếm theo keyword với phân trang
                    totalRecord = eventDAO.findTotalRecordByName(keyword);
                    listEvent = eventDAO.findByName(keyword.trim(), page);
                    pagecontrol.setUrlPattern(requestURL + "?keyword=" + keyword + "&search=searchByName&page=");
                }
            }
            case "combo" -> {
                String keyword = request.getParameter("keyword");
                String categoryId = request.getParameter("category_id");
                if ((keyword == null || keyword.isEmpty()) && (categoryId == null || categoryId.isEmpty())) {
                    // Khi không có cả keyword và category, hiển thị tất cả sự kiện với phân trang
                    totalRecord = eventDAO.findTotalRecord();
                    listEvent = eventDAO.findAll(page);
                    pagecontrol.setUrlPattern(requestURL + "?page=");
                } else {
                    // Khi có ít nhất một trong hai (keyword hoặc category)
                    totalRecord = eventDAO.findTotalRecordByCategoryAndName(categoryId, keyword);
                    listEvent = eventDAO.findByCategoryAndName(categoryId, keyword, page);
                    pagecontrol.setUrlPattern(requestURL + "?keyword=" + (keyword != null ? keyword : "")
                            + "&category_id=" + (categoryId != null ? categoryId : "")
                            + "&search=combo&page=");
                }
            }
            default -> {
                totalRecord = eventDAO.findTotalRecord();
                listEvent = eventDAO.findAll(page);
                pagecontrol.setUrlPattern(requestURL + "?page=");
            }
        }

        // Lưu thông tin phân trang
        int totalPage = (totalRecord % CommonConst.RECORD_PER_PAGE) == 0
                ? (totalRecord / CommonConst.RECORD_PER_PAGE)
                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;

        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);

        return listEvent;
    }
}
