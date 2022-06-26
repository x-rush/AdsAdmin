package com.erpdemo.service;

import java.util.List;

import com.erpdemo.entity.GoodsCheckEntity;
import com.erpdemo.vo.GoodsCheckVO;

public interface GoodsCheckService {
	/**
	 * 查询所有
	 * @return
	 */
	public List<GoodsCheckEntity> showAll();
	
	/**
	 * 分页查询
	 * @param pageNumber
	 * @param pageCount
	 * @return
	 */
	public List<GoodsCheckEntity> getPage(int pageNumber,int pageCount);
	
	/**
	 * 查询总页数
	 * @param pageCount
	 * @return
	 */
	public int getTotalPageNumber(int pageCount);
	
	/**
	 * 查询总记录数
	 * @return
	 */
	public int getTotalNumber();
	
	/**
	 * 保存数据
	 * @param record
	 * @return
	 */
	public boolean save(GoodsCheckEntity record);
	
	/**
	 * 按照id获取数据
	 * @param id
	 * @return
	 */
	public GoodsCheckEntity getOneById(int id);
	
	/**
	 * 更新数据
	 * @param record
	 * @return
	 */
	public boolean update(GoodsCheckEntity record);
	
	/**
	 * 删除（隐藏）数据
	 * @param id
	 * @return
	 */
	public boolean delete(int id);
	
	
	public List<GoodsCheckEntity> search(GoodsCheckVO goodsCheckVO);
}
