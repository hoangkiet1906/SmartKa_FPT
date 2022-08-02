package SmartKa.Controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import SmartKa.Constants.Constant;
import SmartKa.DAO.BlogDAO;
import SmartKa.DAO.OrderDAO;
import SmartKa.DAO.ProductDAO;
import SmartKa.DAO.UserDAO;
import SmartKa.Model.User;
import SmartKa.Model.UserInfo;
import SmartKa.Model.Blog;
import SmartKa.Model.BlogControl;
import SmartKa.Model.CateNumber;
import SmartKa.Model.Order;
import SmartKa.Model.Pagishop;
import SmartKa.Model.Product;
import SmartKa.Response.AuthResponse;
import SmartKa.Response.ResponseWithMessage;
import SmartKa.Service.impl.CartService;
import SmartKa.Validators.Validators;

@Controller
public class HomeController {
	@Autowired
	CartService cartService;

	// Protected Route
	public static String protectedAuthRoute(HttpSession session, String nextPage) {
		if (session.getAttribute(Constant.SESSION_USERNAME) != null) {
			return "redirect:/";
		}
		return nextPage;
	}

	public static String protectedUserRoute(HttpSession session, String nextPage) {
		if (session.getAttribute(Constant.SESSION_USERNAME) == null) {
			return "redirect:/auth";
		}
		return nextPage;
	}

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String Index(HttpServletRequest req) {
		ArrayList<Product> cateList = ProductDAO.getProductByTag();
		req.setAttribute("cateList", cateList);
		req.setAttribute("productNews", ProductDAO.getProductByStatus("New Arrivals"));
		req.setAttribute("productBests", ProductDAO.getProductByStatus("Best Sellers"));
		req.setAttribute("productSales", ProductDAO.getProductByStatus("Sale Items"));
		return "user/index";
	}

