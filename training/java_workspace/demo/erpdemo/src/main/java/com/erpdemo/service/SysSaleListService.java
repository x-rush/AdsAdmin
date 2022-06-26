package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.SysSaleList;

public interface SysSaleListService {

	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	SysSaleList queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<SysSaleList> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(SysSaleList sysSaleList);

	/**
	 * 修改
	 */
	void update(SysSaleList sysSaleList);

	/**
	 * 批量逻辑删除
	 * @param entity
	 */
	void updateList(int[] ids);
	
}
