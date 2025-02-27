/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.EventCategory;
import java.util.List;

public class EventCategoryDAO extends GenericDAO<EventCategory> {

    @Override
    public List<EventCategory> findAll() {
        return queryGenericDAO(EventCategory.class);
    }

    @Override
    public int insert(EventCategory eventCategory) {
        return insertGenericDAO(eventCategory);
    }
    
}
