package com.zhaoyang.annotation;

import java.lang.reflect.Method;

public class Main {

	public static void main(String[] args) {

		try {
			Class c = Demo.class;
			Object o = c.newInstance();
			Method[] arr = c.getDeclaredMethods();
			for (Method m : arr) {
				if (m.isAnnotationPresent(MyTest.class)) {
					m.invoke(o, null);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// (1)类对象
		Class c = Demo.class;
		// (2)注解对象
		Person person = (Person)c.getAnnotation(Person.class);
		// (3)获取注解中的属性值
		System.out.println(person.name());
		System.out.println(person.age());

	}

}
