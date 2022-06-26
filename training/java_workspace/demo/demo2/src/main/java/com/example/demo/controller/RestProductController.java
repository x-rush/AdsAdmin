package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.bean.Product;
import com.example.demo.service.ProductService;

@RestController
@RequestMapping("/restproduct")
public class RestProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/show")
	public Object show() {
		
		List<Product> list_product = productService.findAll();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list_product", list_product);
		
		return map;
	}
	
}
