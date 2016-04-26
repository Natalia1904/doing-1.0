package by.burim.doing.web.admin.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.burim.doing.entities.City;
import by.burim.doing.service.CityService;

@Controller
public class CityControllers {
	
	@Autowired
	private CityService cityService;

	@RequestMapping("/admin/add-city.html")
	public ModelAndView showAddCityForm() {
		City city = new City();

		Map<String, Object> viewData = new HashMap<>(); 
		viewData.put("city", city);

		return new ModelAndView("addCity", viewData);
	}

	@RequestMapping(value = "/admin/save-city.html")
	public ModelAndView saveAddCityForm(City city) {
		cityService.saveCity(city);

		return new ModelAndView("redirect:/admin/setting.html");
		
	}
	
	@RequestMapping(value = "/admin/del-city.html")
	public ModelAndView delCity(@RequestParam Integer cityId) {
		cityService.deleteCityById(cityId);
		
		return new ModelAndView("redirect:/admin/setting.html");
		
	}
	
	@RequestMapping(value = "/admin/edit-city.html")
	public ModelAndView  editCity(@RequestParam Integer cityId){
		City city = cityService.loadCityById(cityId);

		Map<String, Object> viewData = new HashMap<>(); 
		viewData.put("city", city);

		return new ModelAndView("addCity", viewData);
	}
}
