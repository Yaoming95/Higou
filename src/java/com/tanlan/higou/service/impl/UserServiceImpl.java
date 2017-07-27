package com.tanlan.higou.service.impl;

import com.tanlan.higou.dao.UserDAO;
import com.tanlan.higou.entity.User;
import com.tanlan.higou.service.UserService;
import com.tanlan.higou.util.HiGouUtil;


/**
 * Created by ym-Zh on 2017/7/20.
 */
public class UserServiceImpl implements UserService {

    private UserDAO userDAO;

    public void register(User user) {
        user.setId(HiGouUtil.getID());
        user.setRegTime(HiGouUtil.getDate());
        user.setRole("r");


        userDAO.addUser(user);
    }

    public User login(String name, String password) {
        return null;
    }

    public UserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
}
