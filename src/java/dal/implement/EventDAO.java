package dal.implement;

import dal.GenericDAO;
import entity.Event;
import java.util.LinkedHashMap;
import java.util.List;
import constant.CommonConst;
import java.sql.Timestamp;

import org.apache.catalina.util.ParameterMap;

public class EventDAO extends GenericDAO<Event> {

    @Override
    public List<Event> findAll() {
        return queryGenericDAO(Event.class);
    }

    @Override
    public int insert(Event event) {
        String sql = "INSERT INTO [dbo].[Event] (title, description, location, event_date, max_attendees, image, category_id, user_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("title", event.getTitle());
        parameterMap.put("description", event.getDescription());
        parameterMap.put("location", event.getLocation());
        parameterMap.put("event_date", event.getEvent_date());
        parameterMap.put("max_attendees", event.getMax_attendees());
        parameterMap.put("image", event.getImage());
        parameterMap.put("category_id", event.getCategory_id());
        parameterMap.put("user_id", event.getUser_id());

        return insertGenericDAO(sql, parameterMap);
    }

    public Event findById(Event event) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Event]\n"
                + "  where event_id = ?";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("id", event.getEvent_id());
        List<Event> list = queryGenericDAO(Event.class, sql, parameterMap);
        return list.isEmpty() ? null : list.get(0);
    }

    public Event getById(int eventId) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Event]\n"
                + "  where event_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("event_id", eventId);

        List<Event> list = queryGenericDAO(Event.class, sql, parameterMap);
        return list.isEmpty() ? null : list.get(0);
    }

    public List<Event> findByCategory(String categoryId, int page) {
        String sql = "SELECT * FROM Event WHERE category_id = ? ORDER BY event_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", categoryId);
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);

        return queryGenericDAO(Event.class, sql, parameterMap);
    }

    public List<Event> findByName(String keyword, int page) {
        String sql = "SELECT *\n"
                + "FROM Event e\n"
                + "WHERE e.title LIKE ?\n"
                + "ORDER BY e.event_id\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY ";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("title", "%" + keyword + "%");
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);

        return queryGenericDAO(Event.class, sql, parameterMap);
    }

    public List<Event> findByCategoryAndName(String categoryId, String keyword, int page) {
        String sql = "SELECT * FROM Event WHERE (category_id = ? OR ? = '') AND (title LIKE ? OR ? = '') ORDER BY event_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", categoryId);
        parameterMap.put("empty_category", categoryId);
        parameterMap.put("keyword", "%" + keyword + "%");
        parameterMap.put("empty_keyword", keyword);
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);

        return queryGenericDAO(Event.class, sql, parameterMap);
    }

    public int findTotalRecordByCategory(String categoryId) {
        String sql = "SELECT count(*) FROM Event WHERE category_id = ?";

        parameterMap = new ParameterMap<>();
        parameterMap.put("category_id", categoryId);
        return findTotalRecordGenericDAO(Event.class, sql, parameterMap);
    }

    public int findTotalRecordByName(String keyword) {
        String sql = "SELECT count(*) FROM Event WHERE title LIKE ?";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("title", "%" + keyword + "%");
        return findTotalRecordGenericDAO(Event.class, sql, parameterMap);
    }

    public int findTotalRecordByCategoryAndName(String categoryId, String keyword) {
        String sql = "SELECT count(*) FROM Event WHERE (category_id = ? OR ? = '') AND (title LIKE ? OR ? = '')";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", categoryId);
        parameterMap.put("empty_category", categoryId);
        parameterMap.put("keyword", "%" + keyword + "%");
        parameterMap.put("empty_keyword", keyword);
        return findTotalRecordGenericDAO(Event.class, sql, parameterMap);
    }

    public List<Event> findAll(int page) {
        String sql = "SELECT * FROM Event ORDER BY event_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);
        return queryGenericDAO(Event.class, sql, parameterMap);
    }

    public int findTotalRecord() {
        String sql = "SELECT count(*) FROM Event";

        parameterMap = new LinkedHashMap<>();
        return findTotalRecordGenericDAO(Event.class, sql, parameterMap);
    }

    public void deleteById(int event_id) {
        try {
            String sql = "DELETE FROM [dbo].[Event] WHERE [event_id] = ?";
            parameterMap = new LinkedHashMap<>();
            parameterMap.put("event_id", event_id);

            System.out.println("Deleting event with ID: " + event_id + " using SQL: " + sql);

            deleteGenericDAO(sql, parameterMap);
        } catch (Exception e) {
            System.err.println("Error in deleteById: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public boolean update(Event event) {
        try {
            String sql = "UPDATE [dbo].[Event] "
                    + "SET [title] = ?, "
                    + "[description] = ?, "
                    + "[location] = ?, "
                    + "[event_date] = ?, "
                    + "[max_attendees] = ?, "
                    + "[image] = ?, "
                    + "[category_id] = ?, "
                    + "[user_id] = ? "
                    + "WHERE event_id = ?";

            parameterMap = new LinkedHashMap<>();
            parameterMap.put("title", event.getTitle());
            parameterMap.put("description", event.getDescription());
            parameterMap.put("location", event.getLocation());
            parameterMap.put("event_date", event.getEvent_date());
            parameterMap.put("max_attendees", event.getMax_attendees());
            parameterMap.put("image", event.getImage());
            parameterMap.put("category_id", event.getCategory_id());
            parameterMap.put("user_id", event.getUser_id());
            parameterMap.put("event_id", event.getEvent_id());

            System.out.println("Executing update with user_id: " + event.getUser_id() + " for event_id: " + event.getEvent_id());

            return updateGenericDAO(sql, parameterMap);
        } catch (Exception e) {
            System.err.println("Error updating event: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // Thêm phương thức mới để tìm sự kiện theo user_id
    public List<Event> findByUserId(int userId) {
        String sql = "SELECT * FROM Event WHERE user_id = ? ORDER BY event_date DESC";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_id", userId);

        return queryGenericDAO(Event.class, sql, parameterMap);
    }

    public int insertWithUser(Event event, int userId) {
        event.setUser_id(userId);

        String sql = "INSERT INTO [dbo].[Event] (title, description, location, event_date, max_attendees, image, category_id, user_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("title", event.getTitle());
        parameterMap.put("description", event.getDescription());
        parameterMap.put("location", event.getLocation());
        parameterMap.put("event_date", event.getEvent_date());
        parameterMap.put("max_attendees", event.getMax_attendees());
        parameterMap.put("image", event.getImage());
        parameterMap.put("category_id", event.getCategory_id());
        parameterMap.put("user_id", userId);

        return insertGenericDAO(sql, parameterMap);
    }

    public Event findByTitleAndDate(String title, Timestamp eventDate) {
        String sql = "SELECT TOP 1 * FROM [dbo].[Event] WHERE title = ? AND event_date = ? ORDER BY event_id DESC";

        parameterMap = new LinkedHashMap<>();
        parameterMap.put("title", title);
        parameterMap.put("event_date", eventDate);

        List<Event> events = queryGenericDAO(Event.class, sql, parameterMap);
        return events.isEmpty() ? null : events.get(0);
    }
}
