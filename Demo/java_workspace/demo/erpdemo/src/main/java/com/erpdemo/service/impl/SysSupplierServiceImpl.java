package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.SysSupplierDao;
import com.erpdemo.entity.SysSupplierEntity;
import com.erpdemo.service.SysSupplierService;

/**
 * 系统用户
 * 
 */
@Service("sysSupplierService")
public class SysSupplierServiceImpl implements SysSupplierService {
	
	@Autowired
	private SysSupplierDao sysSupplierDao;
	
	@Override
	public List<String> queryAllPerms(Long id) {
		return sysSupplierDao.queryAllPerms(id);
	}

	@Override
	public List<Long> queryAllMenuId(Long id) {
		return sysSupplierDao.queryAllMenuId(id);
	}

	@Override
	public SysSupplierEntity queryObject(Long id) {
		return sysSupplierDao.queryObject(id);
	}

	@Override
	public List<SysSupplierEntity> queryList(Map<String, Object> map){
		return sysSupplierDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map) {
		return sysSupplierDao.queryTotal(map);
	}

	@Override
	public void save(SysSupplierEntity supplier) {
		sysSupplierDao.save(supplier);
	}

	@Override
	public void update(SysSupplierEntity supplier) {
		sysSupplierDao.update(supplier);
	}

	@Override
	public void deleteBatch(Long[] ids) {
		sysSupplierDao.deleteBatch(ids);
	}
	
}
