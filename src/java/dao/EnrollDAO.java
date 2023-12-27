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
import java.sql.Date;
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
            conn.close();
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
            conn.close();
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteEnrollCourse(String courseID, String idUser) {
        System.out.println(courseID);
        String sqlString = "DELETE FROM enrolled_course WHERE id_course = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, courseID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public List<EnrolledCourse> getAllEnrollCourse(String id) {
        System.out.println("Dang tim kiem danh sach cac khoa hoc da hoc cua user co id: " + id);

        List<EnrolledCourse> listEnrollCourse = new ArrayList<>();
        String sqlString = "Select course.id,course.title,course.image_url,course.price, course.teacher_name,enrolled_course.sub_date  from enrolled_course join course on enrolled_course.id_course = course.id where enrolled_course.id_user = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCourseID(rs.getString("course.id"));
                c.setTeacherName(rs.getString("course.teacher_name"));
                c.setTitle(rs.getString("course.title"));
                c.setImageUrl(rs.getString("course.image_url"));
                c.setPrice(rs.getInt("course.price"));
                System.out.println("cname:" + c.getTitle());
                Date subDate = rs.getDate("enrolled_course.sub_date");

                EnrolledCourse enrollCourse = new EnrolledCourse();
                enrollCourse.setCourse(c);
                enrollCourse.setSubDate(subDate);
                listEnrollCourse.add(enrollCourse);
            }
            System.out.println("Do dai danh sach cac khoa hoc da dang ky la: " + listEnrollCourse.size());
            conn.close();
            return listEnrollCourse;

        } catch (Exception e) {
        }
        return null;
    }

}
