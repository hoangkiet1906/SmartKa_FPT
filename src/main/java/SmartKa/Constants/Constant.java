package SmartKa.Constants;

public class Constant {
	public static final String SESSION_USERNAME = "username";
	public static final String SESSION_USER_INFORMATION = "userInfo";
	public static final String GET_ALL_ACCOUNTS_QUERY = "SELECT * FROM account";
	public static final String CHECK_ACCOUNT_QUERY = "SELECT * FROM account WHERE user_name = ?";
	public static final String ADD_USER_QUERY = "INSERT INTO account (user_name, password, date) VALUE (?, ?, ?)";
	public static final String GET_USER_INFO_BY_USERNAME_QUERY = "SELECT * FROM info WHERE user_name = ?";
	public static final String ADD_USER_INFO_QUERY = "INSERT INTO info (fullname, avatar, phone, email, address, deliveryaddress, user_name) VALUES (?,?,?,?,?,?,?)";
	public static final String UPDATE_USER_INFO_QUERY = "UPDATE info SET fullname = ?, avatar = ?, phone = ?, email = ?, address = ?, deliveryaddress = ? WHERE user_name = ?";

	// lviet
	public static final String GET_ALL_BLOG_QUERY = "SELECT * FROM BLOG";
	public static final String GET_BLOG_BY_ID_QUERY = "SELECT * FROM BLOG WHERE IDBLOG = ?";
	public static final String GET_LATEST_2_BLOG = "SELECT * FROM blog order BY DATE DESC LIMIT 3";
	public static final String GET_NUMBER_OF_BLOG = "SELECT COUNT(*) FROM BLOG";
	public static final String GET_BLOG_PER_PAGE = "SELECT * FROM blog order by date desc LIMIT ?,?";
	public static final int NO_BLOG_PER_PAGE = 6;
	public static final int START_BLOG = 1;
	public static final String GET_ALL_BLOG_TAG = "SELECT DISTINCT TAG FROM BLOG";
	public static final String GET_BLOG_BY_TAG = "SELECT * FROM blog WHERE TAG = ? order BY DATE DESC LIMIT ?,?";
	public static final String GET_NO_BLOG_BY_TAG = "SELECT COUNT(*) FROM BLOG WHERE TAG = ?";
	public static final String SEARCH_BLOG_BY_NAME = "SELECT * FROM blog WHERE title LIKE ? order BY DATE DESC LIMIT ?,?";
	public static final String COUNT_SEARCHED_BLOG = "SELECT COUNT(*) FROM blog WHERE title LIKE ? order BY DATE DESC";

	// cmt product
	public static final String GET_CMT_PRODUCT = "SELECT c.cmtpro, c.cmtdatepro, c.user_name, i.avatar FROM cmtproduct AS c INNER JOIN info AS i ON (c.user_name = i.user_name)  WHERE c.id = ?";
	public static final String ADD_CMT_PRODUCT = "INSERT INTO cmtproduct (cmtpro, cmtdatepro, user_name, id) values (?, ?, ?, ?)";

	// cmt blog
	public static final String GET_CMT_BLOG = "SELECT c.cmtblog, c.cmtdate, c.user_name, i.avatar FROM cmtblog AS c INNER JOIN info AS i ON (c.user_name = i.user_name) WHERE c.idblog = ?";
	public static final String ADD_CMT_BLOG = "INSERT INTO cmtblog (cmtblog, cmtdate, user_name, idblog) VALUES (?, ?, ?, ?)";
	
//	Shop
	//	get Product
		// all
			public static final String GET_ALL_PRODUCT = "SELECT * FROM product";
			
		// per page
			public static final String GET_PRODUCT_PER_PAGE = "SELECT * FROM product LIMIT ?,?";
			
		// by status
			public static final String GET_PRODUCT_BY_STATUS = "SELECT * FROM product WHERE status = ?";
		
		// by id
			public static final String GET_PRODUCT_BY_ID = "SELECT * FROM product WHERE id = ?";
	
	// search
			public static final String KEY_SEARCH = "?";
			public static final String SEARCH_PRODUCT = "SELECT * FROM product WHERE name like ?";
	
	
	//	get Tag
		// get tag for hompage (1 product / 1 tag)
			public static final String GET_PRODUCT_BY_TAG_LIMIT = "SELECT * FROM product WHERE tag = ? LIMIT 1";
			
		// get all product by tag
			public static final String GET_PRODUCT_BY_TAG = "SELECT * FROM product WHERE tag = ?";
			
		// get tag list
			public static final String GET_TAG_PRODUCT = "SELECT DISTINCT tag FROM product";
	
	//	count
			public static final String COUNT_ALL_PRODUCT = "SELECT COUNT(*) FROM product";
			public static final String GET_NUMBER_CATE = "SELECT tag , COUNT(*) AS quantity FROM product GROUP BY tag";
	
	//	const
			public static final int NUMBER_OF_PRODUCT_PER_PAGE = 9;
			public static final int FIRST_PRODUCT_NUMBER = 1;
			
	//ktoan
			public static final String LOCAL_CART = "localCart";
			public static final String GET_PRODUCT_BY_ID_QUERY = "SELECT * FROM product WHERE id = ?";
			public static final String GET_CART_OF_USER_QUERY = "SELECT * FROM cart WHERE user_name = ?";
			public static final String ADD_CART_QUERY = "INSERT INTO cart (cartquantity, user_name, id) VALUES (?, ?, ?)";
			public static final String UPDATE_CART_QUERY = "UPDATE cart SET cartquantity = ? WHERE user_name = ? and id = ?";
			public static final String GET_CART_BY_ID_USERNAME_QUERY = "SELECT * FROM cart WHERE user_name = ? AND id = ?";
			public static final String DELETE_CART_QUERY = "DELETE FROM cart WHERE idcart = ? and user_name = ?";
			public static final String UPDATE_CART_BY_ID_QUERY = "UPDATE cart SET cartquantity = ? WHERE user_name = ? and idcart = ? and id = ?";
			public static final String GET_ORDER_BY_ID_QUERY = "SELECT * FROM smartka.order where idcheckout = ?";
			public static final String GET_ALL_ORDER_QUERY = "SELECT * FROM smartka.order";
			public static final String ADD_ORDER_QUERY = "INSERT INTO smartka.order(user_name, payment_method, "
					+ "total_money, date_checkout, status, address, email, fullname, phone, note) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			public static final String ADD_ORDER_DETAIL_QUERY = "INSERT INTO smartka.orderdetail(id, "
					+ "idcheckout, quantity) "
					+ "VALUES (?, ?, ?)";
			
	// qhai - admin user manage
			public static final String ADMIN_GET_USER_MANAGE = "SELECT * FROM info INNER JOIN account "
					+ "ON (account.user_name = info.user_name) "
					+ "WHERE DATE >= ? AND DATE <= ? order BY DATE desc LIMIT ?";
			public static final int NO_USER_IN_ADMIN_MANAGE = 8;
}