package com.tanlan.higou.service;

import com.tanlan.higou.entity.User;

/**
 * Created by ym-Zh on 2017/7/20.
 */
public interface UserService {
    void register(User user);

    User login(String name, String password);

}
