package com.sunrise.service;

import com.sunrise.bean.User;

public interface UserService {
	//登陆验证密码
	User getUserByUsername(String username);
	//注册保存用户信息
	boolean register(User user);
}
