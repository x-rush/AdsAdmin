package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.ReturnListEntity;
import com.erpdemo.entity.ReturnListGoodsEntity;



public interface ReturnListService {

	/**
	 * 查询
	 * @param id
	 * @return
	 */
	
	ReturnListEntity queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<ReturnListEntity> queryList(Map<String, Object> map);
	List<ReturnListEntity> queryGoods(Map<String, Object> map);
	List<ReturnListEntity> querySearch(String id);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(ReturnListEntity entity);
	
	/**
	 * 修改
	 */
	void update(ReturnListEntity entity);

	/**
	 * 删除
	 * @param entity
	 */
	void delete(ReturnListEntity entity);
	
	/**
	 * 删除
	 * @param entity
	 */
	void delete(Long[] ids);

	void updateList(int[] ids);
	
	

	
	
}
