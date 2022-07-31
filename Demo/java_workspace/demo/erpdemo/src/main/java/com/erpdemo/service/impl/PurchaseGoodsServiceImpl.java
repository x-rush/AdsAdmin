package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.PurchaseGoodsEntityMapper;
import com.erpdemo.entity.PurchaseGoodsEntity;
import com.erpdemo.service.PurchaseGoodsService;

@Service("purchaseGoodsService")
public class PurchaseGoodsServiceImpl implements PurchaseGoodsService {

	@Autowired
	private PurchaseGoodsEntityMapper purchaseGoodsEntityMapper;
	
	
	@Override
	public PurchaseGoodsEntity queryObject(int id) {
		return purchaseGoodsEntityMapper.queryObject(id);
	}

	@Override
	public List<PurchaseGoodsEntity> queryList(Map<String, Object> map) {
		return purchaseGoodsEntityMapper.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		
		return purchaseGoodsEntityMapper.queryTotal(map);
	}

	@Override
	public void save(PurchaseGoodsEntity entity) {
		purchaseGoodsEntityMapper.save(entity);
	}

	@Override
	public void update(PurchaseGoodsEntity entity) {
		purchaseGoodsEntityMapper.update(entity);
	}

	@Override
	public void delete(PurchaseGoodsEntity entity) {
		purchaseGoodsEntityMapper.delete(entity.getId());
	}

	@Override
	public void delete(Long[] ids) {
		purchaseGoodsEntityMapper.deleteBatch(ids);
	}

	@Override
	public void updateList(int[] ids) {
		
		for(int id : ids) {
			
			PurchaseGoodsEntity entity = purchaseGoodsEntityMapper.queryObject(id);
			
			if(entity!=null) {
				
				purchaseGoodsEntityMapper.update(entity);
			}
		}
		
		
		
		
	}
	
	
	
	
}
