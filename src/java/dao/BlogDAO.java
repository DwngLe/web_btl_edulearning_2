/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Blog;
import java.sql.*;
import java.util.*;

/**
 *
 * @author duong
 */
public class BlogDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Blog getBlogByID(String id) {
        Blog b = null;
        try {
            String query = "select * from web.blog where id=?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                b = new Blog(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4));
                return b;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Blog> getAllBlog() {
        List<Blog> listBlog = new ArrayList<>();
        try {
            String query = "select * from web.blog";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4));
                listBlog.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listBlog;
    }

    public void addNewBlog(Blog b) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            String query = "INSERT INTO web.blog (id,title, content, created_date) VALUES(?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, b.getBlogID());
            ps.setString(2, b.getTitle());
            ps.setString(3, b.getContent());
            ps.setDate(4, b.getCreatedDate());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteBlog(String id) {
        String query = "DELETE FROM web.blog WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateBlog(Blog b) {
        String sqlString = "UPDATE web.blog SET title=?, content=?, created_date=? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, b.getTitle());
            ps.setString(2, b.getContent());
            ps.setDate(3, b.getCreatedDate());
            ps.setString(4, b.getBlogID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
