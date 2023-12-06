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
public class CommentUser {
    private String commentId;
    private String description;
    private Date createdDate;
    private String userId;
    private String userName;
    private String idElse;

    public CommentUser() {
    }

    public CommentUser(String commentId, String description, Date createdDate, String userId, String userName, String idElse) {
        this.commentId = commentId;
        this.description = description;
        this.createdDate = createdDate;
        this.userId = userId;
        this.userName = userName;
        this.idElse = idElse;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getIdElse() {
        return idElse;
    }

    public void setIdElse(String idElse) {
        this.idElse = idElse;
    }

    @Override
    public String toString() {
        return "CommentUser{" + "commentId=" + commentId + ", description=" + description + ", createdDate=" + createdDate + ", userId=" + userId + ", userName=" + userName + ", idElse=" + idElse + '}';
    }

    
    
}
