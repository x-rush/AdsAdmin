package com.erpdemo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.GoodsCheckEntityMapper;
import com.erpdemo.entity.GoodsCheckEntity;
import com.erpdemo.service.GoodsCheckService;
import com.erpdemo.vo.GoodsCheckVO;

@Service
public class GoodsCheckServiceImpl implements GoodsCheckService {

	@Autowired
	private GoodsCheckEntityMapper goodsCheckEntityMapper;
	
	/**
	 * 查询所有
	 */
	@Override
	public List<GoodsCheckEntity> showAll() {
		return goodsCheckEntityMapper.showAll();
	}

	/**
	 * 分页查询
	 */
	@Override
	public List<GoodsCheckEntity> getPage(int pageNumber, int pageCount) {
		int startIndex=(pageNumber-1)*pageCount;
		return goodsCheckEntityMapper.getPage(startIndex, pageCount);
	}

	/**
	 * 获取总页码数
	 */
	@Override
	public int getTotalPageNumber(int pageCount) {
		int totalNumber=goodsCheckEntityMapper.getTotalNumber();
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
		int totalNumber=goodsCheckEntityMapper.getTotalNumber();
		return totalNumber;
	}
	
	/**
	 * 保存数据
	 */
	@Override
	public boolean save(GoodsCheckEntity record) {
		int num=goodsCheckEntityMapper.insert(record);
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
	public GoodsCheckEntity getOneById(int id) {
		
		return goodsCheckEntityMapper.getOneById(id);
	}

	/**
	 * 更新数据
	 */
	@Override
	public boolean update(GoodsCheckEntity record) {
		int num = goodsCheckEntityMapper.updateByPrimaryKeySelective(record);
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
		int num = goodsCheckEntityMapper.setDeleteFlag(id);
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
	public List<GoodsCheckEntity> search(GoodsCheckVO goodsCheckVO) {
		Map<String,String>param=new HashMap<>();
		param.put("checknumber",goodsCheckVO.getChecknumber());
		
		return goodsCheckEntityMapper.search(param);
	}

	
	
	

}
