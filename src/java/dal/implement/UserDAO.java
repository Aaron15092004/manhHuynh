/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;
import dal.GenericDAO;
import entity.User;
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
        return insertGenericDAO(user);
    }
}
