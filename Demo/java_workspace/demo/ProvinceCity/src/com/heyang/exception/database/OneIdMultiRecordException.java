package com.heyang.exception.database;

import com.heyang.exception.SysBaseException;

/**
 * ��ID��Ӧ�����Ա��¼�쳣
 * @author baogy
 *
 * @since 2008-8-13 ����02:56:01
 * @version 1.00
 */
public class OneIdMultiRecordException extends SysBaseException{
	private static final long serialVersionUID = -1437125990017781089L;

	public OneIdMultiRecordException(String msg){
		super(msg);
		
	}
}