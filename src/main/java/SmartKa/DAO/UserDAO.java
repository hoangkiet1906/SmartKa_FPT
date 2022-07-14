package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SmartKa.Constants.Constant;
import SmartKa.Model.User;
import SmartKa.Response.AuthResponse;
import SmartKa.Service.JDBCConnection;
import SmartKa.Validators.Validators;

public class UserDAO {
	public static Connection connection = new JDBCConnection().conn;
	public static ArrayList<User> getAllUsers() {
		ArrayList<User> users = new ArrayList<User>();
		try {	
			String sql = Constant.GET_ALL_ACCOUNTS_QUERY;
			PreparedStatement ps = UserDAO.connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	User a = new User(rs.getString(1), rs.getString(2), rs.getString(3));
            	users.add(a);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	public static AuthResponse loginToSystem (User user) {
		AuthResponse authResponse = new AuthResponse();
		if (!Validators.checkExistingUser(user)) {
			authResponse.setSuccess(false);
			authResponse.setMessage("Invalid Username!");
		} else {
			try {
				String query = Constant.CHECK_ACCOUNT_QUERY;
				PreparedStatement ps = UserDAO.connection.prepareStatement(query);
				ps.setString(1, user.getUser_name());
				ResultSet rs = ps.executeQuery();
				User loginUser = new User();
				if (rs.next()) {
					loginUser.setUser_name(rs.getString(1));
					loginUser.setPassword(rs.getString(2));
					loginUser.setDate(rs.getString(3));
				}
				if (loginUser!=null && Validators.confirmationPassword(loginUser.getPassword(), Validators.hashPassword(user.getPassword()))) {
					authResponse.setSuccess(true);
					authResponse.setMessage("Loged in Successfully!");
					authResponse.setUser(loginUser);
				} else {
					authResponse.setSuccess(false);
					authResponse.setMessage("Invalid Password!");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return authResponse;
	}
	public static AuthResponse addUserIntoDatabase(User user) {
		AuthResponse authResponse = new AuthResponse();
		if (Validators.checkExistingUser(user)) {
			authResponse.setSuccess(false);
			authResponse.setMessage("Existing User!");
		} else {
			try {
				User newUser = new User();
				newUser.setUser_name(user.getUser_name());
				newUser.setPassword(Validators.hashPassword(user.getPassword()));
				newUser.setDate(Validators.getCurrentTime());
				String query = Constant.ADD_USER_QUERY;
				PreparedStatement ps = UserDAO.connection.prepareStatement(query);
				ps.setString(1, newUser.getUser_name());
				ps.setString(2, newUser.getPassword());
				ps.setString(3, newUser.getDate());
				ps.execute();
				authResponse.setSuccess(true);
				authResponse.setMessage("Created User Successfully!");
				authResponse.setUser(newUser);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return authResponse;
	}
	public static void main(String[] args) {
		System.out.println(UserDAO.loginToSystem(new User("toantest", "testing123")));
	}
}
