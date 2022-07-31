package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.CustomerReturnListEntityMapper;
import com.erpdemo.dao.CustomerReturnListGoodsEntityMapper;
import com.erpdemo.entity.CustomerReturnListEntity;
import com.erpdemo.entity.CustomerReturnListGoodsEntity;
import com.erpdemo.service.CustomerReturnListGoodsService;

@Service("customerReturnListGoodsService")
public class CustomerReturnListGoodsServiceImpl implements CustomerReturnListGoodsService {
	
	@Autowired
	private CustomerReturnListGoodsEntityMapper customerReturnListGoodsEntityMapper;
	
	
	@Override
	public CustomerReturnListGoodsEntity queryObject(int id) {
		return customerReturnListGoodsEntityMapper.queryObject(id);
	}

	@Override
	public List<CustomerReturnListGoodsEntity> queryList(Map<String, Object> map) {
		return customerReturnListGoodsEntityMapper.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return customerReturnListGoodsEntityMapper.queryTotal(map);
	}

	@Override
	public void save(CustomerReturnListGoodsEntity entity) {
		customerReturnListGoodsEntityMapper.save(entity);
	}

	/*
	 * @Override public void update(CustomerReturnListGoodsEntity entity) {
	 * customerReturnListGoodsEntityMapper.update(entity); }
	 */

	@Override
	public void delete(CustomerReturnListGoodsEntity entity) {
		customerReturnListGoodsEntityMapper.delete(entity.getId());
	}

	@Override
	public void delete(Long[] ids) {
		customerReturnListGoodsEntityMapper.delete(ids);
	}

	@Override
	public void updateList(int[] ids) {
		
		for(int id : ids) {
			CustomerReturnListGoodsEntity entity = customerReturnListGoodsEntityMapper.queryObject(id);
			
			if(entity!=null) {
				entity.setDelflag(String.valueOf(1));
				customerReturnListGoodsEntityMapper.update(entity);
			}
		}
		
	}

	@Override
	public List<CustomerReturnListGoodsEntity> findAll() {
		return customerReturnListGoodsEntityMapper.findAll();
	}

	@Override
	public int add(CustomerReturnListGoodsEntity customerReturnListGoodsEntity) {
		return customerReturnListGoodsEntityMapper.insert(customerReturnListGoodsEntity);
	}

	@Override
	public CustomerReturnListGoodsEntity getOne(String id) {
		return customerReturnListGoodsEntityMapper.getOne(Integer.parseInt(id));
	}

	@Override
	public int update(CustomerReturnListGoodsEntity customerReturnListGoodsEntity) {
		return customerReturnListGoodsEntityMapper.update(customerReturnListGoodsEntity);
	}

	@Override
	public List<CustomerReturnListGoodsEntity> search(String aaa) {
		return customerReturnListGoodsEntityMapper.search(aaa);
	}
	
	@Override
	public void deleteBatch(Long[] ids) {
		customerReturnListGoodsEntityMapper.deleteBatch(ids);
		
	}
	
	
	
}





