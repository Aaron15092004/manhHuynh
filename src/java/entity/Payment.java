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
public class Payment {
    private int payment_id;
    private int user_id; // Foreign key to User
    private int event_id; // Foreign key to Event
    private int ticket_id; // Foreign key to Ticket
    private double amount; // Số tiền thanh toán (USD)
    private LocalDateTime payment_date;
    private String status; // PENDING, COMPLETED, FAILED

    public Payment() {
    }

    public Payment(int payment_id, int user_id, int event_id, int ticket_id, double amount, LocalDateTime payment_date, String status) {
        this.payment_id = payment_id;
        this.user_id = user_id;
        this.event_id = event_id;
        this.ticket_id = ticket_id;
        this.amount = amount;
        this.payment_date = payment_date;
        this.status = status;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
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

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public LocalDateTime getPaymentDate() {
        return payment_date;
    }

    public void setPaymentDate(LocalDateTime payment_date) {
        this.payment_date = payment_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Payment{" + "payment_id=" + payment_id + ", user_id=" + user_id + ", event_id=" + event_id + ", ticket_id=" + ticket_id + ", amount=" + amount + ", payment_date=" + payment_date + ", status=" + status + '}';
    }
    
    
}
