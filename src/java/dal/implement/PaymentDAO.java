package dal.implement;

import dal.GenericDAO;
import entity.Payment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PaymentDAO extends GenericDAO<Payment> {

    private static final Logger LOGGER = Logger.getLogger(PaymentDAO.class.getName());

    @Override
    public List<Payment> findAll() {
        return queryGenericDAO(Payment.class);
    }

    @Override
    public int insert(Payment payment) {
        String sql = "INSERT INTO [dbo].[Payment]\n"
                + "           ([amount]\n"
                + "           ,[payment_date]\n"
                + "           ,[status]\n"
                + "           ,[user_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", payment.getAmount());
        parameterMap.put("2", payment.getPayment_date());
        parameterMap.put("3", payment.getStatus() != null ? payment.getStatus() : "pending");
        parameterMap.put("4", payment.getUser_id());
        return insertGenericDAO(sql, parameterMap);
    }

    /**
     * Insert payment với transaction
     *
     * @param payment đối tượng Payment cần insert
     * @param conn Connection đang trong transaction
     * @return ID của payment vừa insert
     * @throws SQLException nếu có lỗi SQL
     */
    public int insertWithConnection(Payment payment, Connection conn) throws SQLException {
        String sql = "INSERT INTO [dbo].[Payment] "
                + "([amount], [payment_date], [status], [user_id]) "
                + "VALUES (?, ?, ?, ?)";

        int generatedId = 0;

        try (PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setDouble(1, payment.getAmount());
            ps.setTimestamp(2, payment.getPayment_date());
            ps.setString(3, payment.getStatus() != null ? payment.getStatus() : "pending");
            ps.setInt(4, payment.getUser_id());

            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Lỗi khi thêm Payment", e);
            throw e; // Re-throw exception để transaction có thể rollback
        }

        return generatedId;
    }

    /**
     * Tìm payment theo ID
     *
     * @param paymentId ID của payment cần tìm
     * @return Payment object hoặc null nếu không tìm thấy
     */
    public Payment findById(int paymentId) {
        String sql = "SELECT * FROM Payment WHERE payment_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("payment_id", paymentId);

        List<Payment> payments = queryGenericDAO(Payment.class, sql, parameterMap);
        return payments.isEmpty() ? null : payments.get(0);
    }

    /**
     * Cập nhật trạng thái thanh toán
     *
     * @param paymentId ID của payment
     * @param status Trạng thái mới
     * @return true nếu cập nhật thành công, false nếu thất bại
     */
    public boolean updateStatus(int paymentId, String status) {
        String sql = "UPDATE Payment SET status = ? WHERE payment_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("status", status);
        parameterMap.put("payment_id", paymentId);

        return updateGenericDAO(sql, parameterMap);
    }

    /**
     * Tìm tất cả payment của một user
     *
     * @param userId ID của user
     * @return Danh sách Payment
     */
    public List<Payment> findByUserId(int userId) {
        String sql = "SELECT * FROM Payment WHERE user_id = ? ORDER BY payment_date DESC";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_id", userId);

        return queryGenericDAO(Payment.class, sql, parameterMap);
    }
}
