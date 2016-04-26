package by.burim.doing.service;

import by.burim.doing.entities.User;

public interface UserService {

	void deleteUserById(Integer userId);

	void saveUser(User user);

	Iterable<User> loadAllUsers();

	User loadUserById(Integer userId);
}
