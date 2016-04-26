package by.burim.doing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import by.burim.doing.dao.SityDAO;
import by.burim.doing.entities.City;
import by.burim.doing.service.CityService;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class CityServiceImpl implements CityService{
	
	@Autowired
	private SityDAO dao;

	@Override
	public void saveCity(City city) {
		dao.save(city);
	}

	@Override
	public void deleteCityById(Integer cityId) {
		dao.delete(cityId);
	}

	@Override
	public Iterable<City> loadAllSities() {
		return dao.findAll();
	}

	@Override
	public City loadCityById(Integer cityId) {
		return dao.findOne(cityId);
	}
}
