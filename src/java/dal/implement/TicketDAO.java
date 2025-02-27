/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.Ticket;
import java.util.List;

public class TicketDAO extends GenericDAO<Ticket> {

    @Override
    public List<Ticket> findAll() {
        return queryGenericDAO(Ticket.class);
    }

    @Override
    public int insert(Ticket ticket) {
        return insertGenericDAO(ticket);
    }
    
}
