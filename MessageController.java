package by.burim.doing.web.admin.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.burim.doing.beans.EmailBean;
import by.burim.doing.entities.User;
import by.burim.doing.service.EmailService;
import by.burim.doing.service.UserService;

@Controller
public class MessageController {

	@Autowired
	private UserService userService;

	@Autowired
	private EmailService emailService;

	@RequestMapping(value = "/admin/send-message.html", method = RequestMethod.GET)
	public ModelAndView showEmailPage(@RequestParam Integer userId){
		
		org.springframework.security.core.userdetails.User userFrom = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User userTo = userService.loadUserById(userId);
		
		EmailBean email = new EmailBean();
		email.setEmailFrom(userFrom.getUsername());
		email.setEmailTo(userTo.getEmail());
		
		Map<String, Object> model = new HashMap<>();
		model.put("email", email);

		return new ModelAndView("email", model);
	}

	@RequestMapping(value = "/admin/send-message.html", params = "send_email_btn", method = RequestMethod.POST)
	public String sendEmail(EmailBean email) {
		emailService.sendEmail(email);
		return "redirect:/admin/users.html";
	}

	@RequestMapping(value = "/admin/send-message.html", params = "cancel_btn", method = RequestMethod.POST)
	public String cancelSendEmail() {
		return "redirect:/admin/users.html";
	}

}
