package SmartKa.Controller;

import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import SmartKa.Constants.Constant;
import SmartKa.DAO.CartDAO;
import SmartKa.DAO.ProductDAO;
import SmartKa.Model.Cart;
import SmartKa.Model.Product;
import SmartKa.Response.ResponseObject;
import SmartKa.Service.impl.CartService;
import SmartKa.Validators.Validators;

@Controller
public class CartController {
	@Autowired
	CartService cartService;
	@RequestMapping(value = { "/getCart" }, method = RequestMethod.GET)
	public @ResponseBody String getCart(HttpSession session) throws JsonProcessingException {
		return Validators.convertObjectToJSONString(cartService.getCart(session));
	}

	@RequestMapping(value = { "/addCart" }, method = RequestMethod.POST)
	public @ResponseBody String addCart(HttpServletRequest request, HttpSession session) throws JsonProcessingException {
		return Validators.convertObjectToJSONString(cartService.addCart(request, session));
	}

	@RequestMapping(value = { "/deleteCartItem" }, method = RequestMethod.POST)
	public @ResponseBody String deleteCartItem(HttpServletRequest request, HttpSession session) throws JsonProcessingException {
		return Validators.convertObjectToJSONString(cartService.deleteCart(request, session));
	}
	
	@RequestMapping(value = { "/checkout" }, method = RequestMethod.POST)
	public String Checkout(HttpServletRequest request) {
		String country = request.getParameter("countryData");
		String state = request.getParameter("stateData");
		String address = request.getParameter("streetData");
		request.setAttribute("address", address);
		request.setAttribute("state", state);
		request.setAttribute("country", country);
		return "user/checkout";
	}
	
	@RequestMapping(value = { "/confirm" }, method = RequestMethod.POST)
	public @ResponseBody String Confirm(HttpServletRequest request, HttpSession session) throws JsonProcessingException {
		return Validators.convertObjectToJSONString(cartService.checkOut(request, session));
	}

	@RequestMapping(value = { "/updateCart" }, method = RequestMethod.POST)
	public @ResponseBody String updateCart(HttpServletRequest request, HttpSession session) throws JsonProcessingException {
		return Validators.convertObjectToJSONString(cartService.updateCart(request, session));
	}

	@RequestMapping(value = { "/viewCart" }, method = RequestMethod.GET)
	public String viewCart() {
		return "user/cart";
	}
}
