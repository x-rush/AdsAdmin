package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.GoodsColorEntity;
import com.erpdemo.entity.GoodsModelEntity;

public interface GoodsModelService {

	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	GoodsModelEntity queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<GoodsModelEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(GoodsModelEntity record);

	/**
	 * 修改
	 * @return 
	 */
    int update(GoodsModelEntity record);

	/**
	 * 批量逻辑删除
	 * @param entity
	 */

    
    boolean deleteByPrimaryKey(Long[] id);
    
    GoodsModelEntity selectByPrimaryKey(Integer id);
   
    List<GoodsModelEntity> findForSearch( Map<String,String> param,
				int index, int count) ;
    int findForCount();

	int insert(GoodsModelEntity record);

}
