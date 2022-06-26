package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.bean.Product;
import com.example.demo.service.ProductService;
import com.example.demo.vo.ProductVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/show")
	@ResponseBody
	public Object show() {
		
		List<Product> list_product = productService.findAll();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list_product", list_product);
		
		return map;
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public  Map<String,Object> search(
			@RequestBody ProductVO productVO) {

		String name = productVO.getName();
		
		String price_s = productVO.getPrice_s();
		
		String price_e = productVO.getPrice_e();
		
		String currPage = productVO.getCurrPage();
		
//		@RequestParam Map<String,String> param
		
//		String name = param.get("name");
//		String price_s = param.get("price_s");
//		String price_e = param.get("price_e");
		
		int index = 0;
		
		int count = 5;
		
		index = (Integer.parseInt(currPage) -1 ) * count ;
		
		Map<String,String> param = new HashMap<String,String>();

		
		int total = 0;
		
		total = productService.findForCount();
		
		int totalPage = 0 ;
		
		if( total%count == 0) {
			totalPage = total / count ;
		}
		else {
			totalPage = total / count + 1;
		}
		
		
		param.put("name", name);
		param.put("price_s", price_s);
		param.put("price_e", price_e);
		
		List<Product> list_product = productService.findForSearch(param,index,count);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list_product", list_product);
		
		map.put("totalPage", totalPage);
		
		return map;
	}
	
	@RequestMapping("/page")
	@ResponseBody
	public  Map<String,Object> page(String currPage) {

		
		
		int index = 0;
		
		int count = 5;
		
		int total = 0;
		
		total = productService.findForCount();
		
		int totalPage = 0 ;
		
		if( total%count == 0) {
			totalPage = total / count ;
		}
		else {
			totalPage = total / count + 1;
		}
		
		index = (Integer.parseInt(currPage) -1 ) * count ;
		
		Map<String,String> param = new HashMap<String,String>();

		List<Product> list_product = productService.findForSearch(param,index,count);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list_product", list_product);
		
		map.put("totalPage", totalPage);
		
		return map;
	}
	
	
	@RequestMapping("/del")
	@ResponseBody
	public Map<String,Object> del(@RequestParam Map<String,String> param) {
		
		String id = param.get("id");
		
		int num = productService.delete(Integer.parseInt(id));
		
		if(num!=1) {
			
			// 删除失败 
			
			return null;
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("code", 0);
		
		return map;
	}
	
	
	@RequestMapping("/dels")
	@ResponseBody
	public Map<String,Object> dels(Long[] ids) {
		

		
		System.out.println(ids);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("code", 0);
		
		return map;
	}
	
	// String name,String price,String num
	// Product product
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> save(
			@RequestParam Map<String,String> param) {

		String name = param.get("name");
		String price = param.get("price");
		String num = param.get("num");
		
		Product entity = new Product();
		
		entity.setName(name);
		entity.setPrice(Double.parseDouble(price));
		entity.setNum(Integer.parseInt(num));
		
		int count = productService.add(entity);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("code", 0);
		
		return map;
	}
	
	
	@RequestMapping("/getOne")
	@ResponseBody
	public Map<String,Object> getOne(String id) {

		Product product = productService.findById(id);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("code", 0);
		
		map.put("product",product);
		
		return map;
	}
	
	
	@RequestMapping("/doupdate")
	@ResponseBody
	public Map<String,Object> doupdate(
			@RequestParam Map<String,String> param) {

		String name = param.get("name");
		String price = param.get("price");
		String num = param.get("num");
		
		Product entity = new Product();
		
		entity.setName(name);
		entity.setPrice(Double.parseDouble(price));
		entity.setNum(Integer.parseInt(num));
		
		int count = productService.update(entity);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("code", 0);
		
		return map;
	}
	
}
