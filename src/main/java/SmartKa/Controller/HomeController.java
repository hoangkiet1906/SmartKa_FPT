package SmartKa.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import SmartKa.Constants.Constant;
import SmartKa.DAO.ProductDAO;
import SmartKa.DAO.UserDAO;
import SmartKa.Model.User;
import SmartKa.Model.Product;
import SmartKa.Response.AuthResponse;

@Controller
public class HomeController {
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public String Index(HttpServletRequest req) {
		ArrayList<Product> cateList =  ProductDAO.getProductByTag();
		req.setAttribute("cateList", cateList );
		return "user/index";
	}
	
	@RequestMapping(value = {"/auth"}, method = RequestMethod.GET)
	public String Login() {
		return "user/login";
	}
	
	@RequestMapping(value = {"/login"}, method = RequestMethod.POST)
	public String postLogin(HttpSession session,HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User(username, password);
		AuthResponse loginResponse = UserDAO.loginToSystem(user);
		if (loginResponse.isSuccess()) {
			session.setAttribute(Constant.SESSION_USERNAME, user.getUser_name());
			request.setAttribute("message", loginResponse.getMessage());
			return "user/index";
		} else {
			request.setAttribute("message", loginResponse.getMessage());
			return "user/login";
		}
	}
	
	@RequestMapping(value = {"/info"}, method = RequestMethod.GET)
	public String Info() {
		return "user/myaccount";
	}
	
	@RequestMapping(value = {"/aboutus"}, method = RequestMethod.GET)
	public String Aboutus() {
		return "user/aboutus";
	}
	
	@RequestMapping(value = {"/blog"}, method = RequestMethod.GET)
	public String Blog() {
		return "user/blog";
	}
	
	@RequestMapping(value = {"/blogdetails"}, method = RequestMethod.GET)
	public String Blogdetails() {
		return "user/blogdetails";
	}
	
	@RequestMapping(value = {"/cart"}, method = RequestMethod.GET)
	public String Cart() {
		return "user/cart";
	}
	
	@RequestMapping(value = {"/checkout"}, method = RequestMethod.GET)
	public String Checkout() {
		return "user/checkout";
	}
	
	@RequestMapping(value = {"/contactus"}, method = RequestMethod.GET)
	public String Contactus() {
		return "user/contactus";
	}
	
	@RequestMapping(value = {"/product"}, method = RequestMethod.GET)
	public String Product() {
		return "user/product";
	}
	
	@RequestMapping(value = {"/shop"}, method = RequestMethod.GET)
	public String Shop() {
		return "user/shop";
	}
}
