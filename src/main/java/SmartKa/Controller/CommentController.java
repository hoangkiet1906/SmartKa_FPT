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
import SmartKa.DAO.CommentDAO;
import SmartKa.DAO.UserDAO;
import SmartKa.Model.CmtModel;
import SmartKa.Response.ResponseWithObject;
import SmartKa.Validators.Validators;

@Controller
public class CommentController {

	// get to load all cmt product
	@RequestMapping(value = { "/getAllCmtProduct" }, method = RequestMethod.GET)
	public @ResponseBody String getAllCmtProduct(HttpSession session, HttpServletRequest req) {

		String response = "";
		ArrayList<CmtModel> arrayList = CommentDAO.getAllCmtProduct((String) req.getParameter("idpro"));

		ResponseWithObject responseObject = new ResponseWithObject();
		if (arrayList == null) {
			responseObject.setSuccess(false);
		} else {
			responseObject.setSuccess(true);
			responseObject.setObject(arrayList);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			response = mapper.writeValueAsString(responseObject);
			System.out.println("res pro oke");
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return response;
	}

	// add cmt product into db
	@RequestMapping(value = { "/addCmtProduct" }, method = RequestMethod.GET)
	public @ResponseBody String addCmtProduct(HttpSession session, HttpServletRequest req) {

		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		String date = Validators.getCurrentTime();
		String content = (String) req.getParameter("content");
		int id = Integer.valueOf(req.getParameter("idpro"));

		if (content != null) {
			CommentDAO.addCmtProduct(content, date, username, id);
			CmtModel cmt = new CmtModel(content, date, username, UserDAO.getAvatar(username));
			String response = "";
			ResponseWithObject responseObject = new ResponseWithObject();
			if (cmt.getContent() == null) {
				responseObject.setSuccess(false);
			} else {
				responseObject.setSuccess(true);
				responseObject.setObject(cmt);
			}
			ObjectMapper mapper = new ObjectMapper();
			try {
				response = mapper.writeValueAsString(responseObject);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return response;	
		}
		return null;
		
	}

	// get to load all cmt blog
	@RequestMapping(value = { "/getAllCmtBlog" }, method = RequestMethod.GET)
	public @ResponseBody String getAllCmtBlog(HttpSession session, HttpServletRequest req) {

		String response = "";
		ArrayList<CmtModel> arrayList = CommentDAO.getAllCmtBlog((String) req.getParameter("idblog"));

		ResponseWithObject responseObject = new ResponseWithObject();
		if (arrayList == null) {
			responseObject.setSuccess(false);
		} else {
			responseObject.setSuccess(true);
			responseObject.setObject(arrayList);
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			response = mapper.writeValueAsString(responseObject);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return response;
	}

	// add cmt blog into db
	@RequestMapping(value = { "/addCmtBlog" }, method = RequestMethod.GET)
	public @ResponseBody String addCmtBlog(HttpSession session, HttpServletRequest req) {

		String username = (String) session.getAttribute(Constant.SESSION_USERNAME);
		String date = Validators.getCurrentTime();
		String content = (String) req.getParameter("content");
		int id = Integer.valueOf(req.getParameter("idblog"));

		if (content != null) {
			
			CommentDAO.addCmtBlog(content, date, username, id);
			CmtModel cmt = new CmtModel(content, date, username, UserDAO.getAvatar(username));
			String response = "";
			ResponseWithObject responseObject = new ResponseWithObject();
			if (cmt.getContent() == null) {
				responseObject.setSuccess(false);
			} else {
				responseObject.setSuccess(true);
				responseObject.setObject(cmt);
			}
			ObjectMapper mapper = new ObjectMapper();
			try {
				response = mapper.writeValueAsString(responseObject);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return response;
		}
		
		return null;

	}

}
