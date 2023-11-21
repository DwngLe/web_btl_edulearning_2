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
    private String CommentIDl;
    private String UserID;
    private String ElseID;
    private String Desciption;
    private Date CreatedDate;
    
    public Comment() {
    }


    public Comment(String CommentIDl, String UserID, String ElseID, String Desciption, Date CreatedDate) {
        this.CommentIDl = CommentIDl;
        this.UserID = UserID;
        this.ElseID = ElseID;
        this.Desciption = Desciption;
        this.CreatedDate = CreatedDate;
    }

    public String getCommentIDl() {
        return CommentIDl;
    }

    public void setCommentIDl(String CommentIDl) {
        this.CommentIDl = CommentIDl;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getElseID() {
        return ElseID;
    }

    public void setElseID(String ElseID) {
        this.ElseID = ElseID;
    }

    public String getDesciption() {
        return Desciption;
    }

    public void setDesciption(String Desciption) {
        this.Desciption = Desciption;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    @Override
    public String toString() {
        return "Comment{" + "CommentIDl=" + CommentIDl + ", UserID=" + UserID + ", ElseID=" + ElseID + ", Desciption=" + Desciption + ", CreatedDate=" + CreatedDate + '}';
    }
}
