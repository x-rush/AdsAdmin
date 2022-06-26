package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.SysSupplierEntity;


/**
 * 系统用户
 * 
 */
public interface SysSupplierService {
	
	/**
	 * 查询用户的所有权限
	 * @param userId  用户ID
	 */
	List<String> queryAllPerms(Long id);
	
	/**
	 * 查询用户的所有菜单ID
	 */
	List<Long> queryAllMenuId(Long id);
	
	
	/**
	 * 根据用户ID，查询用户
	 * @param userId
	 * @return
	 */
	SysSupplierEntity queryObject(Long id);
	
	/**
	 * 查询用户列表
	 */
	List<SysSupplierEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存用户
	 */
	void save(SysSupplierEntity supplier);
	
	/**
	 * 修改用户
	 */
	void update(SysSupplierEntity supplier);
	
	/**
	 * 删除用户
	 */
	void deleteBatch(Long[] ids);
	
	
}
