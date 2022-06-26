package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.SysSaleListMapper;
import com.erpdemo.entity.SysSaleList;
import com.erpdemo.service.SysSaleListService;

@Service("sysSaleListService")
public class SysSaleListServiceImpl implements SysSaleListService {
	
	@Autowired
	private SysSaleListMapper sysSaleListMapper;

	@Override
	public int queryTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sysSaleListMapper.queryTotal(map);
	}

	@Override
	public List<SysSaleList> queryList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sysSaleListMapper.queryList(map);
	}

	@Override
	public void save(SysSaleList sysSaleList) {
		// TODO Auto-generated method stub
		sysSaleListMapper.save(sysSaleList);
	}

	@Override
	public SysSaleList queryObject(int id) {
		// TODO Auto-generated method stub
		return sysSaleListMapper.queryObject(id);
	}

	@Override
	public void update(SysSaleList sysSaleList) {
		// TODO Auto-generated method stub
		sysSaleListMapper.update(sysSaleList);
	}

	@Override
	public void updateList(int[] ids) {
		// TODO Auto-generated method stub
		for (int id : ids) {
			SysSaleList entity = sysSaleListMapper.queryObject(id);
			if (entity!=null) {
				entity.setDelflag(1);
				sysSaleListMapper.update(entity);
			}
		}
	}

	
	

	

	
	
}
