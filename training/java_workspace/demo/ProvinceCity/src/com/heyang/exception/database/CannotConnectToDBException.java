package com.heyang.exception.database;

import com.heyang.exception.SysBaseException;

/**
 * �޷����ӵ����ݿ��쳣
 * @author baogy
 *
 * @since 2008-8-15 ����10:27:05
 * @version 1.00
 */
public class CannotConnectToDBException extends SysBaseException{
	private static final long serialVersionUID = -4232142582310313026L;

	public CannotConnectToDBException(String msg){
		super(msg);
	}
}