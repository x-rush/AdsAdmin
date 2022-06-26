package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.bean.Product;
import com.example.demo.dao.ProductMapper;

@Service
public class ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	public List<Product> findAll() {
		
		return productMapper.findAll();
	}
	
//	public List<Product> findForSearch(String name) {
//		
//		return productMapper.findForSearch(name);
//	}
	
	public List<Product> findForSearch(
			Map<String,String> param) {
		
		return this.findForSearch(param,0,5);
	}
	
	public List<Product> findForSearch(
			Map<String,String> param,
			int index, int count) {
		
		return productMapper.findForSearch(param,index,count);
	}
	
	public int findForCount(){
		return productMapper.findForCount();
	}
	
	
	public int delete(int id) {
		return productMapper.deleteByPrimaryKey(id);
	}
	
	public int add(Product entity) {
		return productMapper.insert(entity);
	}
	
	public int update(Product entity) {
		return productMapper.updateByPrimaryKey(entity);
	}
	
	public Product findById(String id) {
		return productMapper.selectByPrimaryKey(Integer.parseInt(id));
	}
	
	
	
}
