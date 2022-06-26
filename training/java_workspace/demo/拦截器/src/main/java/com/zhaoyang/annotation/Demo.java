package com.zhaoyang.annotation;

@Person(name="张三")
public class Demo {

	@MyTest
	public void m1() {
		System.out.println("方法一");
	}
	
	public void m2() {
		System.out.println("方法二");
	}
	
	public void m3() {
		System.out.println("方法三");
	}
	
}
