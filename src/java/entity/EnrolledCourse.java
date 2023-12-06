/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class EnrolledCourse {
    private String id_course;
    private String id_user;

    public EnrolledCourse() {
    }

    public EnrolledCourse(String id_course, String id_user) {
        this.id_course = id_course;
        this.id_user = id_user;
    }

    public String getId_course() {
        return id_course;
    }

    public void setId_course(String id_course) {
        this.id_course = id_course;
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    @Override
    public String toString() {
        return "EnrolledCourse{" + "id_course=" + id_course + ", id_user=" + id_user + '}';
    }
    
}
