package SmartKa.Model;

import java.util.ArrayList;

public class Order {
	private int id;
	private String username;
	private String payment_method;
	private double total_money;
	private String date_checkout;
	private String status;
	private String address;
	private String email;
	private String fullname;
	private String phone;
	private String note;
	private ArrayList<OrderDetail> orderDetail;
	
	public Order() {
		super();
	}

	public Order(int id, String username, String payment_method, double total_money, String date_checkout, String status,
			String address, String email, String fullname, String phone, String note) {
		super();
		this.id = id;
		this.username = username;
		this.payment_method = payment_method;
		this.total_money = total_money;
		this.date_checkout = date_checkout;
		this.status = status;
		this.address = address;
		this.email = email;
		this.fullname = fullname;
		this.phone = phone;
		this.note = note;
	}

	public Order(String username, String payment_method, double total_money, String date_checkout, String status,
			String address, String email, String fullname, String phone, String note) {
		super();
		this.username = username;
		this.payment_method = payment_method;
		this.total_money = total_money;
		this.date_checkout = date_checkout;
		this.status = status;
		this.address = address;
		this.email = email;
		this.fullname = fullname;
		this.phone = phone;
		this.note = note;
	}
	
	public Order(int id, String username, String payment_method, double total_money, String date_checkout, String status,
			String address, String email, String fullname, String phone, String note, ArrayList<OrderDetail> orderDetail) {
		super();
		this.id = id;
		this.username = username;
		this.payment_method = payment_method;
		this.total_money = total_money;
		this.date_checkout = date_checkout;
		this.status = status;
		this.address = address;
		this.email = email;
		this.fullname = fullname;
		this.phone = phone;
		this.note = note;
		this.orderDetail = orderDetail;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public double getTotal_money() {
		return total_money;
	}

	public void setTotal_money(double total_money) {
		this.total_money = total_money;
	}

	public String getDate_checkout() {
		return date_checkout;
	}

	public void setDate_checkout(String date_checkout) {
		this.date_checkout = date_checkout;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
	
	public ArrayList<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(ArrayList<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", username=" + username + ", payment_method=" + payment_method + ", total_money="
				+ total_money + ", date_checkout=" + date_checkout + ", status=" + status + ", address=" + address
				+ ", email=" + email + ", fullname=" + fullname + ", phone=" + phone + ", note=" + note
				+ ", orderDetail=" + orderDetail + "]";
	}

}