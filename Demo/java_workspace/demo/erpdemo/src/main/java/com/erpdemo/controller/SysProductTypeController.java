package com.erpdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.ProductTypeEntity;
import com.erpdemo.service.ProductTypeService;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.R;

/**
 * 系统用户
 * 
 */
@RestController
@RequestMapping("/sys/producttype")
public class SysProductTypeController extends AbstractController {
	
	@Autowired
	private ProductTypeService productTypeService;
	
	

	@RequestMapping("/selectAll")
	public R selectAll() {
		// 查询列表数据
		List<ProductTypeEntity> list = productTypeService.queryList(null);
		
		return R.ok().put("list", list);
	}

	
}
