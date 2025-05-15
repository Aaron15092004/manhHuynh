/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Payment {

    private int payment_id;
    private double amount; // Số tiền thanh toán (USD)
    private Timestamp payment_date;
    private String status; // PENDING, COMPLETED, FAILED
    private int user_id;
    List<Registration> listRegistration = new ArrayList<>();

    public Payment() {
    }

    public Payment(int payment_id, double amount, Timestamp payment_date, String status, int user_id) {
        this.payment_id = payment_id;
        this.amount = amount;
        this.payment_date = payment_date;
        this.status = status;
        this.user_id = user_id;
    }

    

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Timestamp getPaymentDate() {
        return payment_date;
    }

    public void setPaymentDate(Timestamp payment_date) {
        this.payment_date = payment_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(Timestamp payment_date) {
        this.payment_date = payment_date;
    }

    public List<Registration> getListRegistration() {
        return listRegistration;
    }

    public void setListRegistration(List<Registration> listRegistration) {
        this.listRegistration = listRegistration;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Payment{" + "payment_id=" + payment_id + ", amount=" + amount + ", payment_date=" + payment_date + ", status=" + status + ", user_id=" + user_id + ", listRegistration=" + listRegistration + '}';
    }

    

}
