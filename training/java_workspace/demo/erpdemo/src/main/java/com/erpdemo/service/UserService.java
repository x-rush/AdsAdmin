package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.SysUserEntity;

/**
 * 用户
 * 
 */
public interface UserService {

	SysUserEntity queryObject(Long userId);
	
	List<SysUserEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(String mobile, String password);
	
	void update(SysUserEntity user);
	
	void delete(Long userId);
	
	void deleteBatch(Long[] userIds);

	SysUserEntity queryByMobile(String mobile);

	/**
	 * 用户登录
	 * @param mobile    手机号
	 * @param password  密码
	 * @return          返回用户ID
	 */
	long login(String mobile, String password);
}
