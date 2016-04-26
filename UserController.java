package by.burim.doing.web.admin.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.burim.doing.entities.Role;
import by.burim.doing.entities.User;
import by.burim.doing.service.RoleService;
import by.burim.doing.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/admin/users.html", method = RequestMethod.GET)
	public ModelAndView showUsersPage() {
		Iterable<User> allUsers = userService.loadAllUsers();
		Iterable<Role> allRoles = roleService.loadAllRoles();
		User user = new User();

		Map<String, Object> viewData = new HashMap<>();
		viewData.put("allUsers", allUsers);
		viewData.put("allRoles", allRoles);
		viewData.put("user", user);

		return new ModelAndView("participants", viewData);
	}

	@RequestMapping(value = "/admin/save-user.html", method = RequestMethod.POST)
	public ModelAndView saveUser(User user) {
		userService.saveUser(user);

		return new ModelAndView("redirect:/admin/users.html");

	}

	@RequestMapping(value = "/admin/edit-user.html", method = RequestMethod.GET)
	public ModelAndView editUser(@RequestParam Integer userId) {
		User us = userService.loadUserById(userId);

		Iterable<User> allUsers = userService.loadAllUsers();
		Iterable<Role> allRoles = roleService.loadAllRoles();

		Map<String, Object> viewData = new HashMap<>();
		viewData.put("allUsers", allUsers);
		viewData.put("allRoles", allRoles);
		viewData.put("user", us);

		return new ModelAndView("participants", viewData);

	}

	@RequestMapping(value = "/admin/del-user.html", method = RequestMethod.GET)
	public ModelAndView delUser(@RequestParam Integer userId) {
		userService.deleteUserById(userId);

		return new ModelAndView("redirect:/admin/users.html");
	}
}
