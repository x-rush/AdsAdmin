package com.yangfulai.service;

import java.util.List;

import com.yangfulai.pojo.Department;
/**
 * 
 * TODO<部门的用户接口>
 * @author  杨福来
 * @date  2019年8月23日 下午1:46:32
 * @version  V1.0
 */
public interface DepartmentService {


	/**
	 * 
	 * TODO<添加部门的方法>
	 * @param department部门
	 * @return
	 */
	boolean add(Department department);
	/**
	 * 
	 * TODO<修改部门的方法>
	 * @param department
	 * @return
	 */
	boolean edit(Department department);
	/**
	 * 
	 * TODO<删除部门的方法>
	 * @param departmentNo部门ID(主键)
	 * @return
	 */
	boolean remove(String departmentNo);
	
	/**
	 * 
	 * TODO<根据主键查询一条数据（一个对象）>
	 * @param departmentNo部门ID(主键)
	 * @return
	 */
	Department selectOne(String departmentNo);
	/**
	 * 
	 * TODO<查询全部对象返回集合>
	 * @return
	 */
	 List<Department> GetAll();

	 /**
	  * 
	  * TODO<统计记录个数的方法（搜索条件：按照名字模糊查询、）>
	  * @param departmentName部门名称
	  * @return
	  */
	int getCount(String departmentName);
	//
	/**
	 * 
	 * TODO<分页集合（名字搜索）>
	 * @param departmentName搜索条件
	 * @param page页码
	 * @param rows每页的记录数
	 * @return
	 */
	List<Department>  selectAll(String departmentName,int page,int rows);
	
	
	
	/**
	 * 
	 * TODO<求页数个数的方法>
	 * @param name总记录数
	 * @param page每页的个数  每页的记录数
	 * @return
	 */
	int findPageCount(String name,int page);
	
	
	
	
	
}
