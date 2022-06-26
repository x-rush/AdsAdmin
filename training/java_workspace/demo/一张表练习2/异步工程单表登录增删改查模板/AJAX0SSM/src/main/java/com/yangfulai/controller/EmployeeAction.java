package com.yangfulai.controller;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yangfulai.service.EmpService;
/**
 * 
 * TODO<员工表的控制器>
 * @author  杨福来
 * @date  2019年8月23日 下午2:10:52
 * @version  V1.0
 */


@RestController
@RequestMapping("/e")
public class EmployeeAction {

	@Autowired
	private EmpService service;
			
	//查询						
	@RequestMapping("/table")													
	public Map<String,Object> table(String serachName,Integer currentPage,Integer pageSize) {
		Map<String,Object> map=new HashMap<String,Object>();
		
		System.out.println(serachName);//搜索条件
		System.out.println(currentPage);//页码
		System.out.println(pageSize);//每页的记录数
		System.out.println("控制器");
		
		//1.存储用户集合
		map.put("list", service.selectAll(serachName, currentPage, pageSize));
		
		//2.总页数
		map.put("pageCount", service.findPageCount(serachName, pageSize));
		
		//3.总记录数
		map.put("totalCount", service.getCount(serachName));
		//4.当前页页码	
		map.put("currentPage", currentPage);
		return map;
		
	}

	
	
	
	
			
			
}
