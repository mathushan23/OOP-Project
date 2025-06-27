package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnection {

	private static Connection connection;
	// singleton pattern
		private Dbconnection(){
			
		}
		public static Connection getDbConnection() {
			final String DRIVER_NAME = "com.mysql.jdbc.Driver";
			final String URL = "jdbc:mysql://localhost:3306/oopproject";
			final String USERNAME = "root";
			final String PASSWORD = "1234";
			
			connection = null;
				try {
					Class.forName(DRIVER_NAME);
				
					connection = DriverManager.getConnection(URL,USERNAME, PASSWORD);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("Connection Failure");

				}
				
				System.out.println("Connection Success");
			
			return connection;
		}
	
}
