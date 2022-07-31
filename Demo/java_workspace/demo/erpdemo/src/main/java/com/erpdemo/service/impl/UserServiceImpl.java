package com.erpdemo.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.SysUserDao;
import com.erpdemo.entity.SysUserEntity;
import com.erpdemo.service.UserService;
import com.erpdemo.utils.RRException;
import com.erpdemo.utils.validator.Assert;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private SysUserDao sysUserDao;
	
	@Override
	public SysUserEntity queryObject(Long userId){
		return sysUserDao.queryObject(userId);
	}
	
	@Override
	public List<SysUserEntity> queryList(Map<String, Object> map){
		return sysUserDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return sysUserDao.queryTotal(map);
	}
	
	@Override
	public void save(String mobile, String password){
		SysUserEntity user = new SysUserEntity();
		user.setMobile(mobile);
		user.setUsername(mobile);
		user.setPassword(DigestUtils.sha256Hex(password));
		user.setCreateTime(new Date());
		sysUserDao.save(user);
	}
	
	@Override
	public void update(SysUserEntity user){
		sysUserDao.update(user);
	}
	
	@Override
	public void delete(Long userId){
		sysUserDao.delete(userId);
	}
	
	@Override
	public void deleteBatch(Long[] userIds){
		sysUserDao.deleteBatch(userIds);
	}

	@Override
	public SysUserEntity queryByMobile(String mobile) {
		return sysUserDao.queryByMobile(mobile);
	}

	@Override
	public long login(String mobile, String password) {
		SysUserEntity user = queryByMobile(mobile);
		Assert.isNull(user, "手机号或密码错误");

		//密码错误
		if(!user.getPassword().equals(DigestUtils.sha256Hex(password))){
			throw new RRException("手机号或密码错误");
		}

		return user.getUserid();
	}
}
