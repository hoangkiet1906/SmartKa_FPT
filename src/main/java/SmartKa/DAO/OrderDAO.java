package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SmartKa.Constants.Constant;
import SmartKa.Model.Cart;
import SmartKa.Model.LatestOrder;
import SmartKa.Model.Order;
import SmartKa.Model.OrderDetail;
import SmartKa.Service.JDBCConnection;

public class OrderDAO {
	public static Connection connection = new JDBCConnection().conn;
	public static ArrayList<Order> findByUsername(String username) {
		ArrayList<Order> arrayList = new ArrayList<Order>();

		String query = Constant.GET_ORDERS_BY_USERNAME_QUERY;
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				arrayList.add(new Order(rs.getInt(1), 
						rs.getString(2), rs.getString(3), rs.getInt(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8),
						rs.getString(9), rs.getString(10), rs.getString(11), OrderDAO.getOrderProductsByID(rs.getInt(1))));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return arrayList;
	}
	public static ArrayList<Order> findAll() {
		ArrayList<Order> arrayList = new ArrayList<Order>();
		
		String query = Constant.GET_ALL_ORDER_QUERY;
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				arrayList.add(new Order(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), 
						rs.getString(9), rs.getString(10), rs.getString(11)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return arrayList;
	}

	public static Order findByID(int id) {
		Order order = null;
		String query = Constant.GET_ORDER_BY_ID_QUERY;
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				order = new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}
	
	public static boolean save(Order order) {
		Order o = null;
		String query = Constant.ADD_ORDER_QUERY;
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, order.getUsername());
			ps.setString(2, order.getPayment_method());
			ps.setDouble(3, order.getTotal_money());
			ps.setString(4, order.getDate_checkout());
			ps.setString(5, order.getStatus());
			ps.setString(6, order.getAddress());
			ps.setString(7, order.getEmail());
			ps.setString(8, order.getFullname());
			ps.setString(9, order.getPhone());
			ps.setString(10, order.getNote());
			ps.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static void saveCart(OrderDetail orderDetail) {
		String query = Constant.ADD_ORDER_DETAIL_QUERY;
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, orderDetail.getProduct().getId());
			ps.setInt(2, orderDetail.getIdcheckout());
			ps.setInt(3, orderDetail.getQuantity());
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static ArrayList<OrderDetail> getOrderProductsByID(int id) {
		ArrayList<OrderDetail> details = new ArrayList<OrderDetail>();

		String query = Constant.GET_ORDER_PRODUCTS_BY_ID_QUERY;
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				details.add(new OrderDetail(rs.getInt(1), ProductDAO.getProductById(rs.getInt(2)),
						rs.getInt(3), rs.getInt(4)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return details;
	}
	
	public static void updateStatusOrder(int id, String status) {
		String query = Constant.UPDATE_STATUS_ORDER_QUERY;
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, status);
			ps.setInt(2, id);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static ArrayList<Order> findOrdersByStatus(String status) {
		ArrayList<Order> arrayList = new ArrayList<Order>();
		String query = Constant.GET_ORDERS_BY_STATUS_QUERY;

		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, status);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				arrayList.add(new Order(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7),
						rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						getOrderProductsByID(rs.getInt(1))));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return arrayList;
	}
	
	//lviet code
		public static ArrayList<LatestOrder> getLatestOrder() {
			ArrayList<LatestOrder> list = new ArrayList<LatestOrder>();
			try {
				String query = Constant.GET_LATEST_ORDER;
				PreparedStatement ps = new JDBCConnection().conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					LatestOrder bean = new LatestOrder(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6));
					list.add(bean);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return list;
		}
		public static int getPurchasedQuantity() {
			int totalbuy = 0;
			try {
				String query = "SELECT sum(quantity) FROM smartka.orderdetail";
				PreparedStatement ps = new JDBCConnection().conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					totalbuy = rs.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return totalbuy;
		}
		public static int getCartQuantity() {
			int cartq = 0;
			try {
				String query = "SELECT id,COUNT(id) FROM smartka.cart\r\n"
						+ "GROUP BY id\r\n"
						+ "";
				PreparedStatement ps = new JDBCConnection().conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					cartq +=1;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return cartq;
		}
		public static int getPurchasedCount() {
			int purchaseq = 0;
			try {
				String query = "SELECT COUNT(*) FROM smartka.`order`\r\n"
						+ "WHERE order.status = 'completed'";
				PreparedStatement ps = new JDBCConnection().conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					purchaseq = rs.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			return purchaseq;
		}


	public static void main(String[] args) {
		ArrayList<Order> orders = findAll();
		System.out.println(orders.get(orders.size() - 1).getId());
	}
}
