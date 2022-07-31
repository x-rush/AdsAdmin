package com.zhaoyang.aop;

public class Main {

	public static void main(String[] args) {

		// 使用代理模式之前的寫法
//		MyService s = new MyServiceImpl();
//		s.add();
//		s.update();

		// 使用代理模式之後的寫法
		MyService s1 = new MyServiceImpl();
		MyService s2 = new ProxyMyService(s1);
		s2.add();
		s2.update();

	}

}
