package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.ProductTypeEntity;


/**
 * 商品
 * 
 */
public interface ProductTypeService {
	

	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	ProductTypeEntity queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<ProductTypeEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(ProductTypeEntity entity);
	
	/**
	 * 修改
	 */
	void update(ProductTypeEntity entity);

	/**
	 * 删除
	 * @param entity
	 */
	void delete(ProductTypeEntity entity);
	
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
