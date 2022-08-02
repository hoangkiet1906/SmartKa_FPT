package SmartKa.Model;

public class Support {
	int id;
	String user_name;
	String  mess;
	String  date;
	public Support(int id, String user_name, String mess, String date) {
		super();
		this.id = id;
		this.user_name = user_name;
		this.mess = mess;
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getMess() {
		return mess;
	}
	public void setMess(String mess) {
		this.mess = mess;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Support [id=" + id + ", user_name=" + user_name + ", mess=" + mess + ", date=" + date + "]";
	}
	
	
}
