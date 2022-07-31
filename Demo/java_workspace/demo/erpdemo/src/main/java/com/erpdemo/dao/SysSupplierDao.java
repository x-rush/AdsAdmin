package com.erpdemo.dao;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.SysCategoryEntity;
import com.erpdemo.entity.SysSupplierEntity;

public interface SysSupplierDao extends BaseDao<SysSupplierEntity>{
   
	/**
	 * 查询用户的所有权限
	 * @param userId  用户ID
	 */
	List<String> queryAllPerms(Long userId);
	
	/**
	 * 查询用户的所有菜单ID
	 */
	List<Long> queryAllMenuId(Long userId);
	
	/**
	 * 根据用户名，查询系统用户
	 */
	SysCategoryEntity queryByName(String name);
	
	
	
}