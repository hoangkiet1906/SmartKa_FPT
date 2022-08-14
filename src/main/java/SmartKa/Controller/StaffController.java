package SmartKa.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import SmartKa.Response.ResponseObject;
import SmartKa.Validators.Validators;

import java.util.ArrayList;

@Controller
public class StaffController {
	@RequestMapping(value = { "/staff/home" }, method = RequestMethod.GET)
	public String Work(HttpServletRequest req, HttpSession session) {
		req.setAttribute("page", "work");

		req.setAttribute("processingOrders", WorkDAO.getWorkByStaffNameAndStatus((String) session.getAttribute(Constant.SESSION_USERNAME), "Processing"));

		return "staff/index";
	}

	@RequestMapping(value = "/completeTask", method = RequestMethod.POST) 
	public @ResponseBody String CompleteTask(HttpServletRequest request) throws JsonProcessingException {
		ResponseObject object = new ResponseObject();

		int id = Integer.parseInt(request.getParameter("id"));

		OrderDAO.updateStatusOrder(id, "Completed");

		object.setMessage("Congrats to you completed your task.");
		object.setSuccess(true);

		return Validators.convertObjectToJSONString(object);
	}
	
	@RequestMapping(value = { "/staff/work" }, method = RequestMethod.GET)
	public String Done(HttpServletRequest req, HttpSession session) {
		req.setAttribute("page", "done");

		req.setAttribute("completedOrders", WorkDAO.getWorkByStaffNameAndStatus((String) session.getAttribute(Constant.SESSION_USERNAME), "Completed"));

		return "staff/workdone";
	}
}
