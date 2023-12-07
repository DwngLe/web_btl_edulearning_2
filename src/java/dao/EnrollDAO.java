/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Course;
import entity.EnrolledCourse;
import entity.EnrolledCourseUser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class EnrollDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void addNewEnroll(EnrolledCourse s) {
        try {
            
            System.out.println(s.toString());
            
            String sqlString = "INSERT INTO enrolled_course (id, id_user,id_course,sub_date) VALUES (?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getId());
            ps.setString(2, s.getId_user());
            ps.setString(3, s.getId_course());
            ps.setDate(4, s.getSubDate());

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<EnrolledCourseUser> getAllCourse(String idUser) {
        try {
            
            
            String query = "SELECT course.*\n"
                    + "FROM enrolled_course\n"
                    + "JOIN course ON enrolled_course.id_course = course.id\n"
                    + "WHERE enrolled_course.id_user = ?";
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setString(1, idUser);

            rs = ps.executeQuery();

            List<EnrolledCourseUser> list = new ArrayList<>();

            while (rs.next()) {
                EnrolledCourseUser a;
                a = new EnrolledCourseUser(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
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
    
     public void deleteEnrollCourse(String courseID, String idUser){
         System.out.println(courseID);
        String sqlString = "DELETE FROM enrolled_course WHERE id_course = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, courseID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
