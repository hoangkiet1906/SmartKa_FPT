package SmartKa.Model;

public class RevenueChartData {
	int totalmoney;
	String dateCO;
	public RevenueChartData(int totalmoney, String dateCO) {
		super();
		this.totalmoney = totalmoney;
		this.dateCO = dateCO;
	}
	public int getTotalmoney() {
		return totalmoney;
	}
	public void setTotalmoney(int totalmoney) {
		this.totalmoney = totalmoney;
	}
	public String getDateCO() {
		return dateCO;
	}
	public void setDateCO(String dateCO) {
		this.dateCO = dateCO;
	}
	@Override
	public String toString() {
		return "RevenueChartData [totalmoney=" + totalmoney + ", dateCO=" + dateCO + "]";
	}
	
}
