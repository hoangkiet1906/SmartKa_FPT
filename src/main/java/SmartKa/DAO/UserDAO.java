package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SmartKa.Constants.Constant;
import SmartKa.Model.User;
import SmartKa.Model.UserInfo;
import SmartKa.Response.AuthResponse;
import SmartKa.Service.JDBCConnection;
import SmartKa.Validators.Validators;

//qhai
import java.time.LocalDate;

import SmartKa.Model.LoyalCustomer;
import SmartKa.Model.Product;
import SmartKa.Model.UserInAdminManage;

public class UserDAO {
	public static Connection connection = new JDBCConnection().conn;
	public static ArrayList<User> getAllUsers() {
		ArrayList<User> users = new ArrayList<User>();
		try {	
			String sql = Constant.GET_ALL_ACCOUNTS_QUERY;
			PreparedStatement ps = UserDAO.connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	User a = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            	users.add(a);
            }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}
	public static ArrayList<LoyalCustomer> getLoyalCus() {
		ArrayList<LoyalCustomer> list = new ArrayList<LoyalCustomer>();
		try {
			String query = Constant.GET_LOYAL_CUS;
			PreparedStatement ps = new JDBCConnection().conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				LoyalCustomer bean = new LoyalCustomer(rs.getString(1),rs.getString(2), rs.getInt(3), rs.getInt(4));
				list.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public static UserInfo getUserInfo(String username) {
		UserInfo sessionUserInfo = null;		
		try {
			String sql = Constant.GET_USER_INFO_BY_USERNAME_QUERY;
			PreparedStatement ps = UserDAO.connection.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sessionUserInfo = new UserInfo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return sessionUserInfo;
	}
	public static String addUserInfo(UserInfo userInfo) {
		try {
			String addQuery = Constant.ADD_USER_INFO_QUERY;
			PreparedStatement ps = UserDAO.connection.prepareStatement(addQuery);
			ps.setString(1, userInfo.getFullname());
			ps.setString(2, userInfo.getAvatar());
			ps.setString(3, userInfo.getPhone());
			ps.setString(4, userInfo.getEmail());
			ps.setString(5, userInfo.getAddress());
			ps.setString(6, userInfo.getDaddress());
			ps.setString(7, userInfo.getUsername());
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Add user information successfully!";
	}
	public static String updateUserInfo(String username, UserInfo userInfo) {
		try {
			String updateQuery = Constant.UPDATE_USER_INFO_QUERY;
			PreparedStatement ps = UserDAO.connection.prepareStatement(updateQuery);
			ps.setString(1, userInfo.getFullname());
			ps.setString(2, userInfo.getAvatar());
			ps.setString(3, userInfo.getPhone());
			ps.setString(4, userInfo.getEmail());
			ps.setString(5, userInfo.getAddress());
			ps.setString(6, userInfo.getDaddress());
			ps.setString(7, userInfo.getUsername());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Update user information successfully!";
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
					loginUser.setRole(rs.getString(4));
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
				newUser.setRole("USER");
				String query = Constant.ADD_USER_QUERY;
				PreparedStatement ps = UserDAO.connection.prepareStatement(query);
				ps.setString(1, newUser.getUser_name());
				ps.setString(2, newUser.getPassword());
				ps.setString(3, newUser.getDate());
				ps.setString(4, newUser.getRole());
				ps.execute();
				authResponse.setSuccess(true);
				authResponse.setMessage("Created User Successfully!");
				authResponse.setUser(newUser);
				// set information in info table database 
				String sql = "INSERT INTO info (avatar, user_name) VALUES (?,?)";
				PreparedStatement ps1 = UserDAO.connection.prepareStatement(sql);
				ps1.setString(1, "avt.jpg");
				ps1.setString(2, newUser.getUser_name());
				ps1.execute();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("fail");
			}
		}
		return authResponse;
	}

	// get + set avatar
	public static String getAvatar(String username) {
		String avt = "";
		try {
			String sql = "Select avatar from info where user_name = '" + username + "'";
			PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				avt = rs.getString("avatar");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return avt;
	}
	
	public static String setAvatar(String avatar, String username) {
		try {
			String sql = "UPDATE info SET avatar = ? WHERE  user_name = '" + username + "'";
			PreparedStatement ps = UserDAO.connection.prepareStatement(sql);
			ps.setString(1, avatar);
			ps.executeUpdate();
			return "success";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	// add feedback into database
	public static void addFeedback(String content, String username) {
		try {
			String date = Validators.getCurrentTime();
			String sql = "INSERT INTO support (user_name, mess, date) VALUES (?,?,?)";
			PreparedStatement ps = UserDAO.connection.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, content);
			ps.setString(3, date);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//ktoan
	public static ArrayList<User> findAll() {
		ArrayList<User> users = new ArrayList<User>();
		try {
			String sql = Constant.GET_ALL_ACCOUNTS_QUERY;
			PreparedStatement ps = UserDAO.connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User a = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				users.add(a);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	public static User findOne(User user) {
		User loginUser = new User();
		try {
			String query = Constant.CHECK_ACCOUNT_QUERY;
			PreparedStatement ps = UserDAO.connection.prepareStatement(query);
			ps.setString(1, user.getUser_name());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				loginUser.setUser_name(rs.getString(1));
				loginUser.setPassword(rs.getString(2));
				loginUser.setDate(rs.getString(3));
				loginUser.setRole(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loginUser;
	}

	public static User save(User user) {
		User newUser = new User();
		try {
			newUser.setUser_name(user.getUser_name());
			newUser.setPassword(Validators.hashPassword(user.getPassword()));
			newUser.setDate(Validators.getCurrentTime());
			newUser.setRole("USER");
			String query = Constant.ADD_USER_QUERY;
			PreparedStatement ps = UserDAO.connection.prepareStatement(query);
			ps.setString(1, newUser.getUser_name());
			ps.setString(2, newUser.getPassword());
			ps.setString(3, newUser.getDate());
			ps.setString(4, newUser.getRole());
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newUser;
	}

	public static boolean isExists(User user) {
		ArrayList<User> users = UserDAO.findAll();
		for (User u : users) {
			if (u.getUser_name().equals(user.getUser_name())) {
				return true;
			}
		}
		return false;
	}
	
	public static ArrayList<User> getAccountsByRole(String role) {
		ArrayList<User> arrayList = new ArrayList<User>();

		String query = Constant.GET_ACCOUNT_BY_ROLE_QUERY;

		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, role);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				arrayList.add(new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
		} catch (Exception e) { 
			e.printStackTrace();
		}

		return arrayList;
	}

	
	// qhai : ADMIN
		public static ArrayList<UserInAdminManage> getUserInAdmin() {
			ArrayList<UserInAdminManage> users = new ArrayList<UserInAdminManage>();
			LocalDate today = LocalDate.now();
			LocalDate yesterday = today.minusDays(1);
			LocalDate sevDaysAgo = today.minusDays(8);
			LocalDate todaySql = today.plusDays(1);
			try {
				String sql = Constant.ADMIN_GET_USER_MANAGE;
				PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
				ps.setString(1, sevDaysAgo.toString());
				ps.setString(2, todaySql.toString());
				ps.setInt(3, Constant.NO_USER_IN_ADMIN_MANAGE);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){
	            	if(rs.getString(11).compareTo(today.toString()) >= 10)
	            	{
	            		if(rs.getString(2)==null)
	            		{
	            			UserInAdminManage user = new UserInAdminManage(rs.getInt(1),rs.getString(8),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8), "Today");
	                		users.add(user);
	            		}
	            		else
	            		{
	            			UserInAdminManage user = new UserInAdminManage(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8), "Today");
	                		users.add(user);
	            		}

	            	}
	            	else if(rs.getString(11).compareTo(yesterday.toString()) >= 10)
	            	{
	            		if(rs.getString(2)==null)
	            		{
	            			UserInAdminManage user = new UserInAdminManage(rs.getInt(1),rs.getString(8),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8), "Yesterday");
	                		users.add(user);
	            		}
	            		else
	            		{
	            			UserInAdminManage user = new UserInAdminManage(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8), "Yesterday");
	                		users.add(user);
	            		}
	            	}
	            	else {
	            		if(rs.getString(2)==null)
	            		{
	            			UserInAdminManage user = new UserInAdminManage(rs.getInt(1),rs.getString(8),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8), rs.getString(11));
	                		users.add(user);
	            		}
	            		else
	            		{
	            			UserInAdminManage user = new UserInAdminManage(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8), rs.getString(11));
	                		users.add(user);
	            		}
	            	}
	            }
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return users;
		}

		
	
}