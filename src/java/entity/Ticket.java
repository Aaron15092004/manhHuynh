/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Ticket {
    private int ticketId;
    private int eventId; // Foreign key to Event
    private String ticketType; // VIP, Standard, Early Bird
    private double price; // Giá vé (USD)
    private int quantity; // Số lượng vé

    public Ticket() {
    }

    public Ticket(int ticketId, int eventId, String ticketType, double price, int quantity) {
        this.ticketId = ticketId;
        this.eventId = eventId;
        this.ticketType = ticketType;
        this.price = price;
        this.quantity = quantity;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}