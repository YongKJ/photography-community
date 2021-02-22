package com.web.graduation.service.serviceImpl;

import com.web.graduation.dao.UserDao;
import com.web.graduation.entities.User;
import com.web.graduation.service.UserService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service
@CacheConfig(cacheNames = "User")
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public User userLogin(String email) {
        return userDao.userLogin(email);
    }

    @Override
    public int updatePwd(String email, String password) {
        return userDao.updatePwd(email, password);
    }

    @Override
    public List<User> selectUser(int user_id) {
        return userDao.selectUser(user_id);
    }

    @Override
    public User userImage(int user_id) {
        return userDao.userImage(user_id);
    }

    @Override
    @Cacheable(key = "#user_id")
    public User userInfo(int user_id) {
        return userDao.userInfo(user_id);
    }

    @Override
    @CachePut(key = "#user.id")
    public User userNewInfo(User user) {
        if (user.isFlag()) {
            this.updateUser(user);
        }else {
            this.updateImage(user.getId(),user.getImage());
        }
        return userDao.userNewInfo(user);
    }

    @Override
    public int addUser(User user) {
        int result = userDao.addUser(user);
        return result;
    }

    @Override
    public int updateUser(User user) {
        int result = userDao.updateUser(user);
        return result;
    }

    @Override
    public int updateImage(int id, String image) {
        int result = userDao.updateImage(id, image);
        return result;
    }

    @Override
    public User checkUserExit(String email) {
        return userDao.checkUserExit(email);
    }
}
