package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.ProductTypeEntityMapper;
import com.erpdemo.entity.ProductTypeEntity;
import com.erpdemo.service.ProductTypeService;

@Service("productTypeService")
public class ProductTypeServiceImpl implements ProductTypeService {

	@Autowired
	private ProductTypeEntityMapper productTypeEntityMapper;
	
	
	@Override
	public ProductTypeEntity queryObject(int id) {
		return productTypeEntityMapper.queryObject(id);
	}

	@Override
	public List<ProductTypeEntity> queryList(Map<String, Object> map) {
		return productTypeEntityMapper.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		
		return productTypeEntityMapper.queryTotal(map);
	}

	@Override
	public void save(ProductTypeEntity entity) {
		productTypeEntityMapper.save(entity);
	}

	@Override
	public void update(ProductTypeEntity entity) {
		productTypeEntityMapper.update(entity);
	}

	@Override
	public void delete(ProductTypeEntity entity) {
		productTypeEntityMapper.delete(entity.getId());
	}

	@Override
	public void delete(Long[] ids) {
		productTypeEntityMapper.deleteBatch(ids);
	}

	@Override
	public void updateList(int[] ids) {
		
		for(int id : ids) {
			
			ProductTypeEntity entity = productTypeEntityMapper.queryObject(id);
			
			if(entity!=null) {
				
				productTypeEntityMapper.update(entity);
			}
		}
		
		
		
		
	}
	
	
	
	
}
