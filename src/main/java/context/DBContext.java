package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

	public DBContext() {
		// TODO Auto-generated constructor stub
	}
	
	public Connection getConnection() throws SQLException, ClassNotFoundException {
		String url = "jdbc:mysql://" + serverName + "/" + dbName ;
		// load driver to interact with data source
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(url, username, password);
	}
	
	private final String serverName = "localhost:3306";
	private final String dbName = "shoppingdb";
	private final String username = "root";
	private final String password = "n0thingF3@thatIt";
}
