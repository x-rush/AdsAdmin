package com.yangfulai.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yangfulai.pojo.Admin;
/**
 * 
 * TODO<用户表的数据层接口>
 * @author  杨福来
 * @date  2019年8月23日 下午2:03:04
 * @version  V1.0
 */
public interface AdminDAO {


		/**
		 * 
		 * TODO<用户表添加的方法>
		 * @param admin
		 * @return
		 */
		int insert(Admin admin);
		/**
		 * 
		 * TODO<用户表修改的方法>
		 * @param admin
		 * @return
		 */
		int update(Admin admin);
		/**
		 * 
		 * TODO<用户表删除的方法>
		 * @param username用户名
		 * @return
		 */
		int delete(String username);
		/**
		 * 
		 * TODO<根据主键查询一条数据（一个对象）>
		 * @param username用户名
		 * @return
		 */
		Admin selectOne(String username);
		
		
		

		/**
		 * 
		 * TODO<统计记录个数的方法（搜索条件：按照名字模糊查询、）每页的记录数>
		 * @param username用户名
		 * @return
		 */
		int getCount(@Param("username")String username);
		/**
		 * 
		 * TODO<分页集合（名字搜索）>
		 * @param username条件
		 * @param page起始位置
		 * @param rows每页的记录数
		 * @return
		 */
		//分页集合（名字搜索）	username条件 	page起始位置	rows每页的记录数		获取某一个表格数据
		List<Admin> selectAll(@Param("username")String username,@Param("page")int page,@Param("rows")int rows);
		/**
		 * 
		 * TODO<登录查询所有集合	返回所有对象集合	>
		 * @return
		 */
		List<Admin> getAll();
		
		/**
		 * 
		 * TODO<求页数的方法>
		 * @param name总记录数
		 * @param page每页的个数
		 * @return
		 */
		int getPageCount(String name,int page);
		
		
		
}
