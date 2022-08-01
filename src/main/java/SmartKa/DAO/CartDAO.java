package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import SmartKa.Constants.Constant;
import SmartKa.Model.Cart;
import SmartKa.Model.Product;
import SmartKa.Response.ResponseObject;
import SmartKa.Service.JDBCConnection;

public class CartDAO {
	public static Connection connection = new JDBCConnection().conn;

	// Get Cart
	public static ArrayList<Cart> findAll(HttpSession session) {
		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		ArrayList<Cart> cartList = null;
		if (username == null || username.equals("")) {
			ArrayList<Cart> localCart = (ArrayList<Cart>) session.getAttribute(Constant.LOCAL_CART);
			if (localCart != null) {
				cartList = new ArrayList<Cart>();
				for (Cart cart : localCart) {
					cartList.add(new Cart(cart.getId(), cart.getQuantity(), cart.getUsername(), cart.getProduct()));
				}
			} else {
				cartList = null;
			}
		} else {
			try {
				String query = Constant.GET_CART_OF_USER_QUERY;
				PreparedStatement ps = CartDAO.connection.prepareStatement(query);
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				cartList = new ArrayList<Cart>();
				while (rs.next()) {
					cartList.add(new Cart(rs.getInt(1), rs.getInt(2), rs.getString(3),
							ProductDAO.getProductById(rs.getInt(4))));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cartList;
	}

	// Check Product in Cart
	public static boolean isProductInCart(int productID, HttpSession session) {
		ArrayList<Cart> cartList = findAll(session);
		if (cartList != null) {
			for (Cart cart : cartList) {
				if (productID == cart.getProduct().getId()) {
					return true;
				}
			}
		}
		return false;
	}

	public static int getQuantityOfCartItem(int productID, HttpSession session) {
		int quantity = 0;
		ArrayList<Cart> cartList = findAll(session);
		for (Cart cart : cartList) {
			if (cart.getProduct().getId() == productID) {
				quantity = cart.getQuantity();
			}
		}
		return quantity;
	}

	public static Cart getCartByUsernameAndProductID(String username, int productID) {
		Cart cart = new Cart();
		try {
			PreparedStatement ps = CartDAO.connection.prepareStatement(Constant.GET_CART_BY_ID_USERNAME_QUERY);
			ps.setString(1, username);
			ps.setInt(2, productID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cart.setId(rs.getInt(1));
				cart.setQuantity(rs.getInt(2));
				cart.setUsername(rs.getString(3));
				cart.setProduct(ProductDAO.getProductById(rs.getInt(4)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}

	public static Cart addUserCart(int quantity, int productID, HttpSession session) {
		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		Cart cart = null;
		try {
			if (CartDAO.isProductInCart(productID, session)) {
				int prevQuantity = CartDAO.getQuantityOfCartItem(productID, session);
				String query = Constant.UPDATE_CART_QUERY;
				PreparedStatement ps = CartDAO.connection.prepareStatement(query);
				ps.setInt(1, prevQuantity + quantity);
				ps.setString(2, username);
				ps.setInt(3, productID);
				ps.executeUpdate();
			} else {
				String query = Constant.ADD_CART_QUERY;
				PreparedStatement ps = CartDAO.connection.prepareStatement(query);
				ps.setInt(1, quantity);
				ps.setString(2, username);
				ps.setInt(3, productID);
				ps.execute();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cart = CartDAO.getCartByUsernameAndProductID(username, productID);
		return cart;
	}

	public static boolean updateUserCart(int quantity, int productId, int cartId, HttpSession session) {
		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		if (username == null || username.equals("")) {
			return false;
		} else {
			String query = Constant.UPDATE_CART_BY_ID_QUERY;
			try {
				PreparedStatement ps = CartDAO.connection.prepareStatement(query);
				ps.setInt(1, quantity);
				ps.setString(2, username);
				ps.setInt(3, cartId);
				ps.setInt(4, productId);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
	}

	public static ArrayList<Cart> getLocalCart(HttpSession session) {
		ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute(Constant.LOCAL_CART);
		return cart;
	}

	public static boolean isProductInLocalCart(int productID, HttpSession session) {
		ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute(Constant.LOCAL_CART);
		if (cart != null) {
			for (Cart c : cart) {
				if (c.getProduct().getId() == productID) {
					return true;
				}
			}
		}
		return false;
	}

	public static String addProductIntoLocalCart(int quantity, int productId, HttpSession session) {
		ArrayList<Cart> cart = CartDAO.getLocalCart(session);
		if (cart == null) {
			cart = new ArrayList<Cart>();
			cart.add(new Cart(quantity, (String) session.getAttribute(Constant.SESSION_USERNAME),
					ProductDAO.getProductById(productId)));
		} else {
			if (!CartDAO.isProductInLocalCart(productId, session)) {
				cart.add(new Cart(quantity, (String) session.getAttribute(Constant.SESSION_USERNAME),
						ProductDAO.getProductById(productId)));
			} else {
				for (Cart c : cart) {
					if (c.getProduct().getId() == productId) {
						c.setQuantity(c.getQuantity() + quantity);
					}
				}
			}
		}
		session.setAttribute(Constant.LOCAL_CART, cart);
		return "Add Product to local cart successfully! Login to view your cart.";
	}

	public static void addLocalCartToUserCart(HttpSession session) {
		ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute(Constant.LOCAL_CART);
		if (cart != null) {
			for (Cart c : cart) {
				CartDAO.addUserCart(c.getQuantity(), c.getProduct().getId(), session);
			}
			session.removeAttribute(Constant.LOCAL_CART);
		}
	}

	public static ResponseObject deleteCartItemByID(int id, HttpSession session) {
		ResponseObject response = new ResponseObject();
		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		if (username != null && !username.equals("")) {
			String query = Constant.DELETE_CART_QUERY;
			try {
				PreparedStatement ps = CartDAO.connection.prepareStatement(query);
				ps.setInt(1, id);
				ps.setString(2, username);
				ps.execute();
				response.setSuccess(true);
				response.setMessage("Delete successfully!");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			response.setSuccess(false);
			response.setMessage("User not access with this progress!");
		}
		return response;
	}
}