package model;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class ConnectionFactory {
	
	public Connection getConnection (){
		
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/HelpDesk", "root", "");
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
}
