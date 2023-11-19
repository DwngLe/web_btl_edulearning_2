/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import encryptor.Encryptor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import entity.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    HashMap<String, String> loginInfo = new HashMap<>();
    Encryptor encryptor = new Encryptor();

    byte[] encryptionKey = {65, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12};

    public String checkUser(User user) {
        boolean isValid = false;
        String id = null;
        try {
            String encryptedPassword = encryptor.encrypt(user.getPassword(), encryptionKey);
            User u = null;
            String query = "select * from user where username=? and password = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, encryptedPassword);
            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getString("id");
            }
        } catch (Exception e) {
        }
        return id;
    }

    public void updateUser(User user) {
        String sqlString = "UPDATE user SET name=?,dob=?,email=?, pNum=? WHERE userID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, user.getName());
            ps.setDate(2, user.getDateOfBirth());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getUserID().toString());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void changePassword(User user, String newPassword) {

    }

    public void updateBalance(User user, Long newBalance) {
        String sqlString = "UPDATE user SET aBalance=? WHERE userID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setLong(1, newBalance);
            ps.setString(2, user.getUserID().toString());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public User getUserById(String id) {
        User user = new User();
        try {
            String query = "select * from user where id= ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUserID());
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new User(id, rs.getString("username"), rs.getString("password"), rs.getDate("date_of_birth"), rs.getString("email"), rs.getString("name"), rs.getLong("money"), rs.getString("phone_number"));
            }
        } catch (Exception e) {
        }
        return user;
    }

    public int addUser(User user) {
        String sqlString = "INSERT INTO `web`.`user` (`id`, `username`, `password`, `role`, `email`, `name`, `money`, `phone_number`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        int numRowChange = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            String encryptedPassword = encryptor.encrypt(user.getPassword(), encryptionKey);
            ps.setString(1, user.getUserID().toString());
            ps.setString(2, user.getUsername());
            ps.setString(3, encryptedPassword);
            ps.setString(4, user.getRole());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getName());
            ps.setLong(7, user.getMoney());
            ps.setString(8, user.getPhoneNumber());
            numRowChange = ps.executeUpdate();
        } catch (Exception e) {
        }
        return numRowChange;
    }

    public List<User> findUserByPhone(String phoneNumber) {
        List<User> listUser = new ArrayList<>();
        try {
            User user = new User();
            String query = "select * from user where phone_number= ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, phoneNumber);
            rs = ps.executeQuery();
            while(rs.next()) {
                System.out.println("1");
                String encrytedPassword = rs.getString("password");
                String password = encryptor.decrypt(encrytedPassword, encryptionKey);
                user = new User(rs.getString("id"), rs.getString("username"), password, rs.getDate("date_of_birth"), rs.getString("email"), rs.getString("name"), rs.getLong("money"), rs.getString("phone_number"));
                System.out.println("pass " + user.getPassword());
                listUser.add(user);
            }
        } catch (Exception e) {
        }
        System.out.println("Do dai danh sach la: " + listUser.size());
        return listUser;
    }
    
    public String findPassword(String id){
        String password = "";
        String encryptedPassword ="";
        try {
            String query = "select password from user where id= ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
               encryptedPassword = rs.getString("password");
            }
            password = encryptor.decrypt(encryptedPassword, encryptionKey);
            System.out.println("pass " + password);
        } catch (Exception e) {
        }
        return password;
    }

}
