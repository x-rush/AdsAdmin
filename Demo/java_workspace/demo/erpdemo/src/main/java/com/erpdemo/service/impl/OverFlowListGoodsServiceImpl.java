package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.OverFlowListGoodsEntityMapper;
import com.erpdemo.entity.OverFlowListGoodsEntity;
import com.erpdemo.service.OverFlowListGoodsService;
@Service("overFlowListGoodsService")
public class OverFlowListGoodsServiceImpl implements OverFlowListGoodsService {

	@Autowired
	private OverFlowListGoodsEntityMapper overFlowListGoodsEntityMapper;

	@Override
	public OverFlowListGoodsEntity queryObject(int id) {
		
		return overFlowListGoodsEntityMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<OverFlowListGoodsEntity> queryList(Map<String, Object> map) {
		
		return overFlowListGoodsEntityMapper.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		
		return overFlowListGoodsEntityMapper.queryTotal(map);
	}

	@Override
	public int save(OverFlowListGoodsEntity entity) {
		return overFlowListGoodsEntityMapper.insert(entity);
		
	}

	@Override
	public void update(OverFlowListGoodsEntity entity) {
		overFlowListGoodsEntityMapper.update(entity);
	}

	
	//未实现
	@Override
	public boolean delete(Long[] ids) {
		
		return false;
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		
	}

	//逻辑删除
	@Override
	public boolean updateList(Long[] ids) {
		if(ids.length>0) {
			overFlowListGoodsEntityMapper.updateList(ids);
			return true;
		}
		else {
		return false;
		}
	}

	

}
