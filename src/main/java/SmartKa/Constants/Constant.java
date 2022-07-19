package SmartKa.Constants;

public class Constant {
	public static final String SESSION_USERNAME = "username";
	public static final String SESSION_USER_INFORMATION = "userInfo";
	public static final String GET_ALL_ACCOUNTS_QUERY = "SELECT * FROM account";
	public static final String CHECK_ACCOUNT_QUERY = "SELECT * FROM account WHERE user_name = ?";
	public static final String ADD_USER_QUERY = "INSERT INTO account (user_name, password, date) VALUE (?, ?, ?)";
	public static final String GET_USER_INFO_BY_USERNAME_QUERY = "SELECT * FROM info WHERE user_name = ?";
	public static final String ADD_USER_INFO_QUERY = "INSERT INTO info (fullname, avatar, phone, email, address, deliveryaddress, user_name) VALUES (?,?,?,?,?,?,?)";
	public static final String UPDATE_USER_INFO_QUERY = "UPDATE info SET fullname = ?, avatar = ?, phone = ?, email = ?, address = ?, deliveryaddress = ? WHERE user_name = ?";
}