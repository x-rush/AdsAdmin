package com.zhaoyang.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/action01")
public class Action01 {
	
	@RequestMapping("/m01")
	public  String m01() {
		System.out.println("执行方法一");
		return "m01";
	}
	@RequestMapping("/m02")
	public  String m02() {
		System.out.println("执行方法二");
		return "m02";
	}
	@RequestMapping("/m03")
	public  String m03() {
		System.out.println("执行方法三");
		return "m03";
	}

}
