package SmartKa.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import SmartKa.DAO.BlogDAO;
import SmartKa.DAO.ProductDAO;
import SmartKa.Response.ResponseWithMessage;
import SmartKa.Response.ResponseWithObject;
import SmartKa.Validators.Validators;

@Controller
public class AdminController {
	@RequestMapping(value = { "/admin/usermng" }, method = RequestMethod.GET)
	public String UserManagement(HttpServletRequest req) {
		req.setAttribute("page", "quanli1");

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
		req.setAttribute("pros", ProductDAO.getAllProduct());
		String page = req.getParameter("page");
		if(page == null) {
			req.setAttribute("begin", 0);
		} else if(page.equals("1")) {
			req.setAttribute("begin", 0);
		} else if(page.equals("2")) {
			req.setAttribute("begin", 9);
		} else {
			req.setAttribute("begin", 19);
		}
		return "admin/product";
	}

	@RequestMapping(value = { "/admin/update-product" }, method = RequestMethod.POST)
	public String UpdateProduct(HttpServletRequest req, HttpSession session) {
		int id = Integer.valueOf(req.getParameter("id"));
		String name = req.getParameter("upname");
		int price = Integer.valueOf(req.getParameter("upprice"));
		int quantity = Integer.valueOf(req.getParameter("upquantity"));
		String img = req.getParameter("upimage");
		String tag = req.getParameter("uptag");
		String des = req.getParameter("updesc");
		String status = req.getParameter("upstatus");
		if (img.length() != 0 ) {
			ProductDAO.updateProduct(id, name, price, quantity, img, des, tag, status);
		} else {
			ProductDAO.updateProductNotImg(id, name, price, quantity, des, tag, status);
		}

		return "redirect:/admin/product";
	}

	@RequestMapping(value = { "/admin/delete-product" }, method = RequestMethod.POST)
	public String deleteProduct(HttpServletRequest req, HttpSession session) {
		int id = Integer.valueOf(req.getParameter("deleteproduct"));
		ProductDAO.deleteProduct(id);
		return "redirect:/admin/product";
	}

	@RequestMapping(value = { "/admin/insert-product" }, method = RequestMethod.POST)
	public String insertProduct(HttpServletRequest req, HttpSession session) {
		int id = ProductDAO.getIdLastProduct()+1;
		String name = req.getParameter("productname");
		int price = Integer.valueOf(req.getParameter("price"));
		int quantity = Integer.valueOf(req.getParameter("quantity"));
		String img = req.getParameter("image");
		String tag = req.getParameter("tag");
		String des = req.getParameter("description");
		String status = req.getParameter("status");
		ProductDAO.insertProduct(id, name, price, quantity, img, des, tag, status);
		return "redirect:/admin/product";
	}

	
	@RequestMapping(value = { "/admin/blog" }, method = RequestMethod.GET)
	public String BlogManagement(HttpServletRequest req) {
		req.setAttribute("page", "qlblog");
		req.setAttribute("blogs", BlogDAO.getAllBlog());
		String page = req.getParameter("page");
		if(page == null) {
			req.setAttribute("begin", 0);
		} else if(page.equals("1")) {
			req.setAttribute("begin", 0);
		} else {
			req.setAttribute("begin", 5);
		} 
		return "admin/blog";
	}

	@RequestMapping(value = { "/admin/blog" }, method = RequestMethod.POST)
	public String UpdateBlog(HttpServletRequest req, HttpSession session) {
		int id = Integer.valueOf(req.getParameter("idblog"));
		String title = req.getParameter("uptitle");
		String content = req.getParameter("upcontent");
		String img = req.getParameter("upimage");
		String tag = req.getParameter("uptag");
		String ct1 = req.getParameter("upcontent1");
		String ct2 = req.getParameter("upcontent2");
		String ct3 = req.getParameter("upcontent3");
		String img1 = req.getParameter("upimage1");
		String img2 = req.getParameter("upimage2");

		if (img.length() != 0 || img1.length() != 0 || img2.length() != 0) {
			BlogDAO.updateBlog(id, title, content, img, tag, ct1, ct2, ct3, img1, img2);
		} else {
			BlogDAO.updateBlogNotImg(id, title, content, tag, ct1, ct2, ct3);
		}

		return "redirect:/admin/blog";
	}

	@RequestMapping(value = { "/admin/delete-blog" }, method = RequestMethod.POST)
	public String deleteBlog(HttpServletRequest req, HttpSession session) {
		int id = Integer.valueOf(req.getParameter("deleteblog"));
		BlogDAO.DeleteBlogbyId(id);
		return "redirect:/admin/blog";
	}

	@RequestMapping(value = { "/admin/insert-blog" }, method = RequestMethod.POST)
	public String insertBlog(HttpServletRequest req, HttpSession session) {
		int id = BlogDAO.countBlog() + 1;
		String title = req.getParameter("title");
		String author = "chin";
		String ct = req.getParameter("title");
		String date = Validators.getCurrentTime();
		;
		String img = req.getParameter("image");
		String tag = req.getParameter("tag");
		String ct1 = req.getParameter("content1");
		String ct2 = req.getParameter("content2");
		String ct3 = req.getParameter("content3");
		String img1 = req.getParameter("image1");
		String img2 = req.getParameter("image2");
		BlogDAO.insertBlog(id, title, author, ct, date, img, tag, ct1, ct2, ct3, img1, img2);
		
		return "redirect:/admin/blog";
	}

	@RequestMapping(value = { "/admin/check-status-blog" }, method = RequestMethod.POST)
	public @ResponseBody void statusBlog(HttpServletRequest req, HttpSession session) {
		int id = Integer.valueOf(req.getParameter("idblog"));
		String status = BlogDAO.getBlogStatus(id);
		if (status.equals("1")) {
			status = "0";
		} else {
			status = "1";
		}
		BlogDAO.updateStatusBlog(status, id);
	}

}
