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
public class EnrolledCourse {
    private String id;
    private String id_user;
    private String id_course;
    private Date subDate;

    public EnrolledCourse() {
    }

    public EnrolledCourse(String id, String id_user, String id_course, Date subDate) {
        this.id = id;
        this.id_user = id_user;
        this.id_course = id_course;
        this.subDate = subDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Date getSubDate() {
        return subDate;
    }

    public void setSubDate(Date subDate) {
        this.subDate = subDate;
    }

    @Override
    public String toString() {
        return "EnrolledCourse{" + "id=" + id + ", id_user=" + id_user + ", id_course=" + id_course + ", subDate=" + subDate + '}';
    }

    

    
    
}
