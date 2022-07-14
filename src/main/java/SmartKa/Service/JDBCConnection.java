package SmartKa.Service;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SmartKa.Model.User;


public class JDBCConnection {
	public Connection conn;
	public JDBCConnection() {
		final String url = "jdbc:mysql://localhost:3306/smartka?useSSL=false";
		final String user = "root";
		final String password = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}