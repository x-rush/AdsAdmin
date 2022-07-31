package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.SysCategoryEntity;


/**
 * 系统类别
 * 
 */
public interface SysCategoryService {
	
	/**
	 * 查询类别的所有权限
	 * @param id  类别ID
	 */
	List<String> queryAllPerms(Long id);
	
	/**
	 * 查询类别的所有菜单ID
	 */
	List<Long> queryAllMenuId(Long id);
	
	/**
	 * 根据类别名，查询系统类别
	 */
	SysCategoryEntity queryByName(String username);
	
	/**
	 * 根据类别ID，查询类别
	 * @param id
	 * @return
	 */
	SysCategoryEntity queryObject(Long id);
	
	/**
	 * 查询类别列表
	 */
	List<SysCategoryEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存类别
	 */
	void save(SysCategoryEntity category);
	
	/**
	 * 修改类别
	 */
	void update(SysCategoryEntity category);
	
	/**
	 * 删除类别
	 */
	void deleteBatch(Long[] ids);
	
	
}
