package com.heyang.util;

import java.util.Random;

/**
 * 用于生成ID
 * 
 * @author: sitinspring(junglesong@gmail.com)
 * @date: 2008-2-4
 */
public final class IDUtil{
	/**
	 * 私有构造函数，防止被实例化
	 *
	 */
	private IDUtil(){
		
	}
	
	/**
	 * 得到时间+随机数生成的ID
	 * @return
	 */
	@SuppressWarnings("finally")
	public synchronized static String generateId(){
		long id=Long.parseLong(TimeUtil.getShortCurrDateTime());		
		Random rnd=new Random();		
		return String.valueOf(id)+String.valueOf(rnd.nextInt(1000));
	}
}