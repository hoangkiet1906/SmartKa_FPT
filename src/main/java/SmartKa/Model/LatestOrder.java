package SmartKa.Model;

public class LatestOrder {
	int idco;
	String date;
	String username;
	String pmethod;
	String status;
	int total;
	public LatestOrder(int idco, String date, String username, String pmethod, String status, int total) {
		super();
		this.idco = idco;
		this.date = date;
		this.username = username;
		this.pmethod = pmethod;
		this.status = status;
		this.total = total;
	}
	public int getIdco() {
		return idco;
	}
	public void setIdco(int idco) {
		this.idco = idco;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPmethod() {
		return pmethod;
	}
	public void setPmethod(String pmethod) {
		this.pmethod = pmethod;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "LatestOrder [idco=" + idco + ", date=" + date + ", username=" + username + ", pmethod=" + pmethod
				+ ", status=" + status + ", total=" + total + "]\n";
	}

}