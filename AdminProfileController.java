package by.burim.doing.web.admin.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminProfileController {

	@RequestMapping("/admin/admin-profile.html")
	public String showAdminProfile() {
		return "adminProfile";
	}
	
	@RequestMapping("/admin/admin-users.html")
	public ModelAndView showAdminUsersPage() {
		return new ModelAndView("forward:/admin/users.html");	
	}

	@RequestMapping("/admin/admin-media.html")
	public String showAdminMediaPage() {
		return "media";
	}

	@RequestMapping("/admin/rest-profile.html")
	public String showRestPage() {
		return "rest";
	}
}
