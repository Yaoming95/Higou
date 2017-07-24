package com.tanlan.higou.dao;

import com.tanlan.higou.entity.User;

/**
 * Created by ym-Zh on 2017/7/20.
 */
public interface UserDAO {
    void addUser(User user);

    User getUserByNameAndPwd(String name, String password);

    void updateAvatar(String id, String avatar);

}
