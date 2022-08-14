package SmartKa.Model;

public class ORProduct {
	String ORPname;
	String ORPimage;
	int ORPprice;
	int ORPquantity;
	int ORPtotal;
	public ORProduct(String oRPname, String oRPimage, int oRPprice, int oRPquantity, int oRPtotal) {
		super();
		ORPname = oRPname;
		ORPimage = oRPimage;
		ORPprice = oRPprice;
		ORPquantity = oRPquantity;
		ORPtotal = oRPtotal;
	}
	public String getORPname() {
		return ORPname;
	}
	public void setORPname(String oRPname) {
		ORPname = oRPname;
	}
	public String getORPimage() {
		return ORPimage;
	}
	public void setORPimage(String oRPimage) {
		ORPimage = oRPimage;
	}
	public int getORPprice() {
		return ORPprice;
	}
	public void setORPprice(int oRPprice) {
		ORPprice = oRPprice;
	}
	public int getORPquantity() {
		return ORPquantity;
	}
	public void setORPquantity(int oRPquantity) {
		ORPquantity = oRPquantity;
	}
	public int getORPtotal() {
		return ORPtotal;
	}
	public void setORPtotal(int oRPtotal) {
		ORPtotal = oRPtotal;
	}
	@Override
	public String toString() {
		return "ORProduct [ORPname=" + ORPname + ", ORPimage=" + ORPimage + ", ORPprice=" + ORPprice + ", ORPquantity="
				+ ORPquantity + ", ORPtotal=" + ORPtotal + "]";
	}
	
	
}
