package by.burim.doing.dao;

import org.springframework.data.repository.CrudRepository;

import by.burim.doing.entities.User;

public interface UserDAO extends CrudRepository<User, Integer> {
}
