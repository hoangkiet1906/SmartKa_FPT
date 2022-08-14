package SmartKa.Constants;

public class Constant {
	public static final String SESSION_USERNAME = "username";
	public static final String SESSION_USER_INFORMATION = "userInfo";
	public static final String GET_ALL_ACCOUNTS_QUERY = "SELECT * FROM account";
	public static final String GET_ACCOUNT_BY_ROLE_QUERY = "SELECT * FROM account where role = ?";
	public static final String CHECK_ACCOUNT_QUERY = "SELECT * FROM account WHERE user_name = ?";
	public static final String ADD_USER_QUERY = "INSERT INTO account (user_name, password, date, role) VALUE (?, ?, ?, ?)";
	public static final String GET_USER_INFO_BY_USERNAME_QUERY = "SELECT * FROM info WHERE user_name = ?";
	public static final String ADD_USER_INFO_QUERY = "INSERT INTO info (fullname, avatar, phone, email, address, deliveryaddress, user_name) VALUES (?,?,?,?,?,?,?)";
	public static final String UPDATE_USER_INFO_QUERY = "UPDATE info SET fullname = ?, avatar = ?, phone = ?, email = ?, address = ?, deliveryaddress = ? WHERE user_name = ?";

	// lviet
	public static final String GET_ALL_BLOG_QUERY = "SELECT * FROM blog WHERE STATUS = 1";
	public static final String GET_ALL_BLOG = "SELECT * FROM blog";
	public static final String GET_BLOG_BY_ID_QUERY = "SELECT * FROM BLOG WHERE IDBLOG = ? HAVING STATUS =1";
	public static final String GET_LATEST_2_BLOG = "SELECT * FROM blog HAVING STATUS = 1 order BY DATE DESC LIMIT 3";
	public static final String GET_NUMBER_OF_BLOG = "SELECT COUNT(*) FROM BLOG WHERE STATUS=1";
	public static final String GET_BLOG_PER_PAGE = "SELECT * FROM blog HAVING STATUS = 1 order by date desc LIMIT ?,?";
	public static final int NO_BLOG_PER_PAGE = 6;
	public static final int START_BLOG = 1;
	public static final String GET_ALL_BLOG_TAG = "SELECT DISTINCT TAG FROM BLOG";
	public static final String GET_BLOG_BY_TAG = "SELECT * FROM blog WHERE TAG = ? and status=1 order BY DATE DESC LIMIT ?,?";
	public static final String GET_NO_BLOG_BY_TAG = "SELECT COUNT(*) FROM BLOG WHERE TAG = ? and status = 1";
	public static final String SEARCH_BLOG_BY_NAME = "SELECT * FROM blog WHERE title LIKE ? having status =1 order BY DATE DESC LIMIT ?,?";
	public static final String COUNT_SEARCHED_BLOG = "SELECT COUNT(*) FROM blog WHERE title LIKE ? and status=1 order BY DATE DESC";
	public static final String GET_OUTSTANDING_REVENUE = "\r\n"
			+ "SELECT  product.name, product.image, product.price,sum(orderdetail.quantity)\r\n"
			+ "FROM product\r\n"
			+ "INNER JOIN orderdetail\r\n"
			+ "ON product.id = orderdetail.id\r\n"
			+ "GROUP BY product.name\r\n";
	public static final String GET_RARELY_BOUGHT_PRODUCT = "SELECT  product.name, product.image, product.price,sum(orderdetail.quantity)\r\n"
			+ "FROM product\r\n"
			+ "LEFT outer JOIN orderdetail\r\n"
			+ "ON product.id = orderdetail.id\r\n"
			+ "GROUP BY product.name\r\n"
			+ "HAVING SUM(orderdetail.quantity) IS null\r\n";
	public static final String GET_TOTAL_MONEY_WEEKLY = "SELECT SUM(total_money) , date_checkout FROM smartka.order \n"
			+ "GROUP BY date_checkout \n"
			+ "HAVING (date_checkout BETWEEN ? AND ?)";
	public static final String GET_LOYAL_CUS = "SELECT avatar, order.user_name, SUM(total_money) AS total_money, COUNT(order.user_name) AS total_order\r\n"
			+ "FROM smartka.order\r\n"
			+ "INNER JOIN smartka.info\r\n"
			+ "ON order.user_name = info.user_name\r\n"
			+ "GROUP BY order.user_name\r\n"
			+ "order BY total_money DESC";
	public static final String GET_LATEST_ORDER = " SELECT o.idcheckout,o.date_checkout, o.user_name, o.payment_method, o.`status`, o.total_money FROM smartka.`order` AS o\r\n"
			+ " order BY date_checkout DESC LIMIT 10 \r\n";
	
	
	// cmt product
	public static final String GET_CMT_PRODUCT = "SELECT c.cmtpro, c.cmtdatepro, c.user_name, i.avatar FROM cmtproduct AS c INNER JOIN info AS i ON (c.user_name = i.user_name)  WHERE c.id = ?";
	public static final String ADD_CMT_PRODUCT = "INSERT INTO cmtproduct (cmtpro, cmtdatepro, user_name, id) values (?, ?, ?, ?)";

