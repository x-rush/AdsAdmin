package com.heyang.exception.family;

import com.heyang.exception.SysBaseException;

/**
 * ��Session���Ҳ����û��쳣
 * @author baogy
 *
 * @since 2008-8-13 ����02:56:01
 * @version 1.00
 */
public class CannotFindUserInSessionException extends SysBaseException{
	private static final long serialVersionUID = -14371534543781089L;

	public CannotFindUserInSessionException(String msg){
		super(msg);
	}
}