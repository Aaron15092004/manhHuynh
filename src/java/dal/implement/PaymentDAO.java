/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;
import dal.GenericDAO;
import entity.Payment;
import java.util.List;

public class PaymentDAO extends GenericDAO<Payment> {

    @Override
    public List<Payment> findAll() {
        return queryGenericDAO(Payment.class);
    }

    @Override
    public int insert(Payment payment) {
        return insertGenericDAO(payment);
    }
}
