package SmartKa.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.xml.validation.Validator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import SmartKa.DAO.ProductDAO;

import SmartKa.DAO.UserDAO;
import SmartKa.Model.ORProduct;
import SmartKa.Model.RevenueChartData;
import SmartKa.Model.UserInAdminManage;
import SmartKa.Validators.Validators;

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
		ArrayList<ORProduct> list = ProductDAO.getRevenueMng();
		req.setAttribute("ORPlist", list);
		ArrayList<ORProduct> RBlist = ProductDAO.getRarelyBought();
		req.setAttribute("RBlist", RBlist);
		int grownrate = ProductDAO.CalculatingRevenue();
		int totalMoney = ProductDAO.TotalWeek();
		req.setAttribute("totalweek", totalMoney);
		req.setAttribute("gr", grownrate);
		return "admin/index2";
	}
	@RequestMapping(value = { "/admin/loadchart"}, method = RequestMethod.GET) 
	public @ResponseBody String loadChart(HttpServletRequest req) {
		ArrayList<ArrayList<RevenueChartData>> largeList = new ArrayList<ArrayList<RevenueChartData>>();
		String res = "";
		ArrayList<RevenueChartData> weekData = ProductDAO.getWeeklyChartData(Validators.getCurrentDateMinus(-7), Validators.getCurrentDateMinus(0));
		ArrayList<RevenueChartData> prevWeekData = ProductDAO.getPrevWeeklyChartData(Validators.getCurrentDateMinus(-14), Validators.getCurrentDateMinus(7));
		largeList.add(weekData);
		largeList.add(prevWeekData);
		ObjectMapper mapper = new ObjectMapper();
		try {
			res = mapper.writeValueAsString(largeList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return res;
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
