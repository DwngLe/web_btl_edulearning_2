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
public class Blog {
    private String id;
    private String title;
    private String content;
    private Date createdDate;

    public Blog() {
    }

    public Blog(String id, String title, String content) {
        this.id = id;
        this.title = title;
        this.content = content;
        setDateNow();
    }

    public Blog(String id, String title, String content, Date createdDate) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createdDate = createdDate;
    }
    
    
    public String getID() {
        return id;
    }

    public void setBlogID(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
    private void setDateNow() {
        LocalDate currentDate = LocalDate.now();
        this.createdDate = Date.valueOf(currentDate);
    }

    @Override
    public String toString() {
        return "Blog{" + "id=" + id + ", title=" + title + ", content=" + content + ", createdDate=" + createdDate + '}';
    }
    
}
