/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.Event;
import java.util.List;

public class EventDAO extends GenericDAO<Event> {

    @Override
    public List<Event> findAll() {
        return queryGenericDAO(Event.class);
    }

    @Override
    public int insert(Event event) {
        return insertGenericDAO(event);
    }

    public static void main(String[] args) {
        for (Event user : new EventDAO().findAll()) {
            System.out.println(user);
        }
    }
}
