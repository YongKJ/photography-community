package com.web.graduation.dao;


import com.web.graduation.entities.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


/*
用户信息管理
*/
@Repository
@Mapper
public interface UserDao {
//    添加用户信息
    int addUser(User user);

//    更新用户信息
    int updateUser(User user);

//    上传头像
    int updateImage(int id, String image);

//    检查用户是否存在
    User checkUserExit(String email);

//    用户登录
    User userLogin(String email);

//    更改密码
    int updatePwd(String email, String password);
//    查询用户所有信息包括作品
    List<User> selectUser(int user_id);
//    查询用户头像
    User userImage(int user_id);
//    查询用户信息并缓存
    User userInfo(int user_id);
//    更新用户信息并缓存
    User userNewInfo(User user);
}

