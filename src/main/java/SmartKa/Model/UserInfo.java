package SmartKa.Model;

public class UserInfo {
	private int id;
	private String fullname;
	private String avatar;
	private String phone;
	private String email;
	private String address;
	private String daddress;
	private String username;
	public UserInfo() {
		super();
	}
	public UserInfo(int id, String fullname,String avatar, String phone, String email, String address, String daddress, String username) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.avatar = avatar;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.daddress = daddress;
		this.username =username;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDaddress() {
		return daddress;
	}
	public void setDaddress(String daddress) {
		this.daddress = daddress;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	@Override
	public String toString() {
		return "User info: [id=" + id + ", fullname=" + fullname +", avatar="+avatar+ ", email=" + email + ", address=" + address
				+ ", delivery address: " + daddress + ", username" + username + "]";
	}
}
