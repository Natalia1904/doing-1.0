package by.burim.doing.web.admin.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import by.burim.doing.entities.City;
import by.burim.doing.entities.Street;
import by.burim.doing.service.CityService;
import by.burim.doing.service.StreetsService;

@Controller
public class SettingsController {
	
	@Autowired
	private StreetsService streetService;
	
	@Autowired
	private CityService cityService;
	
	@RequestMapping("/admin/setting.html")
	public ModelAndView showSettingsPage() {
		Iterable<City> allSity = cityService.loadAllSities();
		Iterable<Street> allStreets = streetService.loadAllStreets();
		
		Map<String, Object> viewData = new HashMap<>();
		viewData.put("allSity", allSity);
		viewData.put("allStreets", allStreets);
		
		return new ModelAndView("setting", viewData);
	}
}
