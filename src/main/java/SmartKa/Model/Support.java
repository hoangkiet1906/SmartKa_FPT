package SmartKa.Model;

public class Support {
	int id;
	String user_name;
	String  mess;
	String  date;
	String 	img;
	public Support(int id, String user_name, String mess, String date, String img) {
		super();
		this.id = id;
		this.user_name = user_name;
		this.mess = mess;
		this.date = date;
		this.img = img;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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
		return "Support [id=" + id + ", user_name=" + user_name + ", mess=" + mess + ", date=" + date + ", img=" + img
				+ "]";
	}
	
	
	
}
