/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import security.Encryptor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import entity.User;
import entity.Course;

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
            System.out.println("sss");
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
        String sqlString = "UPDATE user SET name=?,date_of_birth=?,email=?, phone_number=? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, user.getName());
            ps.setDate(2, user.getDateOfBirth());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getUserID());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean changePassword(User user, String oldPassword, String newPassword) {
        String sqlString = "UPDATE user SET password=? WHERE id = ?";
        try {
            String password = encryptor.decrypt(user.getPassword(), encryptionKey);
            System.out.println("old pass: " + oldPassword);
            System.out.println("pass: " + password);
            System.out.println(password.equals(oldPassword));
            if (password.equals(oldPassword)) {

                String encryptedPassword = encryptor.encrypt(newPassword, encryptionKey);
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(sqlString);
                ps.setString(1, encryptedPassword);
                ps.setString(2, user.getUserID());
                ps.executeUpdate();

                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void updateBalance(User user, Long newBalance) {
        String sqlString = "UPDATE user SET money=? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setLong(1, newBalance);
            ps.setString(2, user.getUserID());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public User getUserById(String id) {
        User user = new User();
        try {
            System.out.println(id);
            String query = "select * from user where id= ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new User(id, rs.getString("username"), rs.getString("password"), rs.getDate("date_of_birth"), rs.getString("email"), rs.getString("name"), rs.getLong("money"), rs.getString("phone_number"));
                System.out.println(user.getName());
            }
        } catch (Exception e) {
        }
        return user;
    }

    public int addUser(User user) {
        String sqlString = "INSERT INTO user (`id`, `username`, `password`, `role`, `email`, `name`, `money`, `phone_number`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
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

    public List<Course> getEnrolledCourses(String id) {
        List<Course> ecList = new ArrayList<>();
        String sqlString = "Select course.id,course.title,course.image_url,course.price from enrolled_course join course on enrolled_course.id_course = course.id where enrolled_course.id_user = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sqlString);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course(rs.getString(1), rs.getString(2), rs.getString(3),rs.getInt(4));
                System.out.println("cname:"+c.getTitle());
                ecList.add(c);
            }
            for (Course c : ecList) {
                System.out.println("name2: " + c.getTitle());
            }
            return ecList;
        } catch (Exception e) {
        }
        return null;
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
            while (rs.next()) {
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

    public String findPassword(String id) {
        String password = "";
        String encryptedPassword = "";
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