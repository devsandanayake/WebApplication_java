 package DB;

import java.sql.Connection;

import java.sql.DriverManager;

//Database Connection

public class DB {
	 Connection con;
	 public static Connection getConnection() throws Exception{
	        
	        Class.forName("com.mysql.jdbc.Driver"); 
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/next" , "root" , "1234"); //database connection , username and password
	        return con;
	        
	        
	    }
}
