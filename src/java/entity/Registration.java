/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class Registration {

    private int registration_id;
    private int user_id; // Foreign key to User
    private int event_id; // Foreign key to Event
    private int ticket_quantity; // Foreign key to Ticket
    private int payment_id;

    public Registration() {
    }

    public Registration(int registration_id, int user_id, int event_id, int ticket_quantity, int payment_id) {
        this.registration_id = registration_id;
        this.user_id = user_id;
        this.event_id = event_id;
        this.ticket_quantity = ticket_quantity;
        this.payment_id = payment_id;
    }

    public int getRegistration_id() {
        return registration_id;
    }

    public void setRegistration_id(int registration_id) {
        this.registration_id = registration_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public int getTicket_quantity() {
        return ticket_quantity;
    }

    public void setTicket_quantity(int ticket_quantity) {
        this.ticket_quantity = ticket_quantity;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    @Override
    public String toString() {
        return "Registration{" + "registration_id=" + registration_id + ", user_id=" + user_id + ", event_id=" + event_id + ", ticket_quantity=" + ticket_quantity + ", payment_id=" + payment_id + '}';
    }
    
    

}
