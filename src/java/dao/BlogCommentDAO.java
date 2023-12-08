/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.BlogComment;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author duong
 */
public class BlogCommentDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public void addBlogNewComment(BlogComment s, String idBlog) {
        try {
            
            System.out.println(s.toString());
            System.out.println(s);
            String sqlString = "INSERT INTO web.blogcomment (id, description, created_date, id_user, id_blog) VALUES (?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getCommentID());
            ps.setString(2, s.getDescription());
            ps.setDate(3, s.getCreatedDate());
            ps.setString(4, s.getUser().getUserID());
            ps.setString(5, idBlog);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public List<BlogComment> getAllCommentBlog(String id) {
        try {
            String query = "select * from web.blogcomment where id_blog=?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            List<BlogComment> list = new ArrayList<>();
            while (rs.next()) {
                UserDAO udao = new UserDAO();
                User u = udao.getUserById(rs.getString(4));
                BlogComment a;  
                a = new BlogComment(rs.getString(1), rs.getString(2), rs.getDate(3), u);
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
}
