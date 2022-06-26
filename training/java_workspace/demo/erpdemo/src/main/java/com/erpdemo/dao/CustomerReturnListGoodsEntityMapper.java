package com.erpdemo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erpdemo.entity.CustomerReturnListGoodsEntity;

public interface CustomerReturnListGoodsEntityMapper extends BaseDao<CustomerReturnListGoodsEntity> {

	List<CustomerReturnListGoodsEntity> findAll();

	int insert(CustomerReturnListGoodsEntity customerReturnListGoodsEntity);

	/*
	 * 查询一条
	 */
	CustomerReturnListGoodsEntity getOne(int id);

	int update(CustomerReturnListGoodsEntity customerReturnListGoodsEntity);

	List<CustomerReturnListGoodsEntity> search(@Param("name") String aaa);

}