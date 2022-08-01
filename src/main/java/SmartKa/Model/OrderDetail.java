package SmartKa.Model;

public class OrderDetail {
	private int iddecheckout;
	private int id;
	private int idcheckout;
	private int quantity;

	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDetail(int iddecheckout, int id, int idcheckout, int quantity) {
		super();
		this.iddecheckout = iddecheckout;
		this.id = id;
		this.idcheckout = idcheckout;
		this.quantity = quantity;
	}

	public OrderDetail(int id, int idcheckout, int quantity) {
		super();
		this.id = id;
		this.idcheckout = idcheckout;
		this.quantity = quantity;
	}

	public int getIddecheckout() {
		return iddecheckout;
	}

	public void setIddecheckout(int iddecheckout) {
		this.iddecheckout = iddecheckout;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdcheckout() {
		return idcheckout;
	}

	public void setIdcheckout(int idcheckout) {
		this.idcheckout = idcheckout;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "OrderDetail [iddecheckout=" + iddecheckout + ", id=" + id + ", idcheckout=" + idcheckout + ", quantity="
				+ quantity + "]";
	}

}
