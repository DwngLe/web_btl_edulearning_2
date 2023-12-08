/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.BlogComment;
import entity.Comment;
import entity.CommentUser;
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
public class CommentDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

//    public List<CommentUser> getCommentUsersForCourse(String courseId) {
//        try {
//            List<CommentUser> commentUsers = new ArrayList<>();
//            String query = "SELECT user.name\n"
//                    + "FROM user\n"
//                    + "JOIN comment ON user.id = comment.id_user\n"
//                    + "WHERE comment.id_else = ?";
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, courseId);
//            rs = ps.executeQuery();
//            ArrayList<CommentUser> list = new ArrayList<>();
//            while (rs.next()){
//                CommentUser a;
//                a = new CommentUser(rs.getString(1));
//                list.add(a);
//            }
//        } catch (Exception e) {
//        }
//        return null;
//    }
    public List<CommentUser> getAllCmtById(String id) {
        try {
            String query = "SELECT \n"
                    + "    comment.id AS comment_id,\n"
                    + "    comment.description,\n"
                    + "    comment.created_date,\n"
                    + "    user.id AS user_id,\n"
                    + "    user.name AS user_name,\n"
                    + "    comment.id_course\n"
                    + "FROM \n"
                    + "    comment\n"
                    + "JOIN \n"
                    + "    user ON comment.id_user = user.id\n"
                    + "WHERE \n"
                    + "    comment.id_course = ?";
            conn = new DBContext().getConnection();

            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            List<CommentUser> list = new ArrayList<>();

            while (rs.next()) {
                CommentUser a;
                a = new CommentUser(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5),rs.getString(6));
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

    public void addNewComment(Comment s) {
        try {
            
            System.out.println(s.toString());
            System.out.println(s);
            String sqlString = "INSERT INTO web.comment (id, description, created_date, id_user, id_course) VALUES (?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getId());
            ps.setString(2, s.getDescription());
            ps.setDate(3, s.getCreated_date());
            ps.setString(4, s.getId_user());
            ps.setString(5, s.getId_course());

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
}
