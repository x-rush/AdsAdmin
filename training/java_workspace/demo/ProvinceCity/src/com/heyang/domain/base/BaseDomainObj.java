package com.heyang.domain.base;

import com.heyang.util.IDUtil;

/**
 * �������Ļ���
 * @author baogy
 *
 * @since 2008-8-15 ����10:15:32
 * @version 1.00
 */
public abstract class BaseDomainObj{
	protected String id;
	
	public BaseDomainObj(){
		id=IDUtil.generateId();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}