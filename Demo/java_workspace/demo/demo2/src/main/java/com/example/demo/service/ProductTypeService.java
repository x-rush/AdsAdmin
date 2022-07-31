package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.bean.ProductType;
import com.example.demo.dao.ProductTypeMapper;

@Service
public class ProductTypeService {

	@Autowired
	private ProductTypeMapper productTypeMapper;
	
	public List<ProductType> findAll() {
		
		return productTypeMapper.findAll();
	}
	
	public int delete(int id) {
		return productTypeMapper.deleteByPrimaryKey(id);
	}
	
	public int add(ProductType entity) {
		return productTypeMapper.insert(entity);
	}
	
	public int update(ProductType entity) {
		return productTypeMapper.updateByPrimaryKey(entity);
	}
	
	public ProductType findById(String id) {
		return productTypeMapper.selectByPrimaryKey(Integer.parseInt(id));
	}
	
	
	
}
