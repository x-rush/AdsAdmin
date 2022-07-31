package com.sunrise.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunrise.bean.User;
import com.sunrise.bean.UserExample;
import com.sunrise.bean.UserExample.Criteria;
import com.sunrise.dao.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper dao;
	
	@Override
	public User getUserByUsername(String username) {
		UserExample example = new UserExample();
		Criteria  c = example.createCriteria();
		c.andUsernameEqualTo(username);
		List<User> list = dao.selectByExample(example);
		// select * from user where username='username';
		if(list.size()==0) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public boolean register(User user) {
		User u = getUserByUsername(user.getName());
		if(u!=null) { //已经存在用户了
			return false; //不能再次注册
		}else {
			dao.insert(user);
			return true;
		}
	}

}
