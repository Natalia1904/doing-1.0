package by.burim.doing.dao;

import org.springframework.data.repository.CrudRepository;

import by.burim.doing.entities.Address;

public interface AddressDAO extends CrudRepository<Address, Integer> {
}
