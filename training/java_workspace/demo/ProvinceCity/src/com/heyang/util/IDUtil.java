package com.heyang.util;

import java.util.Random;

/**
 * ��������ID
 * 
 * @author: sitinspring(junglesong@gmail.com)
 * @date: 2008-2-4
 */
public final class IDUtil{
	/**
	 * ˽�й��캯������ֹ��ʵ����
	 *
	 */
	private IDUtil(){
		
	}
	
	/**
	 * �õ�ʱ��+��������ɵ�ID
	 * @return
	 */
	@SuppressWarnings("finally")
	public synchronized static String generateId(){
		long id=Long.parseLong(TimeUtil.getShortCurrDateTime());		
		Random rnd=new Random();		
		return String.valueOf(id)+String.valueOf(rnd.nextInt(1000));
	}
}