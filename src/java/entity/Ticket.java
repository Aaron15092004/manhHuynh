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
    private int ticket_id;
    private int event_id; // Foreign key to Event
    private String ticket_type; // VIP, Standard, Early Bird
    private double price; // Giá vé (USD)
    private int quantity; // Số lượng vé

    public Ticket() {
    }

    public Ticket(int ticket_id, int event_id, String ticket_type, double price, int quantity) {
        this.ticket_id = ticket_id;
        this.event_id = event_id;
        this.ticket_type = ticket_type;
        this.price = price;
        this.quantity = quantity;
    }

    public int getTicketId() {
        return ticket_id;
    }

    public void setTicketId(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public int getEventId() {
        return event_id;
    }

    public void setEventId(int event_id) {
        this.event_id = event_id;
    }

    public String getTicketType() {
        return ticket_type;
    }

    public void setTicketType(String ticket_type) {
        this.ticket_type = ticket_type;
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

    @Override
    public String toString() {
        return "Ticket{" + "ticket_id=" + ticket_id + ", event_id=" + event_id + ", ticket_type=" + ticket_type + ", price=" + price + ", quantity=" + quantity + '}';
    }
    
    
}