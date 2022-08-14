package SmartKa.Model;

public class LoyalCustomer {
	String avt;
	String username;
	int totalmoney;
	int totalorder;
	public LoyalCustomer(String avt, String username, int totalmoney, int totalorder) {
		super();
		this.avt = avt;
		this.username = username;
		this.totalmoney = totalmoney;
		this.totalorder = totalorder;
	}
	public String getAvt() {
		return avt;
	}
	public void setAvt(String avt) {
		this.avt = avt;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getTotalmoney() {
		return totalmoney;
	}
	public void setTotalmoney(int totalmoney) {
		this.totalmoney = totalmoney;
	}
	public int getTotalorder() {
		return totalorder;
	}
	public void setTotalorder(int totalorder) {
		this.totalorder = totalorder;
	}
	@Override
	public String toString() {
		return "LoyalCustomer [avt=" + avt + ", username=" + username + ", totalmoney=" + totalmoney + ", totalorder="
				+ totalorder + "]";
	}


}