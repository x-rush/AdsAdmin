package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.PurchaseEntity;


/**
 * 商品
 * 
 */
public interface PurchaseService {
	

	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	PurchaseEntity queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<PurchaseEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(PurchaseEntity entity);
	
	/**
	 * 修改
	 */
	void update(PurchaseEntity entity);

	/**
	 * 删除
	 * @param entity
	 */
	void delete(PurchaseEntity entity);
	
	/**
	 * 删除
	 * @param entity
	 */
	void delete(Long[] ids);
	
	
	/**
	 * 批量逻辑删除
	 * @param entity
	 */
	void updateList(int[] ids);
	
	
	
}
