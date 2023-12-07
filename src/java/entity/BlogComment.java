/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author duong
 */
public class BlogComment {
    private String id;
    private String description;
    private Date createdDate;
    private String idUser;
    private String idBlog;

    public BlogComment() {
    }

    public BlogComment(String id, String description, String idUser, String idBlog) {
        this.id = id;
        this.description = description;
        this.idUser = idUser;
        this.idBlog = idBlog;
        this.createdDate = dateNow();
    }

    public BlogComment(String id, String description, Date createdDate, String idUser, String idBlog) {
        this.id = id;
        this.description = description;
        this.createdDate = createdDate;
        this.idUser = idUser;
        this.idBlog = idBlog;
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

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getIdBlog() {
        return idBlog;
    }

    public void setIdBlog(String idBlog) {
        this.idBlog = idBlog;
    }
    
    public Date dateNow() {
        LocalDate currentDate = LocalDate.now();
        return Date.valueOf(currentDate);
    }

    @Override
    public String toString() {
        return "BlogComment{" + "id=" + id + ", description=" + description + ", createdDate=" + createdDate + ", idUser=" + idUser + ", idBlog=" + idBlog + '}';
    }
}
