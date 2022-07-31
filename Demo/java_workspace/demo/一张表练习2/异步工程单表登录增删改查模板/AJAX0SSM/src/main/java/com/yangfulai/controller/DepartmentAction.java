package com.yangfulai.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yangfulai.pojo.Admin;
import com.yangfulai.pojo.Department;
import com.yangfulai.service.DepartmentService;
/**
 * 
 * TODO<部门表的控制器>
 * @author  杨福来
 * @date  2019年8月23日 下午2:10:34
 * @version  V1.0
 */
@RestController
@RequestMapping("/d")
public class DepartmentAction {

	@Autowired
	private DepartmentService service;
	
	
	
	
		//查询						
		@RequestMapping("/table")
		public Map<String,Object> table(String serachName,Integer currentPage,Integer pageSize) {
			Map<String,Object> map=new HashMap<String,Object>();

			//1.存储用户集合
			map.put("list", service.selectAll(serachName, currentPage, pageSize));
			//2.总页数
			map.put("pageCount", service.findPageCount(serachName, pageSize));
			
//			System.out.println(service.findPageCount(serachName, pageSize));
			
			//3.总记录数
			map.put("totalCount", service.getCount(serachName));

			//4.当前页页码	
			map.put("currentPage", currentPage);
			return map;
			
		}
	
		
		
		//修改添加
		@RequestMapping("/addAndUpdate")
		public boolean addAndUpdate(String departmentNo ,String departmentName) {
			System.out.println(departmentNo);
			System.out.println(departmentName);
			
			Department dep=new Department();
			dep.setDepartmentName(departmentName);
			dep.setDepartmentNo(departmentNo);
			
			if(service.selectOne(dep.getDepartmentNo())!=null) {
				
				return service.edit(dep);
				
			}
			return service.add(dep);
		
		}
		
		
		
				//删除	
				@RequestMapping("/delete")
				public boolean delete(String departmentNo) {
		
//					System.out.println(departmentNo);

					
					
					return service.remove(departmentNo);
				}
		
				//根据序号删除	post使用@RequestBody注解传参
				@RequestMapping("/delSelect")
				public boolean delSelect(@RequestBody String[] numId) {
					for(int i=0;i<numId.length;i++) {
						 service.remove(numId[i]);
					}
					
					System.out.println(numId[0]);
					
					return true;
					
					
				}
		
		
		
		
		
		
}
