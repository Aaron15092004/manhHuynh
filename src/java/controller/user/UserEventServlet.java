package controller.user;

import constant.CommonConst;
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
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet để xử lý các event của người dùng
 *
 * @author YourName
 */
@MultipartConfig
public class UserEventServlet extends HttpServlet {

    private final EventDAO eventDAO = new EventDAO();
    private final CategoryDAO categoryDAO = new CategoryDAO();
    private final TicketDAO ticketDAO = new TicketDAO();

    private static final int USER_ROLE_ID = 2;
    private static final Logger logger = Logger.getLogger(UserEventServlet.class.getName());

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

        // Lấy danh sách sự kiện của user
        int userId = currentUser.getUser_id();
        List<Event> userEvents = eventDAO.findByUserId(userId);
        List<entity.Category> listCategory = categoryDAO.findAll();

        // Tạo map lưu giá vé cho mỗi sự kiện
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

        // Hiển thị thông báo thành công nếu có
        String successMessage = (String) session.getAttribute("successMessage");
        if (successMessage != null) {
            request.setAttribute("successMessage", successMessage);
            session.removeAttribute("successMessage");
        }

        // Set attribute cho request
        request.setAttribute("userEvents", userEvents);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("ticketMap", ticketPriceMap);

        // Forward đến trang my-events.jsp
        request.getRequestDispatcher("../view/user/dashboard/my-events.jsp").forward(request, response);
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
            case "add" -> {
                try {
                    // Xử lý thêm sự kiện
                    addEvent(request, currentUser);
                    session.setAttribute("successMessage", "Event added successfully!");
                } catch (ParseException ex) {
                    logger.log(Level.SEVERE, "Error parsing date: {0}", ex.getMessage());
                    session.setAttribute("errorMessage", "Error adding event: " + ex.getMessage());
                } catch (Exception ex) {
                    logger.log(Level.SEVERE, "Unexpected error: {0}", ex.getMessage());
                    session.setAttribute("errorMessage", "Error adding event: " + ex.getMessage());
                }
            }
            case "edit" -> {
                try {
                    // Kiểm tra quyền trước khi sửa
                    if (canModifyEvent(request, currentUser)) {
                        editEvent(request);
                        session.setAttribute("successMessage", "Event updated successfully!");
                    } else {
                        session.setAttribute("errorMessage", "You don't have permission to edit this event");
                    }
                } catch (ParseException ex) {
                    logger.log(Level.SEVERE, "Error parsing date: {0}", ex.getMessage());
                    session.setAttribute("errorMessage", "Error updating event: " + ex.getMessage());
                } catch (Exception ex) {
                    logger.log(Level.SEVERE, "Unexpected error: {0}", ex.getMessage());
                    session.setAttribute("errorMessage", "Error updating event: " + ex.getMessage());
                }
            }
            case "delete" -> {
                try {
                    // Kiểm tra quyền trước khi xóa
                    if (canModifyEvent(request, currentUser)) {
                        deleteEvent(request);
                        session.setAttribute("successMessage", "Event deleted successfully!");
                    } else {
                        session.setAttribute("errorMessage", "You don't have permission to delete this event");
                    }
                } catch (Exception ex) {
                    logger.log(Level.SEVERE, "Error deleting event: {0}", ex.getMessage());
                    session.setAttribute("errorMessage", "Error deleting event: " + ex.getMessage());
                }
            }
            case "log-out" -> {
                // Xử lý đăng xuất
                session.removeAttribute(CommonConst.SESSION_USER);
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            default -> {
                // Xử lý khi action không hợp lệ - chuyển hướng về trang sự kiện
                logger.log(Level.WARNING, "Invalid action: {0}", action);
            }
        }

