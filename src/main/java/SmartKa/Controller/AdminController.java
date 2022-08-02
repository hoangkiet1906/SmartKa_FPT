package SmartKa.Controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import SmartKa.DAO.ProductDAO;

import SmartKa.DAO.UserDAO;
import SmartKa.Model.UserInAdminManage;
import java.util.ArrayList;

@Controller
public class AdminController {
	@RequestMapping(value = { "/admin/usermng" }, method = RequestMethod.GET)
	public String UserManagement(HttpServletRequest req) {
		req.setAttribute("page", "quanli1");
		
		ArrayList<UserInAdminManage> users = UserDAO.getUserInAdmin();
		req.setAttribute("users", users);
		req.setAttribute("userNumber", users.size());
		return "admin/index";
	}
	
	@RequestMapping(value = { "/admin/revenuemng" }, method = RequestMethod.GET)
	public String RevenueManagement(HttpServletRequest req) {
		req.setAttribute("page", "quanli2");

		return "admin/index2";
	}
	
	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.GET)
	public String ProductManagement(HttpServletRequest req) {
		req.setAttribute("page", "qlproduct");
		return "admin/product";
	}
	
	@RequestMapping(value = { "/admin/blog" }, method = RequestMethod.GET)
	public String BlogManagement(HttpServletRequest req) {
		req.setAttribute("page", "qlblog");

		return "admin/blog";
	}
}
