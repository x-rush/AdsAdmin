package com.heyang.exception.date;

import com.heyang.exception.SysBaseException;

/**
 * ����ת���쳣
 * @author baogy
 *
 * @since 2008-8-13 ����02:56:01
 * @version 1.00
 */
public class DateFormatException extends SysBaseException{
	private static final long serialVersionUID = -1437125990017781089L;

	public DateFormatException(String msg){
		super(msg);
	}
}