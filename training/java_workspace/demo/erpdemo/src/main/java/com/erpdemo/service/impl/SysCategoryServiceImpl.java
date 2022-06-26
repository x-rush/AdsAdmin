package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.SysCategoryDao;
import com.erpdemo.entity.SysCategoryEntity;
import com.erpdemo.service.SysCategoryService;



/**
 * 系统商品类别
 * 
 */
@Service("sysCategoryService")
public class SysCategoryServiceImpl implements SysCategoryService {
	
	@Autowired
	private SysCategoryDao sysCategoryDao;
	

	@Override
	public List<String> queryAllPerms(Long id) {
		return sysCategoryDao.queryAllPerms(id);
	}

	@Override
	public List<Long> queryAllMenuId(Long id) {
		return sysCategoryDao.queryAllMenuId(id);
	}

	@Override
	public SysCategoryEntity queryByName(String username) {
		return sysCategoryDao.queryByName(username);
	}
	
	@Override
	public SysCategoryEntity queryObject(Long id) {
		return sysCategoryDao.queryObject(id);
	}

	@Override
	public List<SysCategoryEntity> queryList(Map<String, Object> map){
		return sysCategoryDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map) {
		return sysCategoryDao.queryTotal(map);
	}

	@Override
	public void save(SysCategoryEntity category) {
		sysCategoryDao.save(category);
	}

	@Override
	public void update(SysCategoryEntity category) {
		sysCategoryDao.update(category);
	}

	@Override
	public void deleteBatch(Long[] ids) {
		sysCategoryDao.deleteBatch(ids);
	}

	
}
