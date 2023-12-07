/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class EnrolledCourseUser {
    private String courseId,teacherName;
    private int price;
    private String duration,courseDesc,courseLang,courseLev,imageUrl,title;

    public EnrolledCourseUser() {
    }

    public EnrolledCourseUser(String courseId, String teacherName, int price, String duration, String courseDesc, String courseLang, String courseLev, String imageUrl, String title) {
        this.courseId = courseId;
        this.teacherName = teacherName;
        this.price = price;
        this.duration = duration;
        this.courseDesc = courseDesc;
        this.courseLang = courseLang;
        this.courseLev = courseLev;
        this.imageUrl = imageUrl;
        this.title = title;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getCourseDesc() {
        return courseDesc;
    }

    public void setCourseDesc(String courseDesc) {
        this.courseDesc = courseDesc;
    }

    public String getCourseLang() {
        return courseLang;
    }

    public void setCourseLang(String courseLang) {
        this.courseLang = courseLang;
    }

    public String getCourseLev() {
        return courseLev;
    }

    public void setCourseLev(String courseLev) {
        this.courseLev = courseLev;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "EnrolledCourseUser{" + "courseId=" + courseId + ", teacherName=" + teacherName + ", price=" + price + ", duration=" + duration + ", courseDesc=" + courseDesc + ", courseLang=" + courseLang + ", courseLev=" + courseLev + ", imageUrl=" + imageUrl + ", title=" + title + '}';
    }
    
}
