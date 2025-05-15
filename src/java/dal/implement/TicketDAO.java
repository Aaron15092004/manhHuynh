package dal.implement;

import dal.GenericDAO;
import entity.Ticket;
import java.util.LinkedHashMap;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TicketDAO extends GenericDAO<Ticket> {

    private static final Logger LOGGER = Logger.getLogger(TicketDAO.class.getName());

    @Override
    public List<Ticket> findAll() {
        return queryGenericDAO(Ticket.class);
    }

    @Override
    public int insert(Ticket ticket) {
        String sql = "INSERT INTO [dbo].[Ticket] ([event_id], [price], [available_quantity]) VALUES (?, ?, ?)";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("event_id", ticket.getEvent_id());
        parameterMap.put("price", ticket.getPrice());
        parameterMap.put("available_quantity", ticket.getAvailable_quantity());

        return insertGenericDAO(sql, parameterMap);
    }

    /**
     * Lấy giá vé cho một sự kiện
     *
     * @param event_id ID của sự kiện
     * @return Giá vé
     */
    public double getTicketPriceByEventId(int event_id) {
        String sql = "SELECT * FROM Ticket WHERE event_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("event_id", event_id);
        List<Ticket> tickets = queryGenericDAO(Ticket.class, sql, parameterMap);
        if (!tickets.isEmpty()) {
            return tickets.get(0).getPrice();
        }
        return 0.0;
    }

    /**
     * Lấy số lượng vé còn lại cho một sự kiện
     *
     * @param event_id ID của sự kiện
     * @return Số lượng vé còn lại
     */
    public int getAvailableQuantityByEventId(int event_id) {
        String sql = "SELECT available_quantity FROM Ticket WHERE event_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("event_id", event_id);

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, event_id);

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("available_quantity");
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting available quantity for event ID: " + event_id, e);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Error closing resources", e);
            }
        }
        return 0;
    }

    /**
     * Cập nhật số lượng vé sau khi bán
     *
     * @param eventId ID của sự kiện
     * @param quantity Số lượng vé đã bán
     * @return true nếu cập nhật thành công, false nếu không
     */
    public boolean updateTicketInventory(int eventId, int quantity) {
        String sql = "UPDATE Ticket SET available_quantity = available_quantity - ? "
                + "WHERE event_id = ? AND available_quantity >= ?";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("quantity", quantity);
        parameterMap.put("event_id", eventId);
        parameterMap.put("check_quantity", quantity);

        return updateGenericDAO(sql, parameterMap);
    }

    /**
     * Cập nhật số lượng vé với transaction
     *
     * @param eventId ID của sự kiện
     * @param quantity Số lượng vé đã bán
     * @param conn Connection đang trong transaction
     * @throws SQLException nếu có lỗi SQL
     */
    public void updateAvailableQuantity(int eventId, int quantity, Connection conn) throws SQLException {
        String sql = "UPDATE Ticket SET available_quantity = available_quantity - ? "
                + "WHERE event_id = ? AND available_quantity >= ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, quantity);
            ps.setInt(2, eventId);
            ps.setInt(3, quantity);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("Không đủ vé cho sự kiện ID: " + eventId
                        + ". Yêu cầu: " + quantity);
            }
        }
    }

    /**
     * Lấy connection từ GenericDAO
     */
    public Connection getConnection() {
        return super.getConnection();
    }

    /**
     * Tìm một ticket theo event_id
     *
     * @param eventId ID của sự kiện
     * @return Ticket đầu tiên tìm thấy hoặc null nếu không có
     */
    public Ticket findByEventId(int eventId) {
        String sql = "SELECT * FROM Ticket WHERE event_id = ?";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("event_id", eventId);

        List<Ticket> tickets = queryGenericDAO(Ticket.class, sql, parameterMap);
        return tickets.isEmpty() ? null : tickets.get(0);
    }

    /**
     * Cập nhật thông tin ticket
     *
     * @param ticket Ticket cần cập nhật
     * @return true nếu cập nhật thành công, false nếu không
     */
    public boolean update(Ticket ticket) {
        String sql = "UPDATE Ticket SET price = ?, available_quantity = ? WHERE ticket_id = ?";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("price", ticket.getPrice());
        parameterMap.put("available_quantity", ticket.getAvailable_quantity());
        parameterMap.put("ticket_id", ticket.getTicket_id());

        return updateGenericDAO(sql, parameterMap);
    }
}
