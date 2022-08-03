package SmartKa.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import SmartKa.Constants.Constant;
import SmartKa.DAO.OrderDAO;
import SmartKa.DAO.ProductDAO;
import SmartKa.DAO.SupportDAO;
import SmartKa.DAO.UserDAO;
import SmartKa.DAO.WorkDAO;
import SmartKa.Model.Support;
import SmartKa.Model.UserInAdminManage;
import SmartKa.Model.Work;
import SmartKa.Response.ResponseObject;
import SmartKa.Validators.Validators;

import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {
	@RequestMapping(value = { "/admin/usermng" }, method = RequestMethod.GET)
	public String UserManagement(HttpServletRequest req, HttpSession session) {
		ArrayList<Support> sp = SupportDAO.getAllSp();
		session.setAttribute("support", sp);
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
	
	@RequestMapping(value = { "/admin/staff" }, method = RequestMethod.GET)
	public String StaffManagement(HttpServletRequest req) {
		req.setAttribute("page", "qlstaff");
		
		req.setAttribute("pendingOrders", OrderDAO.findOrdersByStatus("Pending"));
		req.setAttribute("staffs", UserDAO.getAccountsByRole("STAFF"));
		req.setAttribute("processingOrders", WorkDAO.getWorkByStatus("Processing"));
		req.setAttribute("completedOrders", WorkDAO.getWorkByStatus("Completed"));

		return "admin/staff";
	}
	
	
	@RequestMapping(value = {"/updateWorkStaff"}, method = RequestMethod.POST)
	public @ResponseBody String UpdateWorkStaff(HttpServletRequest request) throws JsonProcessingException {
		String response = "";
		
		ResponseObject res = new ResponseObject();
		
		String resString = request.getParameter("reqObj");
		
		JSONArray array = new JSONArray(resString);
		
		List<Integer> integers = new ArrayList<Integer>();
		
		for (int i = 0; i < array.length(); i++) {
			JSONObject object = array.getJSONObject(i);
			int id = object.getInt("id");
			String staff = object.getString("staff");
			if (!staff.equals("")) {
				WorkDAO.save(new Work(staff, OrderDAO.findByID(id)));
				OrderDAO.updateStatusOrder(id, "Processing");
				integers.add(id);
			}
		}
		
		res.setMessage("Update Successfully!");
		res.setSuccess(true);
		res.setObject(integers);
		
		
		return Validators.convertObjectToJSONString(res);
	}
}
