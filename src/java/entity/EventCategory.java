/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class EventCategory {
    private int event_id; // Foreign key to Event
    private int category_id; // Foreign key to Category

    public EventCategory() {
    }

    public EventCategory(int event_id, int category_id) {
        this.event_id = event_id;
        this.category_id = category_id;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    @Override
    public String toString() {
        return "EventCategory{" + "event_id=" + event_id + ", category_id=" + category_id + '}';
    }
    
    
}
