package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.SysSaleListGoods;

public interface SysSaleListGoodsService {

	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	SysSaleListGoods queryObject(int id);
	
	/**
	 * 查询列表
	 */
	List<SysSaleListGoods> queryList(Map<String, Object> map);
	
	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);
	
	/**
	 * 保存
	 */
	void save(SysSaleListGoods sysSaleListGoods);

	/**
	 * 修改
	 */
	void update(SysSaleListGoods sysSaleListGoods);

	/**
	 * 批量逻辑删除
	 * @param entity
	 */
	void updateList(int[] ids);
	
}
