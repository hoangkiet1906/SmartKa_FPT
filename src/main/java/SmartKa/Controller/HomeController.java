package SmartKa.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public String Index() {
		return "user/index";
	}
	
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
	public String Login() {
		return "user/login";
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
