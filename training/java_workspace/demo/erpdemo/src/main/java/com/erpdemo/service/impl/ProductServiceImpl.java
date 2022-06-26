package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.ProductEntityMapper;
import com.erpdemo.entity.ProductEntity;
import com.erpdemo.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductEntityMapper productEntityMapper;
	
	
	@Override
	public ProductEntity queryObject(int id) {
		return productEntityMapper.queryObject(id);
	}

	@Override
	public List<ProductEntity> queryList(Map<String, Object> map) {
		return productEntityMapper.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		
		return productEntityMapper.queryTotal(map);
	}

	@Override
	public void save(ProductEntity entity) {
		productEntityMapper.save(entity);
	}

	@Override
	public void update(ProductEntity entity) {
		productEntityMapper.update(entity);
	}

	@Override
	public void delete(ProductEntity entity) {
		productEntityMapper.delete(entity.getId());
	}

	@Override
	public void delete(Long[] ids) {
		productEntityMapper.deleteBatch(ids);
	}

	@Override
	public void updateList(int[] ids) {
		
		for(int id : ids) {
			
			ProductEntity entity = productEntityMapper.queryObject(id);
			
			if(entity!=null) {
				entity.setDelflag(1);
				productEntityMapper.update(entity);
			}
		}
		
		
		
		
	}
	
	
	
	
}
