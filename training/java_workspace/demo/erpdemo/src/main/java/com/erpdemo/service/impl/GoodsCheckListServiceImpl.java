package com.erpdemo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.GoodsCheckListEntityMapper;
import com.erpdemo.entity.GoodsCheckListEntity;
import com.erpdemo.service.GoodsCheckListService;
import com.erpdemo.vo.GoodsCheckListVO;

@Service
public class GoodsCheckListServiceImpl implements GoodsCheckListService {

	@Autowired
	private GoodsCheckListEntityMapper goodsCheckListEntityMapper;
	
	/**
	 * 查询所有
	 */
	@Override
	public List<GoodsCheckListEntity> showAll() {
		return goodsCheckListEntityMapper.showAll();
	}

	/**
	 * 分页查询
	 */
	@Override
	public List<GoodsCheckListEntity> getPage(int pageNumber, int pageCount) {
		int startIndex=(pageNumber-1)*pageCount;
		return goodsCheckListEntityMapper.getPage(startIndex, pageCount);
	}

	/**
	 * 获取总页码数
	 */
	@Override
	public int getTotalPageNumber(int pageCount) {
		int totalNumber=goodsCheckListEntityMapper.getTotalNumber();
		if(totalNumber%pageCount==0) {
			return totalNumber/pageCount;
		} else {
			return (totalNumber/pageCount)+1;
		}
	}

	/**
	 * 查询总记录数
	 */
	@Override
	public int getTotalNumber() {
		int totalNumber=goodsCheckListEntityMapper.getTotalNumber();
		return totalNumber;
	}
	
	/**
	 * 保存数据
	 */
	@Override
	public boolean save(GoodsCheckListEntity record) {
		int num=goodsCheckListEntityMapper.insert(record);
		if(num>0) {
			return true;
		}else {
			return false;
		}
	}

	/**
	 * 按照id获取数据
	 */
	@Override
	public GoodsCheckListEntity getOneById(int id) {
		
		return goodsCheckListEntityMapper.getOneById(id);
	}

	/**
	 * 更新数据
	 */
	@Override
	public boolean update(GoodsCheckListEntity record) {
		int num = goodsCheckListEntityMapper.updateByPrimaryKeySelective(record);
		if(num>0) {
			return true;
		}else {
			return false;
		}
	}

	/**
	 * 删除（隐藏）数据
	 */
	@Override
	public boolean delete(int id) {
		int num = goodsCheckListEntityMapper.setDeleteFlag(id);
		if(num>0) {
			return true;
		}else {
			return false;
		}
	}

	/**
	 * 条件查询
	 */
	@Override
	public List<GoodsCheckListEntity> search(GoodsCheckListVO goodsCheckListVO) {
		Map<String,String>param=new HashMap<>();
//		param.put("checknumber",goodsCheckListVO.getChecknumber());
		
		return goodsCheckListEntityMapper.search(param);
	}

}
