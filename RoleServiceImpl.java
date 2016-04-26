package by.burim.doing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import by.burim.doing.dao.RoleDAO;
import by.burim.doing.entities.Role;
import by.burim.doing.service.RoleService;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDAO dao;

	@Override
	public Iterable<Role> loadAllRoles() {
		return dao.findAll();
	}
}
