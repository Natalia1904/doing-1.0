package by.burim.doing.web.admin.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import by.burim.doing.entities.City;
import by.burim.doing.entities.Street;
import by.burim.doing.service.CityService;
import by.burim.doing.service.StreetsService;

@Controller
public class StreetControllers {

	@Autowired
	private StreetsService streetService;

	@Autowired
	private CityService cityService;

	@RequestMapping("/admin/add-streets.html")
	public ModelAndView showAddStreetForm() {
		Street street = new Street();

		Iterable<City> allSities = cityService.loadAllSities();

		Map<String, Object> model = new HashMap<>();// передача улицы и города
		model.put("street", street);
		model.put("allSities", allSities);

		return new ModelAndView("addStreet", model);
	}

	@RequestMapping(value = "/admin/save-street.html")
	public String saveAddStreetForm(Street street) {
		streetService.saveStreet(street);

		return "redirect:/admin/setting.html";
	}

	@RequestMapping(value = "/admin/del-street.html")
	public String delstreet(@RequestParam Integer streetId) {
		streetService.deleteStreetsById(streetId);
		return "redirect:/admin/setting.html";
	}

	@RequestMapping(value = "/admin/edit-street.html")
	public ModelAndView editStreet(@RequestParam Integer streetId) {
		Street street = streetService.loadStreetById(streetId);

		Iterable<City> allSities = cityService.loadAllSities();

		Map<String, Object> model = new HashMap<>();// передача улицы и города
		model.put("street", street);
		model.put("allSities", allSities);

		return new ModelAndView("addStreet", model);
	}

}