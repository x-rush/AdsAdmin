package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.ReturnListGoodsEntity;

public interface ReturnListGoodsService {

	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	ReturnListGoodsEntity queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<ReturnListGoodsEntity> queryList(Map<String, Object> map);
	
	List<ReturnListGoodsEntity> queryGoods(Map<String, Object> map);
	List<ReturnListGoodsEntity> querySearch(String id);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(ReturnListGoodsEntity entity);
	
	/**
	 * 修改
	 */
	void update(ReturnListGoodsEntity entity);

	/**
	 * 删除
	 * @param entity
	 */
	void delete(ReturnListGoodsEntity entity);
	
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
