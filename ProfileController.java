package by.burim.doing.web.user.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import by.burim.doing.dao.SityDAO;
import by.burim.doing.dao.StreetsDAO;
import by.burim.doing.service.CityService;


@Controller
public class ProfileController {

	@RequestMapping("/user/user_profile.html")
	public String showUserProfile() {
		return "user_profile";
	}
	
	@RequestMapping("/gallery.html")
	public String showGalleryPage() {
		return "gallery";
	}
	@RequestMapping("/events.html")
	public String showEventPage() {
		return "news";
	}
	
	@RequestMapping("/contacts.html")
	public String showContactPage() {
		return "contact";
	}
	
	@RequestMapping("/promotions.html")
	public String showPromotionPage() {
		return "promotions";
	}
	
	@RequestMapping("/project.html")
	public String showProjectPage() {
		return "project";
	}
	
	@RequestMapping("/part.html")
	public String showPartnersPage() {
		return "partners";
	}
}
