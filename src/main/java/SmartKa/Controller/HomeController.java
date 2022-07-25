package SmartKa.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import SmartKa.Constants.Constant;
import SmartKa.DAO.ProductDAO;
import SmartKa.DAO.UserDAO;
import SmartKa.Model.User;
import SmartKa.Model.UserInfo;
import SmartKa.Model.Product;
import SmartKa.Response.AuthResponse;
import SmartKa.Response.ResponseWithMessage;
import SmartKa.Validators.Validators;

@Controller
public class HomeController {
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
		System.out.println("Login Method");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User(username, password);
		AuthResponse loginResponse = UserDAO.loginToSystem(user);
		if (loginResponse.isSuccess()) {
			session.setAttribute(Constant.SESSION_USERNAME, user.getUser_name());
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
		UserInfo info = UserDAO.getUserInfo(username);
		if (info != null) {
			session.setAttribute(Constant.SESSION_USER_INFORMATION, info);
		}
		//set attribute to get avatar in UI
		String avt = UserDAO.getAvatar(username);
		if(avt != null ) {
			req.setAttribute("avatar", avt);
		}
		
		return HomeController.protectedUserRoute(session, "user/myaccount");
	}

	// link update avatar
	@RequestMapping(value = { "/update-avatar" }, method = RequestMethod.POST)
	public @ResponseBody void updateAvt(HttpSession session, HttpServletRequest req) {
		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		//set avt into database
		String avt = (String) req.getParameter("avt");
		if(avt != null) {
			UserDAO.setAvatar(avt, username);
		}
	}

	@RequestMapping(value = { "/aboutus" }, method = RequestMethod.GET)
	public String Aboutus() {
		return "user/aboutus";
	}

	@RequestMapping(value = { "/blog" }, method = RequestMethod.GET)
	public String Blog() {
		return "user/blog";
	}

	@RequestMapping(value = { "/blogdetails" }, method = RequestMethod.GET)
	public String Blogdetails() {
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

	@RequestMapping(value = { "/product" }, method = RequestMethod.GET)
	public String Product() {
		return "user/product";
	}

	@RequestMapping(value = { "/shop" }, method = RequestMethod.GET)
	public String Shop() {
		return "user/shop";
	}
}
