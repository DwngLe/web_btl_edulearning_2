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
    private String BlogID;
    private String Title;
    private String Content;
    private Date CreatedDate;

    public Blog() {
    }

    public Blog(String BlogID, String Title, String Content) {
        this.BlogID = BlogID;
        this.Title = Title;
        this.Content = Content;
        setDateNow();
    }

    public Blog(String BlogID, String Title, String Content, Date CreatedDate) {
        this.BlogID = BlogID;
        this.Title = Title;
        this.Content = Content;
        this.CreatedDate = CreatedDate;
    }

    public String getBlogID() {
        return BlogID;
    }

    public void setBlogID(String BlogID) {
        this.BlogID = BlogID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }
    
    private void setDateNow() {
        LocalDate currentDate = LocalDate.now();
        this.CreatedDate = Date.valueOf(currentDate);
    }

    @Override
    public String toString() {
        return "Blog{" + "BlogID=" + BlogID + ", Title=" + Title + ", Content=" + Content + ", CreatedDate=" + CreatedDate + '}';
    }

    
}