	// cmt blog
	public static final String GET_CMT_BLOG = "SELECT c.cmtblog, c.cmtdate, c.user_name, i.avatar FROM cmtblog AS c INNER JOIN info AS i ON (c.user_name = i.user_name) WHERE c.idblog = ?";
	public static final String ADD_CMT_BLOG = "INSERT INTO cmtblog (cmtblog, cmtdate, user_name, idblog) VALUES (?, ?, ?, ?)";

//	Shop
	// get Product
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

	// get Tag
	// get tag for hompage (1 product / 1 tag)
	public static final String GET_PRODUCT_BY_TAG_LIMIT = "SELECT * FROM product WHERE tag = ? LIMIT 1";

	// get all product by tag
	public static final String GET_PRODUCT_BY_TAG = "SELECT * FROM product WHERE tag = ?";

	// get tag list
	public static final String GET_TAG_PRODUCT = "SELECT DISTINCT tag FROM product";

	// count
	public static final String COUNT_ALL_PRODUCT = "SELECT COUNT(*) FROM product";
	public static final String GET_NUMBER_CATE = "SELECT tag , COUNT(*) AS quantity FROM product GROUP BY tag";

	// const
	public static final int NUMBER_OF_PRODUCT_PER_PAGE = 9;
	public static final int FIRST_PRODUCT_NUMBER = 1;

	// ktoan
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
			+ "idcheckout, quantity) " + "VALUES (?, ?, ?)";
	public static final String GET_ORDERS_BY_STATUS_QUERY = "SELECT * FROM smartka.order where status = ?";
	
	//order
	public static final String GET_ORDERS_BY_USERNAME_QUERY = "SELECT * FROM smartka.order where user_name = ? order by status asc";
	public static final String GET_ORDER_PRODUCTS_BY_ID_QUERY = "SELECT * FROM smartka.orderdetail where idcheckout = ?";
	
	public static final String GET_WORKS_BY_STATUS_QUERY = "SELECT id, staff_name, work.idcheckout, user_name, payment_method, total_money, date_checkout, status, address, email, fullname, phone, note FROM `work` inner join `order` on `work`.idcheckout = `order`.idcheckout where `order`.status = ? order by id ;";
	public static final String GET_WORKS_BY_STATUS_AND_NAME_QUERY = "SELECT id, staff_name, work.idcheckout, user_name, payment_method, total_money, date_checkout, status, address, email, fullname, phone, note FROM `work` inner join `order` on `work`.idcheckout = `order`.idcheckout where `order`.status = ? and staff_name = ? order by id ;";

// end shop

	// qhai - admin user manage
	public static final String ADMIN_GET_USER_MANAGE = "SELECT * FROM info INNER JOIN account "
			+ "ON (account.user_name = info.user_name) " + "WHERE DATE >= ? AND DATE <= ? order BY DATE desc LIMIT ?";
	public static final int NO_USER_IN_ADMIN_MANAGE = 8;
	
	public static final String GET_ALL_SUPPORT = "SELECT * FROM smartka.support inner join smartka.info on support.user_name = info.user_name";
	
	public static final String SAVE_WORK_QUERY = "insert into smartka.work (staff_name, idcheckout) values (?, ?)";

	public static final String UPDATE_STATUS_ORDER_QUERY = "update smartka.order set status = ? where idcheckout = ?";
	
	// blog manager
				public static final String SELECT_BLOG_PAGE1 = "SELECT * FROM blog WHERE idblog <= 6";
				public static final String SELECT_BLOG_PAGE2 = "SELECT * FROM blog WHERE idblog > 6";
				public static final String UPDATE_BLOG ="UPDATE blog SET title = ?, content = ?, image = ?, tag = ?, ct1 = ?, ct2 = ?, ct3 = ?, img1 = ?, img2 = ? WHERE idblog = ?";
				public static final String UPDATE_BLOG_NOT_IMG ="UPDATE blog SET title = ?, content = ?, tag = ?, ct1 = ?, ct2 = ?, ct3 = ? WHERE idblog = ?";
				public static final String UPDATE_STATUS_BLOG = "UPDATE blog SET status = ? WHERE idblog = ?";			
				public static final String SELECT_BLOG_STATUS = "SELECT status FROM blog WHERE idblog = ?";
				public static final String DELETE_BLOG = "DELETE FROM blog WHERE idblog = ?";
				public static final String COUNT_BLOG = "SELECT idblog FROM blog ORDER BY IDBLOG DESC LIMIT 1";
				public static final String INSERT_BLOG = "INSERT INTO blog (idblog, title, author, content, date, image, tag, ct1, ct2, ct3, img1, img2) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?)";
	// product manager
				public static final String UPDATE_PRODUCT ="UPDATE product SET name = ?, price = ?, quantity = ?, image = ?,description = ? , tag = ?, status = ? WHERE id = ?";
				public static final String UPDATE_PRODUCT_NOT_IMG ="UPDATE product SET name = ?, price = ?, quantity = ?,description = ? , tag = ?, status = ? WHERE id = ?";
				public static final String DELETE_PRODUCT ="DELETE FROM product WHERE id = ?";
				public static final String INSERT_PRODUCT ="INSERT INTO product (id, name, price, quantity, image, description, tag, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
				public static final String GET_ID_LAST_PRODUCT ="SELECT id FROM product ORDER BY ID DESC LIMIT 1";
}