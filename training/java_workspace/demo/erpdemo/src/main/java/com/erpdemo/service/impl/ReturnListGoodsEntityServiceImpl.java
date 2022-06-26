package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.ReturnListGoodsEntityMapper;
import com.erpdemo.entity.ReturnListGoodsEntity;
import com.erpdemo.service.ReturnListGoodsService;

@Service("returnListGoodsService")
public class ReturnListGoodsEntityServiceImpl implements ReturnListGoodsService{
	
	@Autowired
	private ReturnListGoodsEntityMapper returnListGoodsEntityMapper;

	@Override
	public ReturnListGoodsEntity queryObject(int id) {
		return returnListGoodsEntityMapper.queryObject(id);
	}

	@Override
	public List<ReturnListGoodsEntity> queryList(Map<String, Object> map) {
		return returnListGoodsEntityMapper.queryList(map);
	}

	@Override
	public List<ReturnListGoodsEntity> queryGoods(Map<String, Object> map) {
		return returnListGoodsEntityMapper.queryGoods(map);
	}
	
	@Override
	public List<ReturnListGoodsEntity> querySearch(String id) {
		return returnListGoodsEntityMapper.querySearch(id);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return returnListGoodsEntityMapper.queryTotal(map);
	}

	@Override
	public void save(ReturnListGoodsEntity entity) {
		returnListGoodsEntityMapper.save(entity);
		
	}

	@Override
	public void update(ReturnListGoodsEntity entity) {
		returnListGoodsEntityMapper.update(entity);
		
	}

	@Override
	public void delete(ReturnListGoodsEntity entity) {
		returnListGoodsEntityMapper.delete(entity.getId());
		
	}

	@Override
	public void delete(Long[] ids) {
		returnListGoodsEntityMapper.deleteBatch(ids);
		
	}

	@Override
	public void updateList(int[] ids) {
		
		for(int id : ids) {
			
			ReturnListGoodsEntity entity = returnListGoodsEntityMapper.queryObject(id);
			
			if(entity!=null) {
				entity.setDelflag(1);
				returnListGoodsEntityMapper.update(entity);
			}
		}
		
	}

	
	

}
