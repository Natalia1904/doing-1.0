package by.burim.doing.dao;

import org.springframework.data.repository.CrudRepository;

import by.burim.doing.entities.Role;

public interface RoleDAO extends CrudRepository<Role, Integer> {
}
