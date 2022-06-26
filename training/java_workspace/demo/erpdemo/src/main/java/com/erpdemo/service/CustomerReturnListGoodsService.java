package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.CustomerReturnListEntity;
import com.erpdemo.entity.CustomerReturnListGoodsEntity;

/*商品退货单商品 alexander
*/

public interface CustomerReturnListGoodsService {
	

	/* 查询所有
	*/
	List<CustomerReturnListGoodsEntity> findAll();
	
	
	/*添加单条数据
	*/
	int add(CustomerReturnListGoodsEntity customerReturnListGoodsEntity);
	
	
	/*	查询一条
	*/
	CustomerReturnListGoodsEntity getOne(String id);
	
	
	int update(CustomerReturnListGoodsEntity customerReturnListGoodsEntity);
	
	
	/* 查询退货单号
	*/
	List<CustomerReturnListGoodsEntity> search(String aaa);
	
	
	void deleteBatch(Long[] ids);

	
	
	
	
	
	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	CustomerReturnListGoodsEntity queryObject(int id);

	
	/**
	 * 查询列表
	 */
	List<CustomerReturnListGoodsEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(CustomerReturnListGoodsEntity entity);
	
	/**
	 * 修改
	 */
//	void update(CustomerReturnListGoodsEntity entity);

	/**
	 * 删除
	 * @param entity
	 */
	void delete(CustomerReturnListGoodsEntity entity);
	
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
