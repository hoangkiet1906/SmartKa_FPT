package SmartKa.Model;

public class User {
	String user_name;
	String password;
	String date;
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public User(String user_name, String password, String date) {
		super();
		this.user_name = user_name;
		this.password = password;
		this.date = date;
	}
	@Override
	public String toString() {
		return "User [user_name=" + user_name + ", password=" + password + ", date=" + date
				+ "]";
	}
	

}