package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.PurchaseGoodsEntity;


/**
 * 商品
 * 
 */
public interface PurchaseGoodsService {
	

	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	PurchaseGoodsEntity queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<PurchaseGoodsEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(PurchaseGoodsEntity entity);
	
	/**
	 * 修改
	 */
	void update(PurchaseGoodsEntity entity);

	/**
	 * 删除
	 * @param entity
	 */
	void delete(PurchaseGoodsEntity entity);
	
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
