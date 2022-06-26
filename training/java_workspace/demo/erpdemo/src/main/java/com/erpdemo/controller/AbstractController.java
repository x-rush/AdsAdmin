package com.erpdemo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.erpdemo.entity.SysUserEntity;
import com.erpdemo.utils.ShiroUtils;

/**
 * Controller公共组件
 * 
 */
public abstract class AbstractController {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	protected SysUserEntity getUser() {
		return ShiroUtils.getUserEntity();
	}

	protected Long getUserid() {
		return getUser().getUserid();
	}
	
	
	
	
}
