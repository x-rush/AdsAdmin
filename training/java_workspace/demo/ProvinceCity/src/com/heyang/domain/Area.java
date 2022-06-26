package com.heyang.domain;

import com.heyang.domain.base.BaseDomainObj;

/**
 * 领域对象实体类-Area，当pid=0时是省，pid=1时是市
 * @author baogy
 * @version 1.00
 * @since 2008-10-8 下午04:02:35
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