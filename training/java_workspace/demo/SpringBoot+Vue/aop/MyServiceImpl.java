package com.zhaoyang.aop;

public class MyServiceImpl implements MyService {

	public void add() {
		System.out.println("實現了添加方法");
	}

	public void update() {
		System.out.println("提交事務");
	}

}
