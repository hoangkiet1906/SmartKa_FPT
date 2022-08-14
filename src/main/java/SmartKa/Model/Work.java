package SmartKa.Model;

public class Work {
	private int id;
	private String staff_name;
	private Order order;

	public Work(String staff_name, Order order) {
		super();
		this.staff_name = staff_name;
		this.order = order;
	}

	public Work(int id, String staff_name, Order order) {
		super();
		this.id = id;
		this.staff_name = staff_name;
		this.order = order;
	}

	public Work() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStaff_name() {
		return staff_name;
	}

	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "Work [id=" + id + ", staff_name=" + staff_name + ", order=" + order + "]";
	}



}