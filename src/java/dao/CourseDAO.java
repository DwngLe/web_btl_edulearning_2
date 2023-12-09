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
import stat.CourseStat;

/**
 *
 * @author Admin
 */
public class CourseDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Course> getAllCourse() {
        try {
            String query = "SELECT * FROM web.course";
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            List<Course> list = new ArrayList<>();

            while (rs.next()) {
                Course a;
                a = new Course(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));
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

    public void addNewCourse(Course s) {
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
                a = new Course(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));

                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateCourse(Course s) {
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

    public void updateTotalViewCourse(Course s) {
        String sqlString = "UPDATE web.course SET totalView = ? WHERE (id = ?)";
        try {

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setInt(1, s.getTotalView() + 1);
            ps.setString(2, s.getCourseID());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCourse(String courseID) {
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

    public List<CourseStat> getStatOfCourse() {
        List<CourseStat> listCourseStat = null;
        try {
            String query = "SELECT\n"
                    + "    c.id AS course_id,\n"
                    + "    c.price AS course_price,\n"
                    + "    c.title,\n"
                    + "    c.teacher_name,\n"
                    + "    c.totalView,\n"
                    + "    COUNT(DISTINCT ec.id_user) AS total_enrollments,\n"
                    + "    IFNULL(SUM(CASE WHEN ec.id_user IS NOT NULL THEN c.price ELSE 0 END), 0) AS total_revenue\n"
                    + "FROM\n"
                    + "    course c\n"
                    + "LEFT JOIN enrolled_course ec ON c.id = ec.id_course\n"
                    + "GROUP BY\n"
                    + "    c.id, c.price, c.title, c.teacher_name, c.totalView;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                if (listCourseStat == null) {
                    listCourseStat = new ArrayList<>();
                }
                CourseStat courseStat = new CourseStat();
                courseStat.setCourseID(rs.getString("course_id"));
                courseStat.setPrice(rs.getInt("course_price"));
                courseStat.setTotalView(rs.getInt("totalView"));
                courseStat.setTotalEnrollment(rs.getInt("total_enrollments"));
                courseStat.setTotalRevenue(rs.getInt("total_revenue"));
                courseStat.setTeacherName(rs.getString("teacher_name"));
                courseStat.setTitle(rs.getString("title"));

                listCourseStat.add(courseStat);
            }
        } catch (Exception e) {
        }
        System.out.println("Do dai danh sach cac khoa hoc la: " + listCourseStat.size());
        return listCourseStat;
    }

}
