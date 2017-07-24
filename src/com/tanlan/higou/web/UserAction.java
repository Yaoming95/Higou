package com.tanlan.higou.web;

import com.tanlan.higou.entity.User;
import com.tanlan.higou.service.UserService;

/**
 * Created by ym-Zh on 2017/7/20.
 */
public class UserAction {
    private UserService userService;
    private User user;

    public String reg(){
        userService.register(user);
        return "regsuc";
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
