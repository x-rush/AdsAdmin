package com.erpdemo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.erpdemo.entity.CustomerReturnListEntity;
import com.erpdemo.entity.SysUserEntity;
import com.erpdemo.service.CustomerReturnListService;

public interface CustomerReturnListEntityMapper extends BaseDao<CustomerReturnListEntity>{
	
	
	
	/*查询所有，列表
	*/
	List<CustomerReturnListEntity> findAll();
	
	/*添加单条数据
	*/
	int insert(CustomerReturnListEntity customerReturnListEntity);
	
	
	/*	查询一条
	*/
	CustomerReturnListEntity getOne(int id);
	
	
	int update(CustomerReturnListEntity customerReturnListEntity);
	
	
	List<CustomerReturnListEntity> search(@Param("customerreturnnumber") String customerreturnnumber); 
	
	
	/**	复制的
	 * 查询用户的所有权限
	 * @param userId  用户ID
	 */
	List<String> queryAllPerms(Long userId);
	
	/**
	 * 查询用户的所有菜单ID
	 */
	List<Long> queryAllMenuId(Long userId);
	
	/**
	 * 根据用户名，查询系统用户
	 */
	SysUserEntity queryByUserName(String username);
	
	/**
	 * 修改密码
	 */
	int updatePassword(Map<String, Object> map);
	
	
	List<String> queryByMonth();
	
	SysUserEntity queryByMobile(String mobile);
	
	
	

	
	
	
	
}







