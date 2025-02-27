/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;
import dal.GenericDAO;
import entity.Registration;
import java.util.List;

public class RegistrationDAO extends GenericDAO<Registration> {

    @Override
    public List<Registration> findAll() {
        return queryGenericDAO(Registration.class);
    }

    @Override
    public int insert(Registration registration) {
        return insertGenericDAO(registration);
    }
    
    
}