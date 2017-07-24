package com.tanlan.higou.dao.jdbc;

import com.tanlan.higou.dao.UserDAO;
import com.tanlan.higou.entity.User;

/**
 * Created by ym-Zh on 2017/7/20.
 */
public class userJDBCDAO implements UserDAO {


    @Override
    public void addUser(User user) {

    }

    @Override
    public User getUserByNameAndPwd(String name, String password) {
        return null;
    }

    @Override
    public void updateAvatar(String id, String avatar) {

    }
}
