package by.burim.doing.service;

import by.burim.doing.entities.Street;

public interface StreetsService {

	void deleteStreetsById (Integer streetsId);

	void saveStreet(Street street);

	Iterable<Street> loadAllStreets();

	Street loadStreetById(Integer streetId);
	
}
