package com.heyang.exception;

import org.apache.log4j.Logger;

/**
 * 本项目基本异常
 * @author baogy
 *
 * @since 2008-8-13 下午02:33:55
 * @version 1.00
 */
public abstract class SysBaseException extends Exception{
	private static final long serialVersionUID = 7237018501966967671L;
	private static Logger logger = Logger.getLogger(SysBaseException.class
			.toString());
	
	public SysBaseException(String msg){
		super(msg);
		logger.info(msg);
	}
}