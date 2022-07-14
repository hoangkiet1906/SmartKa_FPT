package SmartKa.Constants;

public class Constant {
	public static final String SESSION_USERNAME = "username";
	public static final String GET_ALL_ACCOUNTS_QUERY = "SELECT * FROM account";
	public static final String CHECK_ACCOUNT_QUERY = "SELECT * FROM account WHERE user_name = ?";
	public static final String ADD_USER_QUERY = "INSERT INTO account (user_name, password, date) VALUE (?, ?, ?)";
}
