/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Course;
import entity.EnrolledCourse;
import entity.User;
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
            ps.setString(2, s.getUser().getUserID());
            ps.setString(3, s.getCourse().getCourseID());
            ps.setDate(4, s.getSubDate());

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<EnrolledCourse> getAllCourse(String idUser) {
        try {

            String query = "SELECT * FROM web.enrolled_course\n"
                    + "where id_user=?";
            conn = new DBContext().getConnection();
            UserDAO udao = new UserDAO();
            CourseDAO cdao = new CourseDAO();
            ps = conn.prepareStatement(query);
            ps.setString(1, idUser);

            rs = ps.executeQuery();

            List<EnrolledCourse> list = new ArrayList<>();

            while (rs.next()) {
                EnrolledCourse ec = new EnrolledCourse();
                ec.setId(rs.getString("id"));
                User u = udao.getUserById(rs.getString("id_user"));
                ec.setUser(u);
                Course course = cdao.getCourseByID(rs.getString("id_course"));
                ec.setCourse(course);
                ec.setSubDate(rs.getDate("sub_date"));
                list.add(ec);
            }

            if (list.isEmpty()) {
                System.out.println("khong the ket noi duoc");
            }

            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteEnrollCourse(String courseID) {
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
