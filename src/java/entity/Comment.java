/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author duong
 */
public class Comment {
    private String id;
    private String description;
    private Date created_date;
    private String id_user;
    private String id_course;
    
    public Comment() {
    }

    public Comment(String id, String description, Date created_date, String id_user, String id_course) {
        this.id = id;
        this.description = description;
        this.created_date = created_date;
        this.id_user = id_user;
        this.id_course = id_course;
    }

    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getId_course() {
        return id_course;
    }

    public void setId_course(String id_course) {
        this.id_course = id_course;
    }

    @Override
    public String toString() {
        return "Comment{" + "id=" + id + ", description=" + description + ", created_date=" + created_date + ", id_user=" + id_user + ", id_course=" + id_course + '}';
    }

    

   
    

    
    
}
