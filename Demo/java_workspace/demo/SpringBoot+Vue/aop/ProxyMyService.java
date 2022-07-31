package com.zhaoyang.aop;

// 代理模式
public class ProxyMyService implements MyService {
	
	MyService service;
	
	public ProxyMyService(MyService service) {
		this.service = service;
	}

	public void add() {
		// (1)前置通知
		System.out.println("事務設置為手動提交");
		service.add();
		// (2)後置通知
		System.out.println("事務提交");
		// (3)環繞通知:前置通知+後置通知
		// (4)異常通知:發生異常
	}

	public void update() {
		System.out.println("事務設置為手動提交");
		service.update();
		System.out.println("事務提交");
	}

}
