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
    private double price; // Giá vé (USD)
    private int available_quantity; // Số lượng vé

    public Ticket() {
    }

    public Ticket(int ticket_id, int event_id, double price, int available_quantity) {
        this.ticket_id = ticket_id;
        this.event_id = event_id;
        this.price = price;
        this.available_quantity = available_quantity;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAvailable_quantity() {
        return available_quantity;
    }

    public void setAvailable_quantity(int available_quantity) {
        this.available_quantity = available_quantity;
    }

    @Override
    public String toString() {
        return "Ticket{" + "ticket_id=" + ticket_id + ", event_id=" + event_id + ", price=" + price + ", available_quantity=" + available_quantity + '}';
    }

}
