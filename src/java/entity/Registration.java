/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class Registration {
    private int registration_id;
    private int user_id; // Foreign key to User
    private int event_id; // Foreign key to Event
    private int ticket_id; // Foreign key to Ticket
    private LocalDateTime registered_at;
    private String status; // REGISTERED, CANCELLED

    public Registration() {
    }

    public Registration(int registration_id, int user_id, int event_id, int ticket_id, LocalDateTime registered_at, String status) {
        this.registration_id = registration_id;
        this.user_id = user_id;
        this.event_id = event_id;
        this.ticket_id = ticket_id;
        this.registered_at = registered_at;
        this.status = status;
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

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public LocalDateTime getRegisteredAt() {
        return registered_at;
    }

    public void setRegisteredAt(LocalDateTime registered_at) {
        this.registered_at = registered_at;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Registration{" + "registration_id=" + registration_id + ", user_id=" + user_id + ", event_id=" + event_id + ", ticket_id=" + ticket_id + ", registered_at=" + registered_at + ", status=" + status + '}';
    }
    
    
}