package com.yangfulai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yangfulai.dao.AdminDAO;
import com.yangfulai.pojo.Admin;
/**
 * 
 * TODO<用户表业务实现类>
 * @author  杨福来
 * @date  2019年8月23日 下午2:21:22
 * @version  V1.0
 * 事务的注解-@Transactional
 */

@Service
//@Transactional		//事务的注解
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;

	/**
	 * 
	 * 重载方法
	 * 用户添加的记录条数是否等于一条
	 * @param admin
	 * @return	成功or失败
	 */
	@Override
	public boolean add(Admin admin) {
		if(dao.insert(admin) == 1) {
			return true;
		}
		return false;
	}
	/**
	 * 
	 * 重载方法
	 * 用户是否修改数据
	 * @param admin
	 * @return
	 */
	@Override
	public boolean edit(Admin admin) {
		if(dao.update(admin) == 1) {
			return true;
		}
		return false;
	}
	/**
	 * 
	 * 重载方法
	 * 用户是否删除数据
	 * @param username
	 * @return
	 */
	@Override
	public boolean remove(String username) {
		if(dao.delete(username) == 1) {
			return true;
		}
		return false;
	}
	/**
	 * 
	 * 重载方法
	 * 根据用户名查询一个对象
	 * @param username
	 * @return	返回查询的对象
	 */
	@Override
	public Admin findOne(String username) {
		
		return dao.selectOne(username);
	}
	/**
	 * 
	 * 重载方法
	 * 
	 * 统计记录个数的方法（搜索条件：按照名字模糊查询、）
	 * @param username
	 * @return返回查询个数
	 */
	@Override
	public int getCount(String username) {
		
		return dao.getCount(username);
	}
	/**
	 * 搜索功能根据用户名搜索
	 * 重载方法
	 * @param username	用户名
	 * @param page	页数
	 * @param rows	显示条数
	 * @return
	 */
	@Override								//page前台传来的页数
	public List<Admin> findAll(String username,int page,int rows) {
		System.out.println("查询用户数据");
								//(页数-1)*行数=起始位置 		
		return dao.selectAll(username, (page - 1)*rows, rows);
	}
	
	/**
	 * 
	 * 重载方法
	 * 查询用户表所有对象
	 * @return	返回一个对象
	 */
	@Override
	public List<Admin> findAll2() {
		
		return dao.getAll();
	}
	/**
	 * 
	 * 重载方法
		求页数/页码的方法
	 * @param name总记录数
	 * @param rows每页的个数
	 * @return 页码数
	 */
	@Override	//rows每页的个数	name总记录数
	public int findPageCount(String name, int rows) {
		//总页数=p
		int p = dao.getCount(name);
		if(p%rows ==0) {
			return p/rows;			//总记录数 / 每页记录数= 总页数
		}else{
			
			return p/rows+1;
		}

	}
	/*
	 * 		总页数/每页个数=页码

		if(总页数%每页个数==0){
			return 页码
			}else{
			return 页码+1
			}
	 * 
	 * 30(总记录数)	/	5(显示条数) 		=	6(页码)
	 * 32(总记录数)	/	5(显示条数) 		=	7(6(页码)+1)
	 */
	
}
