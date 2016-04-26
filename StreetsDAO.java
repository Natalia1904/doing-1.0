package by.burim.doing.dao;

import org.springframework.data.repository.CrudRepository;

import by.burim.doing.entities.Street;

public interface StreetsDAO extends CrudRepository<Street, Integer> {
}
