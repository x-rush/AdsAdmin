package com.heyang.exception.family;

import com.heyang.exception.SysBaseException;

/**
 * ��Ŀ���Ա�û����ظ��쳣
 * @author baogy
 *
 * @since 2008-8-13 ����02:33:55
 * @version 1.00
 */
public class DuplicationNameException extends SysBaseException{
	private static final long serialVersionUID = 7237018501966967671L;

	public DuplicationNameException(String msg){
		super(msg);
	}
}