	@RequestMapping(value = { "/auth" }, method = RequestMethod.GET)
	public String Login(HttpSession session) {
		return HomeController.protectedAuthRoute(session, "user/login");
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public @ResponseBody String postLogin(HttpSession session, HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User(username, password);
		AuthResponse loginResponse = UserDAO.loginToSystem(user);
		if (loginResponse.isSuccess()) {
			session.setAttribute(Constant.SESSION_USERNAME, user.getUser_name());
			UserInfo info = UserDAO.getUserInfo(username);
			if (info != null) {
				session.setAttribute(Constant.SESSION_USER_INFORMATION, info);
			}
			cartService.addLocalCartIntoDB(session);
		}
		String ajaxResponse = "";
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			ajaxResponse = objectMapper.writeValueAsString(loginResponse);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public @ResponseBody String postRegister(HttpSession session, HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		AuthResponse registerResponse = new AuthResponse();
		if (!Validators.validPassword(password)) {
			registerResponse.setMessage("Password is least 6 character!");
			registerResponse.setSuccess(false);
		} else if (!Validators.confirmationPassword(password, confirmPassword)) {
			registerResponse.setMessage("Confirmation password isn't matched!");
			registerResponse.setSuccess(false);
		} else {
			registerResponse = UserDAO.addUserIntoDatabase(new User(username, password));
		}
		if (registerResponse.isSuccess()) {
			session.setAttribute(Constant.SESSION_USERNAME, username);
			UserInfo info = UserDAO.getUserInfo(username);
			if (info != null) {
				session.setAttribute(Constant.SESSION_USER_INFORMATION, info);
			}
			cartService.addLocalCartIntoDB(session);
		}
		String ajaxResponse = "";
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			ajaxResponse = objectMapper.writeValueAsString(registerResponse);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public @ResponseBody String logout(HttpSession session) {
		AuthResponse authResponse = new AuthResponse();
		try {
			session.removeAttribute(Constant.SESSION_USERNAME);
			session.removeAttribute(Constant.SESSION_USER_INFORMATION);
			authResponse.setMessage("Logout successfully!");
			authResponse.setSuccess(true);
		} catch (Exception e) {
			authResponse.setMessage("Logout failed. Have some problems!");
			authResponse.setSuccess(false);
		}
		String ajaxResponse = "";
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			ajaxResponse = objectMapper.writeValueAsString(authResponse);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = "/update-userInfo", method = RequestMethod.POST)
	public @ResponseBody String updateUserInfo(HttpSession session, HttpServletRequest request) {
		ResponseWithMessage response = new ResponseWithMessage();
		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		if (username == null || username.equals("")) {
			response.setMessage("You must login to access this action");
			response.setSuccess(false);
		} else {
			String email = request.getParameter("email");
			if (Validators.validEmail(email)) {
				String fullname = request.getParameter("fullname");
				String phoneNumber = request.getParameter("phoneNumber");
				String address = request.getParameter("address");
				String deliveryAddress = request.getParameter("deliveryAddress");
				UserInfo userInfo = new UserInfo();
				userInfo.setFullname(fullname);
				userInfo.setEmail(email);
				userInfo.setPhone(phoneNumber);
				userInfo.setAddress(address);
				userInfo.setDaddress(deliveryAddress);
				userInfo.setUsername(username);
				if (UserDAO.getUserInfo(username) == null) {
					response.setSuccess(true);
					response.setMessage(UserDAO.addUserInfo(userInfo));
				} else {
					response.setSuccess(true);
					response.setMessage(UserDAO.updateUserInfo(username, userInfo));
					session.setAttribute(Constant.SESSION_USER_INFORMATION, UserDAO.getUserInfo(username));
				}
			} else {
				response.setMessage("Invalid Email!");
				response.setSuccess(false);
			}
		}
		String ajaxResponse = "";
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			ajaxResponse = objectMapper.writeValueAsString(response);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = { "/info" }, method = RequestMethod.GET)
	public String Info(HttpSession session, HttpServletRequest req) {
		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		ArrayList<Order> orders = OrderDAO.findByUsername(username);
		req.setAttribute("orders", orders);
		// set attribute to get avatar in UI
		String avt = UserDAO.getAvatar(username);
		if (avt != null) {
			req.setAttribute("avatar", avt);
		}

		return HomeController.protectedUserRoute(session, "user/myaccount");
	}

	// link update avatar
	@RequestMapping(value = { "/update-avatar" }, method = RequestMethod.POST)
	public @ResponseBody void updateAvt(HttpSession session, HttpServletRequest req) {
		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		// set avt into database
		String avt = (String) req.getParameter("avt");
		if (avt != null) {
			UserDAO.setAvatar(avt, username);
		}
	}

	@RequestMapping(value = { "/aboutus" }, method = RequestMethod.GET)
	public String Aboutus() {
		return "user/aboutus";
	}

	@RequestMapping(value = { "/blog" }, method = RequestMethod.GET)
	public String Blog(HttpServletRequest req) {
		ArrayList<Blog> latestBlog = BlogDAO.getLatestBlog();
		req.setAttribute("latestBlog", latestBlog);
		ArrayList blogTag = BlogDAO.getBlogTag();
		req.setAttribute("blogTag", blogTag);
		return "user/blog";
	}

	@RequestMapping(value = { "/getblog" }, method = RequestMethod.GET)
	public @ResponseBody String loadBlog(HttpServletRequest req) throws ParseException, ServletException, IOException {
		int currentPage;
		if (req.getParameter("page") == null || req.getParameter("page").equals("")) {
			currentPage = 1;
		} else {
			currentPage = Integer.valueOf(req.getParameter("page"));
		}

		int noBlog = Integer.parseInt(BlogDAO.getNOBlog());
		int pageSize = Constant.NO_BLOG_PER_PAGE;
		int endPage = 0;
		int startBlog = Constant.START_BLOG + pageSize * (currentPage - 1);
		if (noBlog < 6) {
			endPage = 1;
		} else {
			endPage = noBlog / pageSize;
			if (noBlog % pageSize != 0) {
				endPage++;
			}
		}
		ArrayList<Blog> blogList = BlogDAO.getBlog(startBlog, pageSize);
		BlogControl bean = new BlogControl(blogList, endPage);
		ObjectMapper mapper = new ObjectMapper();
		String ajaxresp = "";
		try {
			ajaxresp = mapper.writeValueAsString(bean);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ajaxresp;
	}

	@RequestMapping(value = { "/searchblog" }, method = RequestMethod.GET)
	public @ResponseBody String SearchBlog(HttpServletRequest req) {
		int currentPage;
		if (req.getParameter("page") == null || req.getParameter("page").equals("")) {
			currentPage = 1;
		} else {
			currentPage = Integer.valueOf(req.getParameter("page"));
		}
		String key = String.valueOf(req.getParameter("keytxt"));
		int pageSize = Constant.NO_BLOG_PER_PAGE;
		int endPage = 0;
		int startBlog = Constant.START_BLOG + pageSize * (currentPage - 1);
		int noBlog = Integer.valueOf(BlogDAO.getNOBlogSearched(key));
		if (noBlog < 6) {
			endPage = 1;
		} else {
			endPage = noBlog / pageSize;
			if (noBlog % pageSize != 0) {
				endPage++;
			}
		}
		ArrayList<Blog> blogList = BlogDAO.getsearchBlog(key, startBlog, pageSize);
		BlogControl bean = new BlogControl(blogList, endPage);
		ObjectMapper mapper = new ObjectMapper();
		String ajaxresp = "";
		try {
			ajaxresp = mapper.writeValueAsString(bean);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ajaxresp;
	}

	@RequestMapping(value = { "/tagblog" }, method = RequestMethod.GET)
	public @ResponseBody String tagBlog(HttpServletRequest req) {
		int currentPage;
		if (req.getParameter("page") == null || req.getParameter("page").equals("")) {
			currentPage = 1;
		} else {
			currentPage = Integer.valueOf(req.getParameter("page"));
		}
		String tag = String.valueOf(req.getParameter("tag"));
		int pageSize = Constant.NO_BLOG_PER_PAGE;
		int endPage = 0;
		int startBlog = Constant.START_BLOG + pageSize * (currentPage - 1);
		int noBlog = Integer.valueOf(BlogDAO.getNOBlogTag(tag));
		if (noBlog < 6) {
			endPage = 1;
		} else {
			endPage = noBlog / pageSize;
			if (noBlog % pageSize != 0) {
				endPage++;
			}
		}
		ArrayList<Blog> blogList = BlogDAO.getBlogByTag(tag, startBlog, pageSize);
		BlogControl bean = new BlogControl(blogList, endPage);
		ObjectMapper mapper = new ObjectMapper();
		String ajaxresp = "";
		try {
			ajaxresp = mapper.writeValueAsString(bean);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ajaxresp;
	}

	@RequestMapping(value = { "/blogdetails" }, method = RequestMethod.GET, params = { "bid" })
	public String Blogdetails(HttpServletRequest req) {
		ArrayList<Blog> latestBlog = BlogDAO.getLatestBlog();
		req.setAttribute("latestBlog", latestBlog);
		ArrayList blogTag = BlogDAO.getBlogTag();
		req.setAttribute("blogTag", blogTag);
		int blogID = Integer.parseInt(req.getParameter("bid"));
		Blog blogdetail = BlogDAO.getBlogByID(blogID);
		req.setAttribute("blogdetail", blogdetail);
		req.setAttribute("idblog", blogID);

		//
		Blog nextBlogDetail = BlogDAO.getBlogByID(blogID + 1);
		if (nextBlogDetail == null) {
			req.setAttribute("nextBlogTitle", "No Newest Blog");
			req.setAttribute("nextBlogDate", "No Newest Blog");
			req.setAttribute("nextbid", "No Newest Blog");
		} else {
			req.setAttribute("nextBlogTitle", nextBlogDetail.getTitle());
			req.setAttribute("nextBlogDate", nextBlogDetail.getDate());
			req.setAttribute("nextbid", nextBlogDetail.getIdblog());
		}
		Blog prevBlogDetail = BlogDAO.getBlogByID(blogID - 1);
		if (prevBlogDetail == null) {
			req.setAttribute("prevBlogTitle", "No Newest Blog");
			req.setAttribute("prevBlogDate", "No Newest Blog");
			req.setAttribute("prevbid", "No Newest Blog");
		} else {
			req.setAttribute("prevBlogTitle", prevBlogDetail.getTitle());
			req.setAttribute("prevBlogDate", prevBlogDetail.getDate());
			req.setAttribute("prevbid", prevBlogDetail.getIdblog());
		}

		//
		return "user/blogdetails";
	}

	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public String Cart() {
		return "user/cart";
	}

	@RequestMapping(value = { "/checkout" }, method = RequestMethod.GET)
	public String Checkout() {
		return "user/checkout";
	}

	@RequestMapping(value = { "/contactus" }, method = RequestMethod.GET)
	public String Contactus() {
		return "user/contactus";
	}

	// link send feedback
	@RequestMapping(value = { "/sendFeedback" }, method = RequestMethod.GET)
	public @ResponseBody String sendFeedback(HttpSession session, HttpServletRequest req) {

		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		String content = req.getParameter("content");
		ResponseWithMessage response = new ResponseWithMessage();
		if (content != "" && username != null) {
			UserDAO.addFeedback(content, username);
			response.setSuccess(true);
			response.setMessage("Thank You! Your message has been sent.");
		} else {
			response.setSuccess(false);
			response.setMessage("Oops! Something went wrong.");
		}

		String ajaxResponse = "";
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			ajaxResponse = objectMapper.writeValueAsString(response);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}

	@RequestMapping(value = { "/product" }, method = RequestMethod.GET, params = { "id", "tag" })
	public String Product(HttpServletRequest req) {

		int id = Integer.parseInt(req.getParameter("id"));
		String tag = req.getParameter("tag");

		Product product = ProductDAO.getProductById(id);
		ArrayList<Product> relatedProduct = ProductDAO.getAllProductByTag(tag);

		req.setAttribute("product", product);
		req.setAttribute("id", id);
		req.setAttribute("relatedProduct", relatedProduct);

		return "user/product";
	}

	@RequestMapping(value = { "/shop" }, method = RequestMethod.GET)
	public String Shop(HttpServletRequest req) {
		ArrayList<CateNumber> cateList = ProductDAO.getProductTagList();
		req.setAttribute("cateList", cateList);
		return "user/shop";
	}

	@RequestMapping(value = { "/getShop" }, method = RequestMethod.GET)
	public @ResponseBody String getShop(HttpServletRequest req) {

		String response = "";
		int page;
		int sizeOfPage = Constant.NUMBER_OF_PRODUCT_PER_PAGE;
		int allProductCount = ProductDAO.countProduct();

		if (req.getParameter("page") == null || req.getParameter("page").equals("")) {
			page = 1;
		} else {
			page = Integer.parseInt(req.getParameter("page"));
		}

		ArrayList<Product> products = ProductDAO.getProductPerPage(page);

		int totalPage = 0;

		int pageNumber = allProductCount / sizeOfPage;
		int pageNumberDu = allProductCount % sizeOfPage;

		if (pageNumberDu > 0) {
			totalPage = pageNumber + 1;
		} else
			totalPage = pageNumber;

		int startProduct = 1 + (page - 1) * sizeOfPage;
		int endProduct = 0;
		if (page * sizeOfPage < allProductCount) {
			endProduct = page * sizeOfPage;
		} else
			endProduct = allProductCount;

		Pagishop pagishop = new Pagishop(products, totalPage, page, startProduct, endProduct, allProductCount);

		ObjectMapper objectMapper = new ObjectMapper();

		try {
			response = objectMapper.writeValueAsString(pagishop);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return response;
	}

	// by tag
	@RequestMapping(value = { "/shopTag" }, method = RequestMethod.GET)
	public @ResponseBody String shopTag(HttpServletRequest req) {

		String response = "";
		int page;
		int sizeOfPage = Constant.NUMBER_OF_PRODUCT_PER_PAGE;

		if (req.getParameter("page") == null || req.getParameter("page").equals("")) {
			page = 1;
		} else {
			page = Integer.parseInt(req.getParameter("page"));
		}

		String tag = String.valueOf(req.getParameter("tag"));

		ArrayList<Product> list = ProductDAO.getAllProductByTag(tag);
		int allProductByTagCount = list.size();

		int totalPage = 0;

		int pageNumber = allProductByTagCount / sizeOfPage;
		int pageNumberDu = allProductByTagCount % sizeOfPage;

		if (pageNumberDu > 0) {
			totalPage = pageNumber + 1;
		} else
			totalPage = pageNumber;

		ArrayList<Product> listReturn = ProductDAO.getProductByTagPerPage(tag, page);

		int startProduct = 1 + (page - 1) * sizeOfPage;
		int endProduct = 0;
		if (page * sizeOfPage < allProductByTagCount) {
			endProduct = page * sizeOfPage;
		} else
			endProduct = allProductByTagCount;

		Pagishop pagishop = new Pagishop(listReturn, totalPage, page, startProduct, endProduct, allProductByTagCount);

		ObjectMapper mapper = new ObjectMapper();
		try {
			response = mapper.writeValueAsString(pagishop);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return response;
	}

	// search
	@RequestMapping(value = { "/searchProduct" }, method = RequestMethod.GET)
	public @ResponseBody String searchProduct(HttpServletRequest req) {

		String response = "";
		int page;
		int sizeOfPage = Constant.NUMBER_OF_PRODUCT_PER_PAGE;

		if (req.getParameter("page") == null || req.getParameter("page").equals("")) {
			page = 1;
		} else {
			page = Integer.parseInt(req.getParameter("page"));
		}

		String productKey = String.valueOf(req.getParameter("productKey"));

		ArrayList<Product> list = ProductDAO.getAllSearchProduct(productKey);
		int allSearchProductCount = list.size();

		int totalPage = 0;

		int pageNumber = allSearchProductCount / sizeOfPage;
		int pageNumberDu = allSearchProductCount % sizeOfPage;

		if (pageNumberDu > 0) {
			totalPage = pageNumber + 1;
		} else
			totalPage = pageNumber;

		ArrayList<Product> listReturn = ProductDAO.getSearchProductPerPage(productKey, page);

		int startProduct = 1 + (page - 1) * sizeOfPage;
		int endProduct = 0;
		if (page * sizeOfPage < allSearchProductCount) {
			endProduct = page * sizeOfPage;
		} else
			endProduct = allSearchProductCount;

		Pagishop pagishop = new Pagishop(listReturn, totalPage, page, startProduct, endProduct, allSearchProductCount);

		ObjectMapper mapper = new ObjectMapper();
		try {
			response = mapper.writeValueAsString(pagishop);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return response;
	}
	
	// qhai new
		@RequestMapping(value = { "/productModal" }, method = RequestMethod.GET)
		public@ResponseBody String productModal(HttpServletRequest req) {
			
			String response = "";
			int id = Integer.parseInt(req.getParameter("id"));
			Product product = ProductDAO.getProductById(id);
			
			ObjectMapper mapper = new ObjectMapper();
			try {
				response = mapper.writeValueAsString(product);
			} catch (Exception e) {
				// TODO: handle exception
			}
			return response;
		}
//		end new
}
