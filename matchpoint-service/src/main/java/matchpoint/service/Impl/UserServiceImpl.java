package matchpoint.service.Impl;

import matchpoint.bean.User;
import matchpoint.dao.UserDao;
import matchpoint.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User findUserByName(String userName) {
        return userDao.findByName(userName);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public int insertUser(User user) {
        return userDao.insert(user);
    }

}
