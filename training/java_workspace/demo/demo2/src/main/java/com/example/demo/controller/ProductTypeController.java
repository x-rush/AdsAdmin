package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.bean.ProductType;
import com.example.demo.service.ProductTypeService;

@RestController
@RequestMapping("/producttype")
public class ProductTypeController {

	@Autowired
	private ProductTypeService productTypeService;
	
	@RequestMapping("/findAll")
	public Map<String,Object> findAlls() {
		
		List<ProductType> list_product_type = productTypeService.findAll();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list_product_type", list_product_type);
		
		return map;
	}
	
	
}
