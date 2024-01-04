/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.BlogComment;
import entity.Blog;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    public void addBlogNewComment(BlogComment s, String idUser, String idBlog) {
        try {

            System.out.println(s.toString());
            System.out.println(s);
            String sqlString = "INSERT INTO web.blogcomment (id, description, created_date, id_user, id_blog) VALUES (?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getCommentID());
            ps.setString(2, s.getDescription());
            ps.setDate(3, s.getCreatedDate());
            ps.setString(4, idUser);
            ps.setString(5, idBlog);
            ps.executeUpdate();
            closeResources();
        } catch (Exception e) {
        } finally {
            closeResources();
        }
    }

    public List<BlogComment> getAllCommentBlogByID(String id) {
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
            closeResources();
            return list;
        } catch (Exception e) {
        } finally {
            closeResources();
        }
        return null;
    }

    public void deleteAllCommentBlogByID(String blogID) {
        try {
            String query = "DELETE FROM web.blogcomment WHERE id_blog=?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, blogID);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println(rowsAffected + " rows deleted successfully.");
            } else {
                System.out.println("No rows deleted.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    public List<BlogComment> getAllCommentByUserID(String id) {
        List<BlogComment> listComment = new ArrayList<>();
        try {
            String query = "SELECT blog.id, blog.title, blogcomment.description, blogcomment.created_date\n"
                    + "FROM blog\n"
                    + "JOIN blogcomment ON blog.id = blogcomment.id_blog\n"
                    + "JOIN user ON user.id = blogcomment.id_user\n"
                    + "WHERE user.id = ?;";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                BlogComment blogComment = new BlogComment();
                Blog blog = new Blog();

                blog.setBlogID(rs.getString("id"));
                blog.setTitle(rs.getString("title"));

                blogComment.setBlog(blog);
                blogComment.setDescription(rs.getString("description"));
                blogComment.setCreatedDate(rs.getDate("created_date"));

                listComment.add(blogComment);
            }

            System.out.println("Do dai danh sach cac comment cua user trong cac blog la: " + listComment.size());

        } catch (Exception e) {
        } finally {
            closeResources();
        }
        return listComment;
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
