package SmartKa.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	@RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
	public String Contactus() {
		return "admin/index";
	}
}
