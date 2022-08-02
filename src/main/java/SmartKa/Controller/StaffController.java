package SmartKa.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import SmartKa.Constants.Constant;
import SmartKa.DAO.ProductDAO;
import SmartKa.DAO.SupportDAO;
import SmartKa.DAO.UserDAO;
import SmartKa.Model.Support;
import SmartKa.Model.UserInAdminManage;
import java.util.ArrayList;

@Controller
public class StaffController {
	@RequestMapping(value = { "/staff/home" }, method = RequestMethod.GET)
	public String Work(HttpServletRequest req) {
		req.setAttribute("page", "work");
		return "staff/index";
	}
	
	@RequestMapping(value = { "/staff/work" }, method = RequestMethod.GET)
	public String Done(HttpServletRequest req) {
		req.setAttribute("page", "done");
		return "staff/workdone";
	}
}
