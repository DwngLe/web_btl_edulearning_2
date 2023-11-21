/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import entity.User;
import java.util.ArrayList;
import java.util.List;


public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public boolean checkUser(User user){
        boolean isValid = false;
        try {
            User u = null;
            String query = "select * from user where username=? and password = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            rs = ps.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
        } catch (Exception e) {
        }
        return isValid;
    }
    
    public void updateUser(User user){
        String sqlString = "UPDATE user SET name=?,dob=?,email=?, pNum=? WHERE userID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, user.getName());
            ps.setDate(2, user.getDob());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getpNum());
            ps.setInt(5, user.getUserID());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public User getUserById(int id) {
        try {
            User u = null;
            String query = "select * from user where userID=?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                u = new User(id,rs.getString(2),rs.getDate(3),rs.getString(4),rs.getString(5),rs.getLong(6));
                return u;
            }
           
        } catch (Exception e) {
        }
        return null;
    }
    
    public void changePassword(User user,String newPassword){
        
    }
    
    public void updateBalance(User user, Long newBalance){
        String sqlString = "UPDATE user SET aBalance=? WHERE userID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setLong(1, newBalance);
            ps.setInt(2, user.getUserID());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
}
