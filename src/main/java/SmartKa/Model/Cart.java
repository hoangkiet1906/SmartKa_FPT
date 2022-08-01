package SmartKa.Model;

public class Cart {
	private int id;
	private int quantity;
	private String username;
	private Product product;
	public Cart() {
		super();
	}
	public Cart(int id, int quantity, String username, Product product) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.username = username;
		this.product = product;
	}
	public Cart(int quantity, String username, Product product) {
		super();
		this.quantity = quantity;
		this.username = username;
		this.product = product;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", quantity=" + quantity + ", username=" + username + ", product=" + product + "]";
	}
}
