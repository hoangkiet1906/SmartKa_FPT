package SmartKa.Model;

public class User {
	String user_name;
	String password;
	String date;
	String role;
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
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public User(String user_name, String password, String date, String role) {
		super();
		this.user_name = user_name;
		this.password = password;
		this.date = date;
		this.role = role;
	}
	@Override
	public String toString() {
		return "User [user_name=" + user_name + ", password=" + password + ", date=" + date
				+ "]";
	}
	public User() {
		super();
	}
	public User(String user_name, String password) {
		super();
		this.user_name = user_name;
		this.password = password;
	}
	
	public User(String user_name) {
		super();
		this.user_name = user_name;
	}
	

}