package by.burim.doing.service;

import by.burim.doing.entities.City;

public interface CityService {
	
	void saveCity(City city);
	
	void deleteCityById(Integer cityId);

	Iterable<City> loadAllSities();

	City loadCityById(Integer cityId);

	

}
