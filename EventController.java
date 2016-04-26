package by.burim.doing.web.admin.controllers;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import by.burim.doing.beans.EventBean;
import by.burim.doing.entities.City;
import by.burim.doing.entities.Street;
import by.burim.doing.service.CityService;
import by.burim.doing.service.EventsService;
import by.burim.doing.service.StreetsService;

@Controller
public class EventController {

	@Autowired
	private CityService cityService;

	@Autowired
	private StreetsService streetService;

	@Autowired
	private EventsService eventService;

	@RequestMapping("/admin/admin-events.html")
	public ModelAndView showAdminEventsPage() {
		Iterable<City> allCities = cityService.loadAllSities();
		Iterable<Street> allStreets = streetService.loadAllStreets();

		EventBean event = new EventBean();
		event.setDate(new Date());
		
		Map<String, Object> model = new HashMap<>();
		model.put("event", event);
		model.put("allCities", allCities);
		model.put("allStreets", allStreets);
		
		return new ModelAndView("createEvent", model);
	}

	@RequestMapping("/admin/save-event.html")
	public ModelAndView saveEvent(EventBean event) {
		eventService.saveEvents(event);
		return new ModelAndView("redirect:/admin/admin-events.html");
	}
}
