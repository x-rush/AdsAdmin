package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.CustomerReturnListEntity;
import com.erpdemo.entity.CustomerReturnListGoodsEntity;

/*商品退货单 alexander
*/
public interface CustomerReturnListService {
	
	
	/* 查询所有
	*/
	List<CustomerReturnListEntity> findAll();
	
	
	/*添加单条数据
	*/
	int add(CustomerReturnListEntity customerReturnListEntity);
	
	
	/*	查询一条
	*/
	CustomerReturnListEntity getOne(String id);
	
	
	int update(CustomerReturnListEntity customerReturnListEntity);
	
	
	/* 查询退货单号
	*/
	List<CustomerReturnListEntity> search(String customerreturnnumber);
	
	
	
	void deleteBatch(Long[] ids);
	
	
	
	
	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	CustomerReturnListEntity queryObject(int id);

	
	/**
	 * 查询列表
	 */
	List<CustomerReturnListEntity> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(CustomerReturnListEntity entity);
	
	/**
	 * 修改
	 */
//	int update(CustomerReturnListEntity entity);

	/**
	 * 删除
	 * @param entity
	 */
	void delete(CustomerReturnListEntity entity);
	
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






