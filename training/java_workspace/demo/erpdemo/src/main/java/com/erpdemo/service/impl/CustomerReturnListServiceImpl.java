package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.CustomerReturnListEntityMapper;
import com.erpdemo.entity.CustomerReturnListEntity;
import com.erpdemo.entity.CustomerReturnListGoodsEntity;
import com.erpdemo.service.CustomerReturnListService;

@Service("customerReturnListService")
public class CustomerReturnListServiceImpl implements CustomerReturnListService {
	
	@Autowired
	private CustomerReturnListEntityMapper customerReturnListEntityMapper;
	
	@Override
	public CustomerReturnListEntity queryObject(int id) {
		return customerReturnListEntityMapper.queryObject(id);
	}

	@Override
	public List<CustomerReturnListEntity> queryList(Map<String, Object> map) {
		return customerReturnListEntityMapper.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return customerReturnListEntityMapper.queryTotal(map);
	}

	@Override
	public void save(CustomerReturnListEntity entity) {
		customerReturnListEntityMapper.save(entity);
		
	}

	@Override
	public int update(CustomerReturnListEntity entity) {
		return customerReturnListEntityMapper.update(entity);
	}

	@Override
	public void delete(CustomerReturnListEntity entity) {
		customerReturnListEntityMapper.delete(entity.getId());
		
	}

	@Override
	public void delete(Long[] ids) {
		customerReturnListEntityMapper.deleteBatch(ids);
	}

	@Override
	public void updateList(int[] ids) {
			
		for(int id : ids) {
			
			CustomerReturnListEntity entity = customerReturnListEntityMapper.queryObject(id);
			
			if(entity!=null) {
				entity.setDelflag(String.valueOf(1));
				customerReturnListEntityMapper.update(entity);
			}
		}
	}

	@Override
	public List<CustomerReturnListEntity> findAll() {
		return customerReturnListEntityMapper.findAll();
	}

	@Override
	public int add(CustomerReturnListEntity customerReturnListEntity) {
		return customerReturnListEntityMapper.insert(customerReturnListEntity);
	}

	@Override
	public CustomerReturnListEntity getOne(String id) {
		return customerReturnListEntityMapper.getOne(Integer.parseInt(id));
	}

	@Override
	public List<CustomerReturnListEntity> search(String customerreturnnumber) {
		return customerReturnListEntityMapper.search(customerreturnnumber);
	}

	@Override
	public void deleteBatch(Long[] ids) {
		customerReturnListEntityMapper.deleteBatch(ids);
		
	}

	
	
}
