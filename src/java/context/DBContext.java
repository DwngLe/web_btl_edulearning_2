package context;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBContext {
    
    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
    /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
     public Connection getConnection()throws Exception {
        String url = "jdbc:mysql://"+serverName+":"+portNumber + "/" +dbName;
        Class.forName("com.mysql.cj.jdbc.Driver");
         System.out.println("Connected!");
        return DriverManager.getConnection(url, userID, password);
    }   
     //Hehe thay doi file config nhe ae
     //HEHE111111
    private final String serverName = "web.c8zceuhcull3.ap-southeast-1.rds.amazonaws.com";
    private final String dbName = "web";
    private final String portNumber = "3306";
    private final String userID = "admin";
    private final String password = "12345678";
//    private final String userID = "root";
//    private final String password = "123456";
    
    
    
//    private final String serverName = "localhost";
//    private final String dbName = "web";
//    private final String portNumber = "3306";
//    private final String userID = "root";
//    private final String password = "123456";
}