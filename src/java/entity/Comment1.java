/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Comment1 {
    private String commentID,description;
    private Date createdDate;
    private String userID,elseID;

    public Comment1() {
    }

    public Comment1(String commentID, String description, Date createdDate, String userID, String elseID) {
        this.commentID = commentID;
        this.description = description;
        this.createdDate = createdDate;
        this.userID = userID;
        this.elseID = elseID;
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
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

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getElseID() {
        return elseID;
    }

    public void setElseID(String elseID) {
        this.elseID = elseID;
    }

    @Override
    public String toString() {
        return "Comment{" + "commentID=" + commentID + ", description=" + description + ", createdDate=" + createdDate + ", userID=" + userID + ", elseID=" + elseID + '}';
    }

    
}
