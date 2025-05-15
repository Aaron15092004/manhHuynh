package constant;

import entity.Payment;
import entity.Registration;
import entity.Event;
import entity.Ticket;
import dal.implement.EventDAO;
import dal.implement.TicketDAO;

import javax.mail.*;
import javax.mail.internet.*;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

public class SendMail {

    private final String username = "huynhnmhe187232@fpt.edu.vn"; // Email gửi
    private final String password = "nqku bgzr qcen kozs"; // Dùng App Password thay vì mật khẩu chính

    public void sendMail(String recipientEmail, String recipientName) {
        sendConfirmationEmail(recipientEmail, recipientName, null, null);
    }

    public void sendConfirmationEmail(String recipientEmail, String recipientName, Payment payment, List<Registration> registrations) {
        // Cấu hình SMTP Server (Gmail)
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.mime.charset", "UTF-8"); // Thêm cấu hình mã hóa UTF-8

        // Xác thực tài khoản gửi email
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username, "Harmony Events"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Confirm booking successful - Harmony Events");

            // Tạo mã đơn hàng ngẫu nhiên
            String orderNumber = generateOrderNumber();

            // Tạo nội dung chi tiết đơn hàng nếu có dữ liệu đầy đủ
            String orderDetails = "";
            if (payment != null && registrations != null && !registrations.isEmpty()) {
                orderDetails = createOrderDetails(payment, registrations);
            }

            // Nội dung email dạng HTML đẹp hơn
            String emailContent = createEmailTemplate(recipientName, orderNumber, orderDetails);

            // Thiết lập nội dung email dưới dạng HTML
            message.setContent(emailContent, "text/html; charset=UTF-8");

            // Gửi email
            Transport.send(message);
            System.out.println("Email đã gửi thành công đến: " + recipientEmail);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi khi gửi email: " + e.getMessage());
        }
    }

    private String generateOrderNumber() {
        return "HRM-" + System.currentTimeMillis() % 10000 + "-" + UUID.randomUUID().toString().substring(0, 4).toUpperCase();
    }

    private String createOrderDetails(Payment payment, List<Registration> registrations) {
        StringBuilder details = new StringBuilder();

        // Thêm bảng chi tiết sự kiện
        details.append("<table style='width: 100%; border-collapse: collapse; margin-top: 20px; margin-bottom: 20px;'>");
        details.append("<tr style='background-color: #f8f9fa;'>");
        details.append("<th style='padding: 12px; text-align: left; border-bottom: 1px solid #dee2e6;'>Sự kiện</th>");
        details.append("<th style='padding: 12px; text-align: center; border-bottom: 1px solid #dee2e6;'>Số lượng</th>");
        details.append("<th style='padding: 12px; text-align: right; border-bottom: 1px solid #dee2e6;'>Giá</th>");
        details.append("<th style='padding: 12px; text-align: right; border-bottom: 1px solid #dee2e6;'>Thành tiền</th>");
        details.append("</tr>");

        EventDAO eventDAO = new EventDAO();
        TicketDAO ticketDAO = new TicketDAO();
        double totalAmount = 0;

        for (Registration reg : registrations) {
            Event event = eventDAO.getById(reg.getEvent_id());
            double price = ticketDAO.getTicketPriceByEventId(reg.getEvent_id());
            double subtotal = price * reg.getTicket_quantity();
            totalAmount += subtotal;

            details.append("<tr>");
            details.append("<td style='padding: 12px; text-align: left; border-bottom: 1px solid #dee2e6;'>" + event.getTitle() + "</td>");
            details.append("<td style='padding: 12px; text-align: center; border-bottom: 1px solid #dee2e6;'>" + reg.getTicket_quantity() + "</td>");
            details.append("<td style='padding: 12px; text-align: right; border-bottom: 1px solid #dee2e6;'>$" + String.format("%.2f", price) + "</td>");
            details.append("<td style='padding: 12px; text-align: right; border-bottom: 1px solid #dee2e6;'>$" + String.format("%.2f", subtotal) + "</td>");
            details.append("</tr>");
        }

        // Thêm dòng tổng cộng
        details.append("<tr style='background-color: #f8f9fa; font-weight: bold;'>");
        details.append("<td colspan='3' style='padding: 12px; text-align: right; border-top: 2px solid #dee2e6;'>Tổng cộng:</td>");
        details.append("<td style='padding: 12px; text-align: right; border-top: 2px solid #dee2e6;'>$" + String.format("%.2f", totalAmount) + "</td>");
        details.append("</tr>");
        details.append("</table>");

        // Thêm thông tin thanh toán
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        details.append("<div style='margin-top: 20px; background-color: #f8f9fa; padding: 15px; border-radius: 5px;'>");
        details.append("<h3 style='margin-top: 0; color: #343a40;'>Thông tin thanh toán</h3>");
        details.append("<p><strong>Phương thức thanh toán:</strong> Online</p>");
        details.append("<p><strong>Trạng thái:</strong> <span style='color: #28a745; font-weight: bold;'>Thành công</span></p>");
        details.append("<p><strong>Thời gian:</strong> " + dateFormat.format(payment.getPaymentDate()) + "</p>");
        details.append("</div>");

        return details.toString();
    }

    private String createEmailTemplate(String recipientName, String orderNumber, String orderDetails) {
        return "<html><head>"
                + "<style>"
                + "body { font-family: 'Segoe UI', Arial, sans-serif; background-color: #f8f9fa; margin: 0; padding: 0; }"
                + ".container { max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }"
                + ".header { background: linear-gradient(135deg, #6366F1 0%, #4F46E5 100%); padding: 30px 20px; text-align: center; }"
                + ".logo { margin-bottom: 20px; }"
                + ".logo img { height: 60px; }"
                + ".header-text { color: white; margin: 0; font-size: 24px; font-weight: 600; }"
                + ".sub-header { color: rgba(255,255,255,0.9); margin: 5px 0 0; font-size: 16px; }"
                + ".content { padding: 30px 20px; color: #343a40; }"
                + ".greeting { font-size: 20px; font-weight: 600; margin-bottom: 20px; }"
                + ".message { font-size: 16px; line-height: 1.6; margin-bottom: 25px; }"
                + ".order-info { background-color: #f8f9fa; border-radius: 6px; padding: 15px; margin-bottom: 25px; }"
                + ".order-info p { margin: 5px 0; }"
                + ".order-number { font-weight: bold; color: #4F46E5; }"
                + ".cta-button { display: inline-block; background: #4F46E5; color: white; padding: 12px 30px; text-decoration: none; border-radius: 5px; font-weight: 600; font-size: 16px; margin-top: 15px; transition: background 0.3s; }"
                + ".cta-button:hover { background: #4338CA; }"
                + ".footer { background-color: #f8f9fa; text-align: center; padding: 20px; font-size: 14px; color: #6c757d; border-top: 1px solid #e9ecef; }"
                + ".social-links { margin-top: 15px; }"
                + ".social-links a { display: inline-block; margin: 0 8px; }"
                + ".social-links img { width: 24px; height: 24px; }"
                + ".divider { border-top: 1px solid #e9ecef; margin: 25px 0; }"
                + ".event-details { margin-top: 25px; }"
                + ".event-details h3 { color: #343a40; margin-bottom: 15px; }"
                + "</style>"
                + "</head><body>"
                + "<div class='container'>"
                // Header
                + "<div class='header'>"
                + "<h1 class='header-text'>Đặt vé thành công!</h1>"
                + "<p class='sub-header'>Cảm ơn bạn đã sử dụng dịch vụ của Harmony Events</p>"
                + "</div>"
                // Content
                + "<div class='content'>"
                + "<p class='greeting'>Xin chào " + recipientName + ",</p>"
                + "<p class='message'>Chúng tôi xin thông báo rằng việc đặt vé của bạn đã được xác nhận thành công. Thông tin chi tiết đơn hàng được cung cấp bên dưới.</p>"
                // Order Info
                + "<div class='order-info'>"
                + "<p><strong>Mã đơn hàng:</strong> <span class='order-number'>" + orderNumber + "</span></p>"
                + "<p><strong>Ngày đặt:</strong> " + new SimpleDateFormat("dd/MM/yyyy HH:mm").format(new java.util.Date()) + "</p>"
                + "<p><strong>Trạng thái:</strong> <span style='color: #28a745;'>Đã thanh toán</span></p>"
                + "</div>"
                // Order Details (if available)
                + (orderDetails.isEmpty() ? ""
                : "<div class='event-details'>"
                + "<h3>Chi tiết đơn hàng</h3>"
                + orderDetails
                + "</div>")
                + "<div class='divider'></div>"
                + "<p>Hướng dẫn tham gia sự kiện:</p>"
                + "<ol>"
                + "<li>Vui lòng đến trước thời gian bắt đầu sự kiện ít nhất 15-30 phút.</li>"
                + "<li>Mang theo email xác nhận này (có thể hiển thị trên điện thoại) và giấy tờ tùy thân.</li>"
                + "<li>Tuân thủ quy định của ban tổ chức sự kiện.</li>"
                + "</ol>"
                + "<center><a href='http://yourwebsite.com/tickets' class='cta-button'>XEM VÉ CỦA TÔI</a></center>"
                + "</div>"
                // Footer
                + "<div class='footer'>"
                + "<p>© 2025 Harmony Events Management</p>"
                + "<p>Nếu bạn có bất kỳ câu hỏi nào, hãy liên hệ với chúng tôi tại <a href='mailto:support@harmony.com'>support@harmony.com</a></p>"
                + "<div class='social-links'>"
                + "<a href=\"#!\"><i class=\"fab fa-facebook-f\"></i></a>"
                + "<a href=\"#!\"><i class=\"fab fa-twitter\"></i></a>"
                + "<a href=\"#!\"><i class=\"fab fa-instagram\"></i></a>"
                + "</div>"
                + "</div>"
                + "</div>"
                + "</body></html>";
    }

    // Main test gửi email
    public static void main(String[] args) {
        SendMail sendMail = new SendMail();
        sendMail.sendMail("nguyenmanhhuynh15092004@gmail.com", "Manh Huynh");
    }
}
