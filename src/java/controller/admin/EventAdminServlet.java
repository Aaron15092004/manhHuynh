package controller.admin;

import constant.CommonConst;
import java.sql.Timestamp;
import dal.implement.CategoryDAO;
import dal.implement.EventDAO;
import dal.implement.TicketDAO;
import entity.Event;
import entity.Ticket;
import entity.User;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class EventAdminServlet extends HttpServlet {

    private final EventDAO eventDAO = new EventDAO();
    private final CategoryDAO categoryDAO = new CategoryDAO();
    private final TicketDAO ticketDAO = new TicketDAO(); // Thêm TicketDAO
    private static final Logger logger = Logger.getLogger(EventAdminServlet.class.getName());
    private static final int ADMIN_ROLE_ID = 1;
    private static final int USER_ROLE_ID = 2;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        //get session
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute(CommonConst.SESSION_USER);

        // Kiểm tra nếu người dùng chưa đăng nhập
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        //get action
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {
            case "add" -> {
                try {
                    // User thường và Admin đều có quyền thêm sự kiện
                    addEvent(request, currentUser);
                } catch (ParseException ex) {
                    Logger.getLogger(EventAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            case "delete" -> {
                // Yêu cầu kiểm tra quyền trước khi xóa
                if (canModifyEvent(request, currentUser)) {
                    deleteEvent(request);
                } else {
                    session.setAttribute("errorMessage", "You don't have permission to delete this event");
                }
            }
            case "edit" -> {
                // Yêu cầu kiểm tra quyền trước khi sửa
                if (canModifyEvent(request, currentUser)) {
                    editEvent(request);
                } else {
                    session.setAttribute("errorMessage", "You don't have permission to edit this event");
                }
            }
            case "log-out" -> {
                // Xử lý đăng xuất
                session.removeAttribute(CommonConst.SESSION_USER); // Xóa thông tin người dùng khỏi session
                response.sendRedirect(request.getContextPath() + "/home"); // Chuyển hướng về trang chủ
                return; // Kết thúc phương thức sau khi chuyển hướng
            }
            default ->
                // Xử lý khi action không hợp lệ - chuyển hướng về dashboard
                logger.log(Level.WARNING, "Invalid action: {0}", action);
        }

        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }

    /**
     * Kiểm tra xem người dùng hiện tại có quyền sửa/xóa sự kiện hay không
     *
     * @param request HttpServletRequest
     * @param user Người dùng hiện tại
     * @return true nếu có quyền, false nếu không
     */
    private boolean canModifyEvent(HttpServletRequest request, User user) {
        try {
            int eventId = Integer.parseInt(request.getParameter("event_id"));
            Event event = eventDAO.getById(eventId);

            if (event == null) {
                return false;
            }

            // Admin có quyền sửa/xóa tất cả sự kiện
            if (user.getRole_id() == ADMIN_ROLE_ID) {
                return true;
            }

            // User thường chỉ có quyền sửa/xóa sự kiện do họ tạo
            return user.getRole_id() == USER_ROLE_ID && event.getUser_id() == user.getUser_id();
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid event_id parameter", e);
            return false;
        }
    }

    private void addEvent(HttpServletRequest request, User currentUser) throws ParseException {
        try {
            //get title
            String title = request.getParameter("title");
            //get description
            String description = request.getParameter("description");
            //get location
            String location = request.getParameter("location");
            // Lấy giá trị từ form
            String eventDateStr = request.getParameter("event_date");

            // Kiểm tra giá trị eventDateStr
            if (eventDateStr == null || eventDateStr.isEmpty()) {
                throw new IllegalArgumentException("Event date cannot be null or empty");
            }
            // Định dạng của chuỗi nhận được từ input datetime-local
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            // Chuyển đổi chuỗi thành java.util.Date
            java.util.Date utilDate = dateFormat.parse(eventDateStr);
            // Chuyển đổi java.util.Date thành java.sql.Timestamp
            Timestamp eventDate = new Timestamp(utilDate.getTime());

            //get max attendees
            int maxAttendees = Integer.parseInt(request.getParameter("maxAttendees"));
            //get category
            int categoryId = Integer.parseInt(request.getParameter("category"));
            //get ticket price
            double ticketPrice;
            try {
                ticketPrice = Double.parseDouble(request.getParameter("ticketPrice"));
                if (ticketPrice < 0) {
                    throw new IllegalArgumentException("Ticket price cannot be negative");
                }
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid ticket price");
            }

            //image
            Part part = request.getPart("image");

            String pathOfFile = saveImage(request, part);

            // Tạo đối tượng Event và gán giá trị
            Event event = new Event();
            event.setTitle(title);
            event.setDescription(description);
            event.setLocation(location);
            event.setEvent_date(eventDate);
            event.setMax_attendees(maxAttendees);
            event.setCategory_id(categoryId);
            event.setImage(pathOfFile);

            // Luôn set user_id của người đang đăng nhập
            event.setUser_id(currentUser.getUser_id());

            // Thêm event vào database và lấy event_id
            int eventId = eventDAO.insert(event);

            // Nếu eventId = 0 nhưng event đã được thêm vào DB, lấy ID mới nhất
            if (eventId == 0) {
                // Tìm event_id của event vừa thêm vào dựa trên thông tin của event
                Event newEvent = eventDAO.findByTitleAndDate(event.getTitle(), event.getEvent_date());
                if (newEvent != null) {
                    eventId = newEvent.getEvent_id();
                    System.out.println("Found event with ID: " + eventId);
                }
            }

            // Nếu thêm event thành công, tạo ticket với available_quantity = max_attendees
            if (eventId > 0) {
                Ticket ticket = new Ticket();
                ticket.setEvent_id(eventId);
                ticket.setPrice(ticketPrice);

                // Đảm bảo thiết lập available_quantity bằng maxAttendees
                ticket.setAvailable_quantity(maxAttendees);

                int ticketId = ticketDAO.insert(ticket);
                logger.log(Level.INFO, "Ticket inserted with ID: {0} for event: {1}, available quantity: {2}",
                        new Object[]{ticketId, eventId, maxAttendees});

                if (ticketId <= 0) {
                    logger.log(Level.WARNING, "Ticket insert might have failed. TicketID: {0}", ticketId);
                }
            }

        } catch (NumberFormatException | IOException | ServletException ex) {
            logger.log(Level.SEVERE, "Lỗi khi thêm sự kiện", ex);
        }
    }

    private void deleteEvent(HttpServletRequest request) {
        try {
            //get id
            int event_id = Integer.parseInt(request.getParameter("event_id"));

            // Ghi log thông tin xóa
            logger.info("Deleting event with ID: " + event_id);

            // Xóa event - các ticket sẽ tự động bị xóa theo do ràng buộc ON DELETE CASCADE
            eventDAO.deleteById(event_id);

            logger.info("Event and related tickets deleted successfully");
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Error parsing event_id for deletion", e);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error deleting event", e);
        }
    }

    private void editEvent(HttpServletRequest request) {
        try {
            // Lấy event_id 
            int eventId = Integer.parseInt(request.getParameter("event_id"));

            // Lấy thông tin event hiện tại trước để giữ nguyên user_id
            Event currentEvent = eventDAO.getById(eventId);
            if (currentEvent == null) {
                logger.log(Level.SEVERE, "Không tìm thấy event với ID: " + eventId);
                return;
            }

            // Lấy thông tin khác từ form
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            // Lấy giá trị từ form
            String eventDateStr = request.getParameter("event_date");

            // Kiểm tra giá trị eventDateStr
            if (eventDateStr == null || eventDateStr.isEmpty()) {
                throw new IllegalArgumentException("Event date cannot be null or empty");
            }
            // Định dạng của chuỗi nhận được từ input datetime-local
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            // Chuyển đổi chuỗi thành java.util.Date
            java.util.Date utilDate = dateFormat.parse(eventDateStr);
            // Chuyển đổi java.util.Date thành java.sql.Timestamp
            Timestamp eventDate = new Timestamp(utilDate.getTime());

            // Lấy max attendees
            int maxAttendees = Integer.parseInt(request.getParameter("maxAttendees"));
            // Lấy category
            int categoryId = Integer.parseInt(request.getParameter("category"));
            // Lấy ticket price
            BigDecimal ticketPrice = new BigDecimal(request.getParameter("ticketPrice"));

            // Xử lý image
            Part part = request.getPart("image");
            String imagePath = null;

            if (part == null || part.getSize() == 0 || part.getSubmittedFileName() == null
                    || part.getSubmittedFileName().trim().isEmpty()) {
                // Lấy đường dẫn ảnh hiện tại từ request
                imagePath = request.getParameter("currentImage");

                // Kiểm tra nếu currentImage là null hoặc rỗng, thì dùng ảnh từ event hiện tại
                if (imagePath == null || imagePath.trim().isEmpty()) {
                    imagePath = currentEvent.getImage();
                    logger.info("Using image from current event: " + imagePath);
                }

                logger.info("Keeping current image: " + imagePath);
            } else {
                // Tải lên hình ảnh mới
                imagePath = saveImage(request, part);
                logger.info("Uploaded new image: " + imagePath);
            }

// Double-check: Nếu imagePath vẫn null hoặc rỗng, dùng ảnh hiện tại
            if (imagePath == null || imagePath.trim().isEmpty()) {
                imagePath = currentEvent.getImage();
                logger.info("Fallback to current event image: " + imagePath);
            }

            // Tạo đối tượng Event và gán giá trị
            Event event = new Event();
            event.setEvent_id(eventId);
            event.setTitle(title);
            event.setDescription(description);
            event.setLocation(location);
            event.setEvent_date(eventDate);
            event.setMax_attendees(maxAttendees);
            event.setCategory_id(categoryId);
            event.setImage(imagePath);

            // GIỮ NGUYÊN user_id từ event hiện tại
            event.setUser_id(currentEvent.getUser_id());

            // Log trước khi cập nhật để kiểm tra
            logger.info("Updating event with ID: " + eventId + ", title: " + title + ", user_id: " + event.getUser_id());

            // Cập nhật event
            boolean updateSuccess = eventDAO.update(event);
            if (!updateSuccess) {
                logger.severe("Failed to update event with ID: " + eventId);
                return;
            }

            logger.info("Event updated successfully");

            // Cập nhật ticket
            Ticket ticket = ticketDAO.findByEventId(eventId);
            if (ticket != null) {
                ticket.setPrice(ticketPrice.doubleValue());
                ticket.setAvailable_quantity(maxAttendees);
                ticketDAO.update(ticket);
                logger.info("Ticket updated successfully");
            } else {
                // Nếu chưa có ticket, tạo mới
                Ticket newTicket = new Ticket();
                newTicket.setEvent_id(eventId);
                newTicket.setPrice(ticketPrice.doubleValue());
                newTicket.setAvailable_quantity(maxAttendees);
                ticketDAO.insert(newTicket);
                logger.info("New ticket created for event ID: " + eventId);
            }

        } catch (NumberFormatException ex) {
            logger.log(Level.SEVERE, "Error parsing number: " + ex.getMessage(), ex);
        } catch (IOException ex) {
            logger.log(Level.SEVERE, "IO Error: " + ex.getMessage(), ex);
        } catch (ServletException ex) {
            logger.log(Level.SEVERE, "Servlet Error: " + ex.getMessage(), ex);
        } catch (ParseException ex) {
            logger.log(Level.SEVERE, "Parse Error: " + ex.getMessage(), ex);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Unexpected Error: " + ex.getMessage(), ex);
        }
    }

    /**
     * Lưu hình ảnh từ Part upload vào cả thư mục build và project
     *
     * @param request HttpServletRequest
     * @param part Part chứa file hình ảnh
     * @return Đường dẫn tương đối đến hình ảnh để lưu vào database
     * @throws IOException Nếu có lỗi khi lưu file
     */
    private String saveImage(HttpServletRequest request, Part part) throws IOException {
        if (part == null || part.getSize() == 0 || part.getSubmittedFileName() == null
                || part.getSubmittedFileName().trim().isEmpty()) {
            return null;
        }

        // Lấy đường dẫn thư mục lưu ảnh từ ServletContext
        ServletContext context = request.getServletContext();
        String buildUploadPath = (String) context.getAttribute("UPLOAD_DIR_PATH");
        String projectUploadPath = (String) context.getAttribute("PROJECT_UPLOAD_DIR_PATH");
        String uploadDirUrl = (String) context.getAttribute("UPLOAD_DIR_URL");

        // Kiểm tra nếu các đường dẫn chưa được khởi tạo (trường hợp WebAppInitializer chưa chạy)
        if (buildUploadPath == null || projectUploadPath == null || uploadDirUrl == null) {
            logger.warning("Upload paths not initialized in ServletContext, using fallback paths");

            // Đường dẫn fallback
            String webRootPath = request.getServletContext().getRealPath("/");
            buildUploadPath = webRootPath + "uploads/event_images/";

            // Tìm đường dẫn project
            String projectPath = System.getProperty("user.dir");
            projectUploadPath = projectPath + "/web/uploads/event_images/";
            uploadDirUrl = "/uploads/event_images";

            // Đảm bảo thư mục tồn tại
            Files.createDirectories(Paths.get(buildUploadPath));
            Files.createDirectories(Paths.get(projectUploadPath));
        }

        // Lấy thông tin về file gốc
        String originalFileName = part.getSubmittedFileName();

        // Tạo tên file duy nhất với timestamp
        String fileExtension = originalFileName.contains(".")
                ? originalFileName.substring(originalFileName.lastIndexOf("."))
                : "";
        String fileName = System.currentTimeMillis() + fileExtension;

        // Đường dẫn đầy đủ đến file trong thư mục build và project
        Path buildFilePath = Paths.get(buildUploadPath, fileName);
        Path projectFilePath = Paths.get(projectUploadPath, fileName);

        // Lưu file vào thư mục build (đang chạy)
        try (InputStream inputStream = part.getInputStream()) {
            Files.copy(inputStream, buildFilePath, StandardCopyOption.REPLACE_EXISTING);
            logger.info("Saved image to build path: " + buildFilePath);
        }

        // Sao chép file vào thư mục project (để không bị mất khi clean)
        try {
            Files.copy(buildFilePath, projectFilePath, StandardCopyOption.REPLACE_EXISTING);
            logger.info("Copied image to project path: " + projectFilePath);
        } catch (IOException e) {
            logger.log(Level.WARNING, "Failed to copy image to project directory", e);
            // Vẫn tiếp tục vì ảnh đã được lưu trong thư mục build
        }

        // Trả về đường dẫn tương đối để lưu vào database
        return uploadDirUrl + "/" + fileName;
    }
}
