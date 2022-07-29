package SmartKa.Model;

import java.util.ArrayList;

public class Pagishop{
	ArrayList<Product> productList;
	int totalPage;
	int currentPage;
	int startProduct;
	int endProduct;
	int totalProduct;
	
	public Pagishop() {
		super();
	}

	public Pagishop(ArrayList<Product> productList, int totalPage, int currentPage, int startProduct, int endProduct,
			int totalProduct) {
		super();
		this.productList = productList;
		this.totalPage = totalPage;
		this.currentPage = currentPage;
		this.startProduct = startProduct;
		this.endProduct = endProduct;
		this.totalProduct = totalProduct;
	}

	public ArrayList<Product> getProductList() {
		return productList;
	}

	public void setProductList(ArrayList<Product> productList) {
		this.productList = productList;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartProduct() {
		return startProduct;
	}

	public void setStartProduct(int startProduct) {
		this.startProduct = startProduct;
	}

	public int getEndProduct() {
		return endProduct;
	}

	public void setEndProduct(int endProduct) {
		this.endProduct = endProduct;
	}

	public int getTotalProduct() {
		return totalProduct;
	}

	public void setTotalProduct(int totalProduct) {
		this.totalProduct = totalProduct;
	}
	
	
}