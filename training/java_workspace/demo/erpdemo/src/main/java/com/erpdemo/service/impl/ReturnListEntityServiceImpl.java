package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.ReturnListEntityMapper;
import com.erpdemo.entity.ReturnListEntity;
import com.erpdemo.service.ReturnListService;

@Service("returnListService")
public class ReturnListEntityServiceImpl implements ReturnListService{
	
	@Autowired
	private ReturnListEntityMapper returnListEntityMapper;

	@Override
	public ReturnListEntity queryObject(int id) {
		return returnListEntityMapper.queryObject(id);
	}

	@Override
	public List<ReturnListEntity> querySearch(String id) {
		return returnListEntityMapper.querySearch(id);
	}
	
	@Override
	public List<ReturnListEntity> queryList(Map<String, Object> map) {
		return returnListEntityMapper.queryList(map);
	}

	@Override
	public List<ReturnListEntity> queryGoods(Map<String, Object> map) {
		return returnListEntityMapper.queryGoods(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map) {
		return returnListEntityMapper.queryTotal(map);
	}

	@Override
	public void save(ReturnListEntity entity) {
		returnListEntityMapper.save(entity);
		
	}

	@Override
	public void update(ReturnListEntity entity) {
		returnListEntityMapper.update(entity);
		
	}

	@Override
	public void delete(ReturnListEntity entity) {
		returnListEntityMapper.delete(entity.getId());
		
	}

	@Override
	public void delete(Long[] ids) {
		returnListEntityMapper.deleteBatch(ids);
		
	}

	@Override
	public void updateList(int[] ids) {
		for(int id : ids) {
			
			ReturnListEntity entity = returnListEntityMapper.queryObject(id);
			
			if(entity!=null) {
				entity.setDelflag(1);
				returnListEntityMapper.update(entity);
			}
		}
	}

	

	
}
