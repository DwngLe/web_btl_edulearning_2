/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Comment;
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
    
    
    public List<Comment> getAllCmtById(String id){
        try {
            String query = "SELECT * FROM web.comment where id_else=?";
            conn = new DBContext().getConnection();
 
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
        
            List<Comment> list = new ArrayList<>();
            
            while (rs.next()) {
                Comment a;
                a = new Comment(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5));
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
    
    public void addNewComment(Comment s){
        try {
            String sqlString = "INSERT INTO web.comment (id_user, description, created_at, id, id_else) VALUES (?,?,?,?,?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, s.getId_user());
            ps.setString(2, s.getDescription());
            ps.setDate(3, s.getCreated_at());
            ps.setString(4, s.getId());
            ps.setString(5, s.getId_else());
            
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
