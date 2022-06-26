package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.erpdemo.entity.OverFlowListEntity;

/**
 * 商品报溢单
 * 
 */
public interface OverFlowListService {

	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	OverFlowListEntity queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<OverFlowListEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(OverFlowListEntity entity);
	
	/**
	 * 修改
	 */
	int update(OverFlowListEntity entity);

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

	//添加
	int add(OverFlowListEntity entity);
	

}
