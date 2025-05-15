package dal.implement;

import dal.GenericDAO;
import entity.Registration;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RegistrationDAO extends GenericDAO<Registration> {
    private static final Logger LOGGER = Logger.getLogger(RegistrationDAO.class.getName());
    
    @Override
    public List<Registration> findAll() {
        return queryGenericDAO(Registration.class);
    }
    
    @Override
    public int insert(Registration registration) {
        // Sử dụng câu SQL với đầy đủ các trường cần thiết
        String sql = "INSERT INTO [dbo].[Registration] " +
                     "(user_id, ticket_quantity, payment_id, event_id) " +
                     "VALUES (?, ?, ?, ?)";
        
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", registration.getUser_id());
        parameterMap.put("2", registration.getTicket_quantity());
        parameterMap.put("3", registration.getPayment_id());
        parameterMap.put("4", registration.getEvent_id());
        
        return insertGenericDAO(sql, parameterMap);
    }
    
    /**
     * Insert registration với transaction
     * @param registration đối tượng Registration cần insert
     * @param conn Connection đang trong transaction
     * @throws SQLException nếu có lỗi SQL
     */
    public void insertWithConnection(Registration registration, Connection conn) throws SQLException {
        String sql = "INSERT INTO [dbo].[Registration] " +
                     "(user_id, ticket_quantity, payment_id, event_id) " +
                     "VALUES (?, ?, ?, ?)";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, registration.getUser_id());
            ps.setInt(2, registration.getTicket_quantity());
            ps.setInt(3, registration.getPayment_id());
            ps.setInt(4, registration.getEvent_id());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi insert registration", e);
            throw e; // Re-throw để transaction có thể rollback
        }
    }
    
    /**
     * Lấy danh sách đăng ký theo user_id
     * @param userId ID của người dùng
     * @return Danh sách Registration
     */
    public List<Registration> findByUserId(int userId) {
        String sql = "SELECT * FROM Registration WHERE user_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_id", userId);
        return queryGenericDAO(Registration.class, sql, parameterMap);
    }
    
    /**
     * Lấy connection từ GenericDAO
     */
    public Connection getConnection() {
        return super.getConnection();
    }
}