package com.zhaoyang.controller;

import javax.servlet.Servlet;
import javax.servlet.Filter;
import javax.servlet.ServletContextListener;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//url:'/c01/jack/20'

@RestController
@RequestMapping("/c01")
public class RestAction01 {

	// @RequestMapping(method=RequestMethod.POST)
	@PostMapping("/{name}/{age}")
	public boolean m1(@PathVariable("name") String name, @PathVariable("age") Integer age) {
		System.out.println("添加操作" + name + age);
		return true;
	}

	@PutMapping
	public boolean m2() {
		System.out.println("修改操作");
		return true;
	}

	@DeleteMapping
	public boolean m3() {
		System.out.println("删除操作");
		return true;
	}

	@GetMapping
	public boolean m4() {
		System.out.println("查询操作");
		return true;
	}

}
