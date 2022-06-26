package com.yangfulai.service;

import java.util.List;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;

import com.yangfulai.pojo.Admin;
/**
 * 用户的业务接口
 * 
 * TODO<用户表业务层的接口>
 * @author  杨福来
 * @date  2019年8月21日 上午10:01:15
 * @version  V1.0
 * 不从缓存中找数据的注解-@CachePut(value="user_cache")
 * 从缓存中找数据的注解-@Cacheable(value="user_cache")
 */
@CachePut(value="user_cache")//不从缓存中找数据
public interface AdminService {

		/**
		 * 
		 * TODO添加用户的方法
		 * @param admin
		 * @return
		 */
		//添加
		boolean add(Admin admin);

		
		/**
		 * 
		 * TODO编辑用户的方法
		 * @param admin
		 * @return
		 */
		//修改
		boolean edit(Admin admin);
		
		
		
		/**
		 * 
		 * TODO<根据用户名删除>
		 * @param username用户名
		 * @return
		 */
		//删除
		boolean remove(String username);
		
		
		/**
		 * 
		 * TODO<查询根据主键>
		 * @param username用户名(主键)
		 * @return
		 */
		Admin findOne(String username);

		
		/**
		 * 
		 * TODO<统计记录个数的方法（搜索条件：按照名查询、）>
		 * @param username用户名
		 * @return
		 */
		int getCount(String username);
		
		
		/**
		 * 查询用户的方法(搜索,分页)
		 * 
		 * 对用户数据进行缓存
		 * 
		 * username:搜索条件用户名
		 * page:页码,第几页			dao层和Service层意思不一样
		 * rows:每页的记录数
		 * TODO<搜索功能查询用户的方法(搜索,分页)>
		 * @return
		 */
		//分页集合（名字搜索）
		//@Cacheable(value="user_cache")//缓存区 5-5	从缓存中查找
		//@CachePut(value="user_cache")//不从缓存区中查找
		List<Admin> findAll(String username,int page,int rows);
		

		
		
		/**
		 * 
		 * TODO<返回所有对象的集合>
		 * 用于登录查询-获取库中的用户名和密码
		 * @return
		 */
		//返回所有对象集合	
		List<Admin> findAll2();
		
		
		
		/**
		 * 
		 * TODO<求页数>
		 * @param name总记录数
		 * @param page每页的个数/每页记录数
		 * @return
		 */
		//求页数	求总页数的方法
		int findPageCount(String name,int page);
		
		
		
		
		
}
