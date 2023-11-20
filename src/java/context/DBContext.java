package context;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBContext {
     public Connection getConnection()throws Exception {
        String url = "jdbc:mysql://"+serverName+":"+portNumber + "/" +dbName;
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, userID, password);
    }   
 
    private final String serverName = "localhost";
    private final String dbName = "web";
    private final String portNumber = "3306";
    private final String userID = "root";
    private final String password = "123";
}