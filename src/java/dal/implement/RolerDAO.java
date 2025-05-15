/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;
import dal.GenericDAO;
import entity.Roler;
import java.util.List;
/**
 *
 * @author Admin
 */
public class RolerDAO extends GenericDAO<Roler> {

    @Override
    public List<Roler> findAll() {
        return queryGenericDAO(Roler.class);
    }

    @Override
    public int insert(Roler roler) {
        return insertGenericDAO(roler);
    }
    
    public static void main(String[] args) {
        for (Roler user : new RolerDAO().findAll()) {
            System.out.println(user);
        }
    }
}