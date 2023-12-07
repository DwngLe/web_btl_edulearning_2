/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Course;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CourseDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Course> getAllCourse(){
        try {
            String query = "SELECT * FROM web.course";
            conn = new DBContext().getConnection();
 
            ps = conn.prepareStatement(query);
       
            rs = ps.executeQuery();
        
            List<Course> list = new ArrayList<>();
            
            while (rs.next()) {
                Course a;
                a = new Course(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getInt(10));
                list.add(a);
            }
            
            if (list.isEmpty()) {
                System.out.println("khong the ket noi duoc");
            }

            return list;
        } catch (Exception e) {
        }
        return null;
    }
    
    public void addNewCourse(Course s){
        try {
            String sqlString = "INSERT INTO course (id, teacher_name, price, duration, course_description,course_language, course_level, image_url,title) VALUES (?,?, ?,?,?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getCourseID());
            ps.setString(2, s.getTeacherName());
            ps.setInt(3, s.getPrice());
            ps.setString(4, s.getDuration());
            ps.setString(5, s.getDescriptionCourse());
            ps.setString(6, s.getLanguageCourse());
            ps.setString(7, s.getLevelCourse());
            ps.setString(8, s.getImageUrl());
            ps.setString(9, s.getTitle());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public Course getCourseByID(String id) {
        try {
            String query = "select * from web.course where id=?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                Course a;
                a = new Course(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getInt(10));

                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void updateCourse(Course s){
        String sqlString = "UPDATE web.course SET teacher_name = ?, price = ?, duration = ?, course_description = ?, course_language = ?, course_level = ?, image_url = ?, title=? WHERE (id = ?)";
        try {
             
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getTeacherName());
            ps.setInt(2, s.getPrice());
            ps.setString(3, s.getDuration());
            ps.setString(4, s.getDescriptionCourse());
            ps.setString(5, s.getLanguageCourse());
            ps.setString(6, s.getLevelCourse());
            ps.setString(7, s.getImageUrl());
            ps.setString(8, s.getTitle());
            ps.setString(9, s.getCourseID());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void updateTotalViewCourse(Course s){
        String sqlString = "UPDATE web.course SET totalView = ? WHERE (id = ?)";
        try {
             
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setInt(1, s.getTotalView()+1);
            ps.setString(2, s.getCourseID());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
     public void deleteCourse(String courseID){
         System.out.println(courseID);
        String sqlString = "Delete from course where (id = ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, courseID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
}
