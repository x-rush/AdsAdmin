package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.PurchaseEntityMapper;
import com.erpdemo.entity.PurchaseEntity;
import com.erpdemo.service.PurchaseService;

@Service("purchaseService")
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private PurchaseEntityMapper purchaseEntityMapper;
	
	
	@Override
	public PurchaseEntity queryObject(int id) {
		return purchaseEntityMapper.queryObject(id);
	}

	@Override
	public List<PurchaseEntity> queryList(Map<String, Object> map) {
		return purchaseEntityMapper.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		
		return purchaseEntityMapper.queryTotal(map);
	}

	@Override
	public void save(PurchaseEntity entity) {
		purchaseEntityMapper.save(entity);
	}

	@Override
	public void update(PurchaseEntity entity) {
		purchaseEntityMapper.update(entity);
	}

	@Override
	public void delete(PurchaseEntity entity) {
		purchaseEntityMapper.delete(entity.getId());
	}

	@Override
	public void delete(Long[] ids) {
		purchaseEntityMapper.deleteBatch(ids);
	}

	@Override
	public void updateList(int[] ids) {
		
		for(int id : ids) {
			
			PurchaseEntity entity = purchaseEntityMapper.queryObject(id);
			
			
		}
		
		
		
		
	}
	
	
	
	
}
