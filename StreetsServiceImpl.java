package by.burim.doing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import by.burim.doing.dao.StreetsDAO;
import by.burim.doing.entities.Street;
import by.burim.doing.service.StreetsService;

@Service
@Transactional(propagation=Propagation.REQUIRED)
public class StreetsServiceImpl implements StreetsService {

	@Autowired
	private StreetsDAO dao;
	
	@Override
	public void deleteStreetsById(Integer streetsId) {
		dao.delete(streetsId);

	}

	@Override
	public void saveStreet(Street street) {
		dao.save(street);
	}

	@Override
	public Iterable<Street> loadAllStreets() {
		return dao.findAll();
	}

	@Override
	public Street loadStreetById(Integer streetId) {
		return dao.findOne(streetId);
	}
}
