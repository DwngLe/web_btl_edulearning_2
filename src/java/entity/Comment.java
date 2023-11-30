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
    private String id_user;
    private String description;
    private Date created_at;
    private String id;
    private String id_else;
    
    public Comment() {
    }

    public Comment(String id_user, String description, Date created_at, String id, String id_else) {
        this.id_user = id_user;
        this.description = description;
        this.created_at = created_at;
        this.id = id;
        this.id_else = id_else;
    }

   
    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId_else() {
        return id_else;
    }

    public void setId_else(String id_else) {
        this.id_else = id_else;
    }

    @Override
    public String toString() {
        return "Comment{" + "id_user=" + id_user + ", description=" + description + ", created_at=" + created_at + ", id=" + id + ", id_else=" + id_else + '}';
    }

   

    
    
}
