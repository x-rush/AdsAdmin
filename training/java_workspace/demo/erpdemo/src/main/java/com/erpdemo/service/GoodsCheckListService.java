package com.erpdemo.service;

import java.util.List;

import com.erpdemo.entity.GoodsCheckListEntity;
import com.erpdemo.vo.GoodsCheckListVO;

public interface GoodsCheckListService {
	/**
	 * 查询所有
	 * @return
	 */
	public List<GoodsCheckListEntity> showAll();
	
	/**
	 * 分页查询
	 * @param pageNumber
	 * @param pageCount
	 * @return
	 */
	public List<GoodsCheckListEntity> getPage(int pageNumber,int pageCount);
	
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
	public boolean save(GoodsCheckListEntity record);
	
	/**
	 * 按照id获取数据
	 * @param id
	 * @return
	 */
	public GoodsCheckListEntity getOneById(int id);
	
	/**
	 * 更新数据
	 * @param record
	 * @return
	 */
	public boolean update(GoodsCheckListEntity record);
	
	/**
	 * 删除（隐藏）数据
	 * @param id
	 * @return
	 */
	public boolean delete(int id);
	
	
	public List<GoodsCheckListEntity> search(GoodsCheckListVO goodsCheckListVO);
}