        response.sendRedirect(request.getContextPath() + "/user/events");
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
                logger.log(Level.WARNING, "Event with ID {0} not found", eventId);
                return false;
            }

            // User thường chỉ có quyền sửa/xóa sự kiện do họ tạo
            boolean canModify = event.getUser_id() == user.getUser_id();

            if (!canModify) {
                logger.log(Level.WARNING, "User {0} attempted to modify event {1} belonging to user {2}",
                        new Object[]{user.getUser_id(), eventId, event.getUser_id()});
            }

            return canModify;
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid event_id parameter", e);
            return false;
        }
    }

    private void addEvent(HttpServletRequest request, User currentUser) throws ParseException {
        try {
            // Get title
            String title = request.getParameter("title");
            if (title == null || title.trim().isEmpty()) {
                throw new IllegalArgumentException("Title cannot be empty");
            }

            // Get description
            String description = request.getParameter("description");

            // Get location
            String location = request.getParameter("location");
            if (location == null || location.trim().isEmpty()) {
                throw new IllegalArgumentException("Location cannot be empty");
            }

            // Get event date
            String eventDateStr = request.getParameter("event_date");
            if (eventDateStr == null || eventDateStr.isEmpty()) {
                throw new IllegalArgumentException("Event date cannot be empty");
            }

            // Parse date using the correct format (yyyy-MM-dd'T'HH:mm)
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            java.util.Date utilDate = dateFormat.parse(eventDateStr);
            Timestamp eventDate = new Timestamp(utilDate.getTime());

            // Log the parsed date for troubleshooting
            logger.log(Level.INFO, "Parsed date: {0} from input: {1}", new Object[]{eventDate, eventDateStr});

            // Get max attendees
            int maxAttendees;
            try {
                maxAttendees = Integer.parseInt(request.getParameter("maxAttendees"));
                if (maxAttendees <= 0) {
                    throw new IllegalArgumentException("Max attendees must be positive");
                }
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid max attendees value");
            }

            // Get category
            int categoryId;
            try {
                categoryId = Integer.parseInt(request.getParameter("category"));
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid category");
            }

            // Get ticket price
            double ticketPrice;
            try {
                ticketPrice = Double.parseDouble(request.getParameter("ticketPrice"));
                if (ticketPrice < 0) {
                    throw new IllegalArgumentException("Ticket price cannot be negative");
                }
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid ticket price");
            }

            // Get image part
            Part imagePart = request.getPart("image");
            if (imagePart == null || imagePart.getSize() == 0 || imagePart.getSubmittedFileName() == null
                    || imagePart.getSubmittedFileName().trim().isEmpty()) {
                throw new IllegalArgumentException("Event image is required");
            }

            // Save image
            String imagePath = saveImage(request, imagePart);
            if (imagePath == null || imagePath.trim().isEmpty()) {
                throw new IllegalArgumentException("Failed to save image");
            }

            // Create Event object
            Event event = new Event();
            event.setTitle(title);
            event.setDescription(description);
            event.setLocation(location);
            event.setEvent_date(eventDate);
            event.setMax_attendees(maxAttendees);
            event.setCategory_id(categoryId);
            event.setImage(imagePath);
            event.setUser_id(currentUser.getUser_id());

            // Insert event to database
            int eventId = eventDAO.insert(event);
            logger.log(Level.INFO, "Event inserted with ID: {0}", eventId);

            // If insert returned 0 but event might still be inserted
            if (eventId == 0) {
                Event newEvent = eventDAO.findByTitleAndDate(event.getTitle(), event.getEvent_date());
                if (newEvent != null) {
                    eventId = newEvent.getEvent_id();
                    logger.log(Level.INFO, "Found event with ID: {0}", eventId);
                } else {
                    throw new RuntimeException("Failed to create event or retrieve event ID");
                }
            }

            // Create ticket for the event
            if (eventId > 0) {
                Ticket ticket = new Ticket();
                ticket.setEvent_id(eventId);
                ticket.setPrice(ticketPrice);
                ticket.setAvailable_quantity(maxAttendees);

                int ticketId = ticketDAO.insert(ticket);
                logger.log(Level.INFO, "Ticket inserted with ID: {0} for event: {1}", new Object[]{ticketId, eventId});

                if (ticketId <= 0) {
                    logger.log(Level.WARNING, "Ticket insert might have failed. TicketID: {0}", ticketId);
                }
            } else {
                logger.log(Level.SEVERE, "Invalid event ID: {0}. Cannot create ticket.", eventId);
                throw new RuntimeException("Failed to get valid event ID for ticket creation");
            }

        } catch (IOException | ServletException ex) {
            logger.log(Level.SEVERE, "Error during file upload: {0}", ex.getMessage());
            throw new RuntimeException("Error uploading image: " + ex.getMessage(), ex);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Unexpected error in addEvent: {0}", ex.getMessage());
            throw ex; // Re-throw to be handled by the caller
        }
    }

    private void deleteEvent(HttpServletRequest request) {
        try {
            // Get event ID
            int eventId = Integer.parseInt(request.getParameter("event_id"));
            if (eventId <= 0) {
                throw new IllegalArgumentException("Invalid event ID");
            }

            logger.log(Level.INFO, "Deleting event with ID: {0}", eventId);

            // Kiểm tra xem event có tồn tại không trước khi xóa
            Event eventToDelete = eventDAO.getById(eventId);
            if (eventToDelete == null) {
                logger.log(Level.WARNING, "Event with ID {0} not found, cannot delete", eventId);
                throw new RuntimeException("Event not found");
            }

            // Xóa event (tickets sẽ bị xóa cascade)
            eventDAO.deleteById(eventId);

            // Kiểm tra sau khi xóa
            Event checkEvent = eventDAO.getById(eventId);
            if (checkEvent != null) {
                logger.log(Level.WARNING, "Event still exists after deletion attempt. Event ID: {0}", eventId);
                throw new RuntimeException("Failed to delete event");
            } else {
                logger.log(Level.INFO, "Event with ID {0} successfully deleted", eventId);
            }

        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Error parsing event_id for deletion", e);
            throw new RuntimeException("Invalid event ID format");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error deleting event", e);
            throw new RuntimeException("Error deleting event: " + e.getMessage());
        }
    }

    private void editEvent(HttpServletRequest request) throws ParseException {
        try {
            // Get event ID
            int eventId = Integer.parseInt(request.getParameter("event_id"));
            if (eventId <= 0) {
                throw new IllegalArgumentException("Invalid event ID");
            }

            // Get current event to preserve user_id
            Event currentEvent = eventDAO.getById(eventId);
            if (currentEvent == null) {
                logger.log(Level.SEVERE, "Event with ID {0} not found", eventId);
                throw new RuntimeException("Event not found");
            }

            // Get title
            String title = request.getParameter("title");
            if (title == null || title.trim().isEmpty()) {
                throw new IllegalArgumentException("Title cannot be empty");
            }

            // Get description
            String description = request.getParameter("description");

            // Get location
            String location = request.getParameter("location");
            if (location == null || location.trim().isEmpty()) {
                throw new IllegalArgumentException("Location cannot be empty");
            }

            // Get event date
            String eventDateStr = request.getParameter("event_date");
            if (eventDateStr == null || eventDateStr.isEmpty()) {
                throw new IllegalArgumentException("Event date cannot be empty");
            }

            // Parse date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            java.util.Date utilDate = dateFormat.parse(eventDateStr);
            Timestamp eventDate = new Timestamp(utilDate.getTime());

            // Get max attendees
            int maxAttendees;
            try {
                maxAttendees = Integer.parseInt(request.getParameter("maxAttendees"));
                if (maxAttendees <= 0) {
                    throw new IllegalArgumentException("Max attendees must be positive");
                }
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid max attendees value");
            }

            // Get category
            int categoryId;
            try {
                categoryId = Integer.parseInt(request.getParameter("category"));
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid category");
            }

            // Get ticket price
            double ticketPrice;
            try {
                ticketPrice = Double.parseDouble(request.getParameter("ticketPrice"));
                if (ticketPrice < 0) {
                    throw new IllegalArgumentException("Ticket price cannot be negative");
                }
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid ticket price");
            }

            // Check if a new image was uploaded
            Part imagePart = request.getPart("image");
            String imagePath = null;

            if (imagePart == null || imagePart.getSize() == 0 || imagePart.getSubmittedFileName() == null
                    || imagePart.getSubmittedFileName().trim().isEmpty()) {
                // No new image uploaded, use current image
                imagePath = request.getParameter("currentImage");

                // If currentImage is null or empty, use image from current event
                if (imagePath == null || imagePath.trim().isEmpty()) {
                    imagePath = currentEvent.getImage();
                    logger.log(Level.INFO, "Using image from current event: {0}", imagePath);
                }
            } else {
                // New image uploaded, save it
                imagePath = saveImage(request, imagePart);
                logger.log(Level.INFO, "Uploaded new image: {0}", imagePath);
            }

            // Double-check image path
            if (imagePath == null || imagePath.trim().isEmpty()) {
                imagePath = currentEvent.getImage();
                logger.log(Level.INFO, "Fallback to current event image: {0}", imagePath);
            }

            // Create Event object for update
            Event event = new Event();
            event.setEvent_id(eventId);
            event.setTitle(title);
            event.setDescription(description);
            event.setLocation(location);
            event.setEvent_date(eventDate);
            event.setMax_attendees(maxAttendees);
            event.setCategory_id(categoryId);
            event.setImage(imagePath);

            // KEEP the original user_id
            event.setUser_id(currentEvent.getUser_id());

            // Log update info
            logger.log(Level.INFO, "Updating event with ID: {0}, title: {1}, user_id: {2}",
                    new Object[]{eventId, title, event.getUser_id()});

            // Update event
            boolean updateSuccess = eventDAO.update(event);
            if (!updateSuccess) {
                logger.log(Level.SEVERE, "Failed to update event with ID: {0}", eventId);
                throw new RuntimeException("Failed to update event");
            }

            logger.log(Level.INFO, "Event updated successfully");

            // Update or create ticket
            Ticket ticket = ticketDAO.findByEventId(eventId);
            if (ticket != null) {
                // Update existing ticket
                ticket.setPrice(ticketPrice);
                ticket.setAvailable_quantity(maxAttendees);
                boolean ticketUpdateSuccess = ticketDAO.update(ticket);
                if (ticketUpdateSuccess) {
                    logger.log(Level.INFO, "Ticket updated successfully for event ID: {0}", eventId);
                } else {
                    logger.log(Level.WARNING, "Failed to update ticket for event ID: {0}", eventId);
                }
            } else {
                // Create new ticket if none exists
                Ticket newTicket = new Ticket();
                newTicket.setEvent_id(eventId);
                newTicket.setPrice(ticketPrice);
                newTicket.setAvailable_quantity(maxAttendees);
                int ticketId = ticketDAO.insert(newTicket);
                if (ticketId > 0) {
                    logger.log(Level.INFO, "New ticket created for event ID: {0}", eventId);
                } else {
                    logger.log(Level.WARNING, "Failed to create new ticket for event ID: {0}", eventId);
                }
            }

        } catch (NumberFormatException ex) {
            logger.log(Level.SEVERE, "Error parsing number: {0}", ex.getMessage());
            throw new RuntimeException("Invalid number format: " + ex.getMessage());
        } catch (IOException | ServletException ex) {
            logger.log(Level.SEVERE, "Error processing request: {0}", ex.getMessage());
            throw new RuntimeException("Error processing request: " + ex.getMessage());
        } catch (ParseException ex) {
            logger.log(Level.SEVERE, "Error parsing date: {0}", ex.getMessage());
            throw ex;
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Unexpected error: {0}", ex.getMessage());
            throw new RuntimeException("Unexpected error: " + ex.getMessage());
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

        // Kiểm tra nếu các đường dẫn chưa được khởi tạo
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
            logger.log(Level.INFO, "Saved image to build path: {0}", buildFilePath);
        }

        // Sao chép file vào thư mục project (để không bị mất khi clean)
        try {
            Files.copy(buildFilePath, projectFilePath, StandardCopyOption.REPLACE_EXISTING);
            logger.log(Level.INFO, "Copied image to project path: {0}", projectFilePath);
        } catch (IOException e) {
            logger.log(Level.WARNING, "Failed to copy image to project directory: {0}", e.getMessage());
            // Vẫn tiếp tục vì ảnh đã được lưu trong thư mục build
        }

        // Trả về đường dẫn tương đối để lưu vào database
        return uploadDirUrl + "/" + fileName;
    }
}
