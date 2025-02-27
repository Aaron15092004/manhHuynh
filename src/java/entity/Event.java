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
public class Event {
    private int event_id;
    private String title;
    private String description;
    private String location;
    private Timestamp event_date;
    private int organizer_id; // Foreign key to User
    private int max_attendees;
    private String status; // PENDING, APPROVED, REJECTED
    private String image;

    public Event() {
    }

    public Event(int event_id, String title, String description, String location, Timestamp event_date, int organizer_id, int max_attendees, String status, String image) {
        this.event_id = event_id;
        this.title = title;
        this.description = description;
        this.location = location;
        this.event_date = event_date;
        this.organizer_id = organizer_id;
        this.max_attendees = max_attendees;
        this.status = status;
        this.image = image;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Timestamp getEventDate() {
        return event_date;
    }

    public void setEventDate(Timestamp event_date) {
        this.event_date = event_date;
    }

    public int getOrganizer_id() {
        return organizer_id;
    }

    public void setOrganizer_id(int organizer_id) {
        this.organizer_id = organizer_id;
    }

    public int getMaxAttendees() {
        return max_attendees;
    }

    public void setMaxAttendees(int max_attendees) {
        this.max_attendees = max_attendees;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Event{" + "event_id=" + event_id + ", title=" + title + ", description=" + description + ", location=" + location + ", event_date=" + event_date + ", organizer_id=" + organizer_id + ", max_attendees=" + max_attendees + ", status=" + status + ", image=" + image + '}';
    }
    
    
}