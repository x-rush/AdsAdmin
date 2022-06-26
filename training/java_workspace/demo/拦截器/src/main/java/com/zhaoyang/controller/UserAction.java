package com.zhaoyang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zhaoyang.bean.User;

@RestController
@RequestMapping("/user")
public class UserAction {
	
	@RequestMapping("/login")
	public boolean m1(@RequestBody User user, HttpSession session) {
		
		System.out.println("控制器");
		
		if (user.getUsername().equals("abc") && user.getPassword().equals("123")) {
			session.setAttribute("user", user);
			return true;
		}
		return false;
	}
	
	@RequestMapping("/other")
	public String m2() {
		return "other...";
	}

}
