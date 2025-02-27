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
    private int registrationId;
    private int userId; // Foreign key to User
    private int eventId; // Foreign key to Event
    private int ticketId; // Foreign key to Ticket
    private LocalDateTime registeredAt;
    private String status; // REGISTERED, CANCELLED

    public Registration() {
    }

    public Registration(int registrationId, int userId, int eventId, int ticketId, LocalDateTime registeredAt, String status) {
        this.registrationId = registrationId;
        this.userId = userId;
        this.eventId = eventId;
        this.ticketId = ticketId;
        this.registeredAt = registeredAt;
        this.status = status;
    }

    public int getRegistrationId() {
        return registrationId;
    }

    public void setRegistrationId(int registrationId) {
        this.registrationId = registrationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public LocalDateTime getRegisteredAt() {
        return registeredAt;
    }

    public void setRegisteredAt(LocalDateTime registeredAt) {
        this.registeredAt = registeredAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}