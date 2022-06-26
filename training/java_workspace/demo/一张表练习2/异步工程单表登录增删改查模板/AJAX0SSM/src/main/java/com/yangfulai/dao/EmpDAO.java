package com.yangfulai.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yangfulai.pojo.Employee;
/**
 * 
 * TODO<员工表的数据层接口>
 * @author  杨福来
 * @date  2019年8月23日 下午2:04:18
 * @version  V1.0
 */
public interface EmpDAO {

		/**
		 * 
		 * TODO<员工表的添加>
		 * @param emp
		 * @return
		 */
		int insert(Employee emp);
		/**
		 * 
		 * TODO<员工表的修改>
		 * @param emp
		 * @return
		 */
		int update(Employee emp);
		/**
		 * 
		 * TODO<员工表的删除>
		 * @param employeeNo
		 * @return
		 */
		int delete(String employeeNo);
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
		int getCount(@Param("name")String name);
		/**
		 * 
		 * TODO<分页集合（名字搜索）>
		 * @param name员工名字
		 * @param page起始位置
		 * @param rows每页的记录数
		 * @return
		 */
		List<Employee>  selectAll(@Param("name")String name,@Param("page")int page,@Param("rows")int rows);
		/**
		 * 
		 * TODO<求页数的方法>
		 * @param name总记录数
		 * @param page每页的个数
		 * @return
		 */
		int getPageCount(String name,int page);
	
}
