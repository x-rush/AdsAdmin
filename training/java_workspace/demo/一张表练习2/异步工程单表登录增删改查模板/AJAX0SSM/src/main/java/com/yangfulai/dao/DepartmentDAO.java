package com.yangfulai.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yangfulai.pojo.Admin;
import com.yangfulai.pojo.Department;
/**
 * 
 * TODO<部门表的数据层接口>
 * @author  杨福来
 * @date  2019年8月23日 下午2:03:54
 * @version  V1.0
 */
public interface DepartmentDAO {
		/**
		 * 
		 * TODO<部门表添加的方法>
		 * @param department
		 * @return
		 */
		int insert(Department department);
		/**
		 * 
		 * TODO<部门表修改的方法>
		 * @param department
		 * @return
		 */
		int update(Department department);
		/**
		 * 
		 * TODO<部门表删除的方法>
		 * @param departmentNo
		 * @return
		 */
		int delete(String departmentNo);
		/**
		 * 
		 * TODO<根据主键查询一条数据（一个对象）>
		 * @param departmentNo部门ID
		 * @return
		 */
		Department selectOne(String departmentNo);
		/**
		 * 
		 * TODO<统计记录个数的方法（搜索条件：按照名字模糊查询、）>
		 * @param departmentName部门名称
		 * @return
		 */
		int getCount(@Param("departmentName")String departmentName);
		/**
		 * 
		 * TODO<分页集合（名字搜索）>
		 * @param departmentName部门名称
		 * @param page起始位置
		 * @param rows每页的记录数
		 * @return
		 */
		List<Department>  selectAll(@Param("departmentName")String departmentName,@Param("page")int page,@Param("rows")int rows);
		/**
		 * 
		 * TODO<查询部门所有对象的集合>
		 * @return
		 */
		List<Department> getAll();
		/**
		 * 
		 * TODO<求页数的方法>
		 * @param name总记录数
		 * @param page每页的个数
		 * @return
		 */
		int getPageCount(String name,int page);
}
