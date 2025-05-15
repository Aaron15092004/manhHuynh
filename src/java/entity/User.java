/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class User {

    private int user_id;
    private String full_name;
    private String email;
    private String password;
    private int role_id; // EVENT_CREATOR, ATTENDEE, ADMIN


    public User() {
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(String email, String password, String full_name) {
        this.email = email;
        this.password = password;
        this.full_name = full_name;
    }

    public User(int user_id, String full_name, String email, String password, int role_id) {
        this.user_id = user_id;
        this.full_name = full_name;
        this.email = email;
        this.password = password;
        this.role_id = role_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", full_name=" + full_name + ", email=" + email + ", password=" + password + ", role_id=" + role_id + '}';
    }
    

    

}
