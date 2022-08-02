package SmartKa.Model;

public class OrderDetail {
	private int iddecheckout;
	private Product product;
	private int idcheckout;
	private int quantity;

	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDetail(int iddecheckout, Product product, int idcheckout, int quantity) {
		super();
		this.iddecheckout = iddecheckout;
		this.product = product;
		this.idcheckout = idcheckout;
		this.quantity = quantity;
	}

	public OrderDetail(Product product, int idcheckout, int quantity) {
		super();
		this.product = product;
		this.idcheckout = idcheckout;
		this.quantity = quantity;
	}

	public int getIddecheckout() {
		return iddecheckout;
	}

	public void setIddecheckout(int iddecheckout) {
		this.iddecheckout = iddecheckout;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
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
		return "OrderDetail [iddecheckout=" + iddecheckout + ", product=" + product + ", idcheckout=" + idcheckout
				+ ", quantity=" + quantity + "]";
	}

}