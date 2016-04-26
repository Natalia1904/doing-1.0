package by.burim.doing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.burim.doing.dao.UserDAO;
import by.burim.doing.entities.User;
import by.burim.doing.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	@Override
	public void deleteUserById(Integer userId) {
		dao.delete(userId);

	}

	@Override
	public void saveUser(User user) {
		dao.save(user);
	}

	@Override
	public Iterable<User> loadAllUsers() {
		return dao.findAll();
	}

	@Override
	public User loadUserById(Integer userId) {
		return dao.findOne(userId);
	}
}
