/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author TGDD
 */
public class User{
    private int userID;
    private String name;
    private Date dob;
    private String email;
    private String pNum;
    private long aBalance;
    private String username;
    private String password;
    private String role = "GUEST";
        
    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
    
    public User(int userID, String name, Date dob, String email, String pNum, long aBalance) {
        this.userID = userID;
        this.name = name;
        this.dob = dob;
        this.email = email;
        this.pNum = pNum;
        this.aBalance = aBalance;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getpNum() {
        return pNum;
    }

    public void setpNum(String pNum) {
        this.pNum = pNum;
    }

    public long getaBalance() {
        return aBalance;
    }

    public void setaBalance(long aBalance) {
        this.aBalance = aBalance;
    }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", name=" + name + ", dob=" + dob + ", email=" + email + ", pNum=" + pNum + ", aBalance=" + aBalance + '}';
    }
    
    
    
}
