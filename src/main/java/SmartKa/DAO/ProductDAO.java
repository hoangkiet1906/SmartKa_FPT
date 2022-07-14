package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;import org.springframework.beans.factory.config.TypedStringValue;

import SmartKa.Model.Product;
import SmartKa.Model.User;
import SmartKa.Service.JDBCConnection;

public class ProductDAO {
	public ArrayList<Product> getProduct() {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			String sql = "Select * from product";
			PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	Product bean = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
            			 rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7),
            			 rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
                list.add(bean);
            }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getProductByStatus(String status) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			String sql = "Select * from product where status = '"+ status + "'";
			PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	Product bean = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
            			 rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7),
            			 rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
                list.add(bean);
            }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Product> getProductByTag() {
		ArrayList<Product> list = new ArrayList<Product>();
		ArrayList<String> listTagArrayList = new ArrayList<String>();
		try {
			String sql = "select distinct tag from product";
			PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	String bean = rs.getString(1);
            	listTagArrayList.add(bean);
            }
            for (String stringTag : listTagArrayList) {
				try {
					String sql2 = "select * from product where tag = '"+ stringTag +"' limit 1";
					PreparedStatement ps2 = new JDBCConnection().conn.prepareStatement(sql2);
		            ResultSet rs2 = ps2.executeQuery();
		            while(rs2.next()){
		            	Product bean2 = new Product(rs2.getInt(1), rs2.getString(2), rs2.getInt(3),
		            			rs2.getInt(4), rs2.getString(5), rs2.getString(6), rs2.getString(7),
		            			rs2.getInt(8), rs2.getString(9), rs2.getString(10), rs2.getString(11));
		                list.add(bean2);
		            }

				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public static void main(String[] args) {
	
		System.out.println(new ProductDAO().getProductByTag().toString());

	}
}