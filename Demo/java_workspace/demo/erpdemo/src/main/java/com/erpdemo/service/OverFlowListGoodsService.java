package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.OverFlowListGoodsEntity;

/**
 * 商品报溢单
 * 
 */
public interface OverFlowListGoodsService {

	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	OverFlowListGoodsEntity queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<OverFlowListGoodsEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 * @return 
	 */
	int save(OverFlowListGoodsEntity entity);
	
	/**
	 * 修改
	 */
	void update(OverFlowListGoodsEntity entity);

	/**
	 * 删除
	 * @param entity
	 */
	boolean delete(Long[] ids);
	
	/**
	 * 删除
	 * @param entity
	 */
	void delete(Integer id);
	/**
	 * 批量逻辑删除
	 * @param entity
	 * @return 
	 */
	boolean updateList(Long[] ids);

	

}
