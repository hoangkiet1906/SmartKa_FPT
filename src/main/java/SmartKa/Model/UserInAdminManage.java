package SmartKa.Model;

public class UserInAdminManage {
	int id;
	String fullname, avatar, phone, email, address, deliveryaddress, user_name, date;
	public UserInAdminManage(int id, String fullname, String avatar, String phone, String email, String address,
			String deliveryaddress, String user_name, String date) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.avatar = avatar;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.deliveryaddress = deliveryaddress;
		this.user_name = user_name;
		this.date = date;
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
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
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
	public String getDeliveryaddress() {
		return deliveryaddress;
	}
	public void setDeliveryaddress(String deliveryaddress) {
		this.deliveryaddress = deliveryaddress;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "UserInAdminManage [id=" + id + ", fullname=" + fullname + ", avatar=" + avatar + ", phone=" + phone
				+ ", email=" + email + ", address=" + address + ", deliveryaddress=" + deliveryaddress + ", user_name="
				+ user_name + ", date=" + date + "] \n";
	}


} 