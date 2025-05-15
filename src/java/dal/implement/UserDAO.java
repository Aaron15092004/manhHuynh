package dal.implement;

import dal.GenericDAO;
import entity.User;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserDAO extends GenericDAO<User> {

    @Override
    public List<User> findAll() {
        return queryGenericDAO(User.class);
    }

    @Override
    public int insert(User user) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([full_name]\n"
                + "           ,[email]\n"
                + "           ,[password]\n"
                + "           ,[role_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,2)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("full_name", user.getFull_name());
        parameterMap.put("email", user.getEmail());
        parameterMap.put("password", user.getPassword());
        return insertGenericDAO(sql, parameterMap);
    }

    public User findByEmailAndPassword(User user) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[User]\n"
                + "  WHERE email = ? AND password = ? ";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("email", user.getEmail());
        parameterMap.put("password", user.getPassword());
        List<User> list = queryGenericDAO(User.class, sql, parameterMap);
        return list.isEmpty() ? null : list.get(0);
    }

    public boolean checkEmailExist(User user) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[User]\n"
                + "  WHERE email = ? ";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("email", user.getEmail());
        return !queryGenericDAO(User.class, sql, parameterMap).isEmpty();
    }

    /**
     * Cập nhật tên người dùng
     *
     * @param userId ID của người dùng
     * @param fullName Tên mới
     * @return true nếu cập nhật thành công, false nếu thất bại
     */
    public boolean updateName(int userId, String fullName) {
        String sql = "UPDATE [dbo].[User] SET full_name = ? WHERE user_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", fullName);
        parameterMap.put("2", userId);
        return updateGenericDAO(sql, parameterMap);
    }

    /**
     * Cập nhật mật khẩu
     *
     * @param userId ID của người dùng
     * @param newPassword Mật khẩu mới
     * @return true nếu cập nhật thành công, false nếu thất bại
     */
    public boolean updatePassword(int userId, String newPassword) {
        String sql = "UPDATE [dbo].[User] SET password = ? WHERE user_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", newPassword);
        parameterMap.put("2", userId);
        return updateGenericDAO(sql, parameterMap);
    }

    /**
     * Kiểm tra mật khẩu hiện tại
     *
     * @param userId ID của người dùng
     * @param password Mật khẩu cần kiểm tra
     * @return true nếu mật khẩu đúng, false nếu sai
     */
    public boolean checkPassword(int userId, String password) {
        String sql = "SELECT * FROM [dbo].[User] WHERE user_id = ? AND password = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", userId);
        parameterMap.put("2", password);
        List<User> users = queryGenericDAO(User.class, sql, parameterMap);
        return !users.isEmpty();
    }

    /**
     * Tìm user theo ID
     *
     * @param userId ID của người dùng
     * @return User object hoặc null nếu không tìm thấy
     */
    public User findById(int userId) {
        String sql = "SELECT * FROM [dbo].[User] WHERE user_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", userId);
        List<User> users = queryGenericDAO(User.class, sql, parameterMap);
        return users.isEmpty() ? null : users.get(0);
    }
}
