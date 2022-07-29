package SmartKa.Model;

public class CateNumber {
	String id;
	String name;
	int quantity;
	

	public CateNumber(String id, String name, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	@Override
	public String toString() {
		return "CateNumber [id=" + id + ", name=" + name + ", quantity=" + quantity + "]\n\n";
	}
	
	
		
	
}