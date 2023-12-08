/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Comment;
import entity.Course;
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
public class CommentDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Comment> getAllCmtById(String id) {
        try {
            String query = "SELECT * FROM web.coursecomment\n"
                    + "where id_course = ?";
            conn = new DBContext().getConnection();

            UserDAO udao = new UserDAO();
            CourseDAO cdao = new CourseDAO();
            
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            List<Comment> list = new ArrayList<>();

            while (rs.next()) {
                Comment c = new Comment();
                c.setId(rs.getString("id"));
                c.setDescription(rs.getString("description"));
                c.setCreated_date(rs.getDate("created_date"));
                User u = udao.getUserById(rs.getString("id_user"));
                c.setUser(u);
                Course course = cdao.getCourseByID(rs.getString("id_course"));
                c.setCourse(course);
                list.add(c);
            }

            if (list.isEmpty()) {
                System.out.println("khong the ket noi duoc");
            }

            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public void addNewComment(Comment s) {
        try {

            System.out.println(s.toString());
            System.out.println(s);
            String sqlString = "INSERT INTO web.coursecomment (id, description, created_date, id_user, id_course) VALUES (?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getId());
            ps.setString(2, s.getDescription());
            ps.setDate(3, s.getCreated_date());
            ps.setString(4, s.getUser().getUserID());
            ps.setString(5, s.getCourse().getCourseID());

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
