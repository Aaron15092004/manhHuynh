package entity;

import java.sql.Timestamp;

public class Event {

    private int event_id;
    private String title;
    private String description;
    private String location;
    private Timestamp event_date;
    private int max_attendees;
    private String image;
    private int category_id; // New field
    private int user_id;

    public Event() {
    }

    public Event(int event_id) {
        this.event_id = event_id;
    }

    public Event(int event_id, String title, String description, String location, Timestamp event_date, int max_attendees, String image, int category_id, int user_id) {
        this.event_id = event_id;
        this.title = title;
        this.description = description;
        this.location = location;
        this.event_date = event_date;
        this.max_attendees = max_attendees;
        this.image = image;
        this.category_id = category_id;
        this.user_id = user_id;
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

    public Timestamp getEvent_date() {
        return event_date;
    }

    public void setEvent_date(Timestamp event_date) {
        this.event_date = event_date;
    }

    public int getMax_attendees() {
        return max_attendees;
    }

    public void setMax_attendees(int max_attendees) {
        this.max_attendees = max_attendees;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Event{" + "event_id=" + event_id + ", title=" + title + ", description=" + description + ", location=" + location + ", event_date=" + event_date + ", max_attendees=" + max_attendees + ", image=" + image + ", category_id=" + category_id + ", user_id=" + user_id + '}';
    }

    
}
