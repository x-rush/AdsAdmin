package com.heyang.domain;

import com.heyang.domain.base.BaseDomainObj;

/**
 * �������ʵ����-Area����pid=0ʱ��ʡ��pid=1ʱ����
 * @author baogy
 * @version 1.00
 * @since 2008-10-8 ����04:02:35
 *
 */
public class Area extends BaseDomainObj{
	private String pid;	
	private String name;
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}