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
public class Event {
    private int eventId;
    private String title;
    private String description;
    private String location;
    private LocalDateTime eventDate;
    private int organizerId; // Foreign key to User
    private int maxAttendees;
    private String status; // PENDING, APPROVED, REJECTED
    private String image;

    public Event() {
    }

    public Event(int eventId, String title, String description, String location, LocalDateTime eventDate, int organizerId, int maxAttendees, String status, String image) {
        this.eventId = eventId;
        this.title = title;
        this.description = description;
        this.location = location;
        this.eventDate = eventDate;
        this.organizerId = organizerId;
        this.maxAttendees = maxAttendees;
        this.status = status;
        this.image = image;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
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

    public LocalDateTime getEventDate() {
        return eventDate;
    }

    public void setEventDate(LocalDateTime eventDate) {
        this.eventDate = eventDate;
    }

    public int getOrganizerId() {
        return organizerId;
    }

    public void setOrganizerId(int organizerId) {
        this.organizerId = organizerId;
    }

    public int getMaxAttendees() {
        return maxAttendees;
    }

    public void setMaxAttendees(int maxAttendees) {
        this.maxAttendees = maxAttendees;
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
    
    
}