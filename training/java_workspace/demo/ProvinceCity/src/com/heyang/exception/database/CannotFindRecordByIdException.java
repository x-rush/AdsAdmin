package com.heyang.exception.database;

import com.heyang.exception.SysBaseException;

/**
 * �o������ID�ҵ�ӛ䛮���
 * @author baogy
 *
 * @since 2008-8-13 ����02:56:01
 * @version 1.00
 */
public class CannotFindRecordByIdException extends SysBaseException{
	private static final long serialVersionUID = -54354453089L;

	public CannotFindRecordByIdException(String msg){
		super(msg);
	}
}