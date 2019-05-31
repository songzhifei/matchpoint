package matchpoint.service;

import matchpoint.bean.User;

import java.util.List;

public interface UserService {
    User findUserByName(String userName);

    List<User> findAll();

    int insertUser(User user);
}
