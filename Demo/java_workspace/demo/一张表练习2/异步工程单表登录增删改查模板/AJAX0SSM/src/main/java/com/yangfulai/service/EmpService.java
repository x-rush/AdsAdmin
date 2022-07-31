package com.yangfulai.service;

import java.util.List;

import com.yangfulai.pojo.Employee;
/**
 * 
 * TODO<员工的业务接口>
 * @author  杨福来
 * @date  2019年8月23日 下午1:46:55
 * @version  V1.0
 */
public interface EmpService {

		/**
		 * 
		 * TODO<员工表的添加方法>
		 * @param emp
		 * @return
		 */
		boolean add(Employee emp);
		/**
		 * 
		 * TODO<员工表的修改方法>
		 * @param emp
		 * @return
		 */
		boolean edit(Employee emp);
		/**
		 * 
		 * TODO<员工表的删除方法>
		 * @param employeeNo部门ID
		 * @return
		 */
		boolean remove(String employeeNo);
		/**
		 * 
		 * TODO<根据主键查询一条数据（一个对象）>
		 * @param employeeNo部门ID
		 * @return
		 */
		Employee selectOne(String employeeNo);
		/**
		 * 
		 * TODO<统计记录个数的方法（搜索条件：按照名字模糊查询、）>
		 * @param name员工名字
		 * @return
		 */
		int getCount(String name);
		/**
		 * 
		 * TODO<分页集合（名字搜索）>
		 * @param name搜索条件
		 * @param page页码
		 * @param rows每页的记录数
		 * @return
		 */
		List<Employee>  selectAll(String name,int page,int rows);
		/**
		 * 
		 * TODO<求页数的方法>
		 * @param name总记录数
		 * @param page每页的个数/每页记录数
		 * @return
		 */
		int findPageCount(String name,int page);
	
	
	
	
	
}
