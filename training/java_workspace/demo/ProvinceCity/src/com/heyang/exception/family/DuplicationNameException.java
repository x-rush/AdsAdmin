package com.heyang.exception.family;

import com.heyang.exception.SysBaseException;

/**
 * 项目组成员用户名重复异常
 * @author baogy
 *
 * @since 2008-8-13 下午02:33:55
 * @version 1.00
 */
public class DuplicationNameException extends SysBaseException{
	private static final long serialVersionUID = 7237018501966967671L;

	public DuplicationNameException(String msg){
		super(msg);
	}
}