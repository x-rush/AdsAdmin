package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.ProductEntity;


/**
 * 商品
 * 
 */
public interface ProductService {
	

	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	ProductEntity queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<ProductEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(ProductEntity entity);
	
	/**
	 * 修改
	 */
	void update(ProductEntity entity);

	/**
	 * 删除
	 * @param entity
	 */
	void delete(ProductEntity entity);
	
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
