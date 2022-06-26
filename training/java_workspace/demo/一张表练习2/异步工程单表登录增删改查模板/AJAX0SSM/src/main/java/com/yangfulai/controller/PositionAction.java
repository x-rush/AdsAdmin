package com.yangfulai.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yangfulai.pojo.Department;
import com.yangfulai.pojo.Position;
import com.yangfulai.service.DepartmentService;
import com.yangfulai.service.PositionService;
/**
 * 
 * TODO<职位表的控制器>
 * @author  杨福来
 * @date  2019年8月23日 下午2:11:16
 * @version  V1.0
 */
@RestController
@RequestMapping("/p")
public class PositionAction {

		@Autowired
			private PositionService service;
			@Autowired
			private DepartmentService depservice;
			//查询						
			@RequestMapping("/table")
			public Map<String,Object> table(String serachName,Integer currentPage,Integer pageSize) {
				Map<String,Object> map=new HashMap<String,Object>();

				//1.存储用户集合
				map.put("list", service.selectAll(serachName, currentPage, pageSize));
				//2.总页数
				map.put("pageCount", service.findPageCount(serachName, pageSize));
				
				System.out.println("控制器");
				System.out.println(service.findPageCount(serachName, pageSize));
				
				//3.总记录数
				map.put("totalCount", service.getCount(serachName));

				//4.当前页页码	
				map.put("currentPage", currentPage);
				map.put("list_dep", depservice.GetAll());
				return map;
				
			}
	
			
			
			//删除	
			@RequestMapping("/delete")
			public boolean delete(int positionId) {
	
				System.out.println(positionId);

				
				
				return service.remove(positionId);
			}
	
			
			//修改添加
			@RequestMapping("/addAndUpdate")	//职位名称					所属部门				职位工资
			public boolean addAndUpdate(String positionName , Department departmentName,float baseSalary) {
				System.out.println(positionName);
				System.out.println(baseSalary);
				System.out.println(departmentName);
				
				Position pos=new Position();
				pos.setPositionName(positionName);
				pos.setBaseSalary(baseSalary);
				pos.setDepartment(departmentName);
				
				if(service.selectOne(pos.getPositionId())!=null) {
					
					//修改
					return service.edit(pos);
					
				}
				//添加
				return service.add(pos);
			
			}
			
			
			
			
			
			
}
