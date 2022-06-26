package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.SysSaleListGoodsMapper;
import com.erpdemo.entity.SysSaleListGoods;
import com.erpdemo.service.SysSaleListGoodsService;

@Service("sysSaleListGoodsService")
public class SysSaleListGoodsServiceImpl implements SysSaleListGoodsService {
	
	@Autowired
	private SysSaleListGoodsMapper sysSaleListGoodsMapper;

	@Override
	public int queryTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sysSaleListGoodsMapper.queryTotal(map);
	}

	@Override
	public List<SysSaleListGoods> queryList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sysSaleListGoodsMapper.queryList(map);
	}

	@Override
	public void save(SysSaleListGoods sysSaleListGoods) {
		// TODO Auto-generated method stub
		sysSaleListGoodsMapper.save(sysSaleListGoods);
	}

	@Override
	public SysSaleListGoods queryObject(int id) {
		// TODO Auto-generated method stub
		return sysSaleListGoodsMapper.queryObject(id);
	}

	@Override
	public void update(SysSaleListGoods sysSaleListGoods) {
		// TODO Auto-generated method stub
		sysSaleListGoodsMapper.update(sysSaleListGoods);
	}

	@Override
	public void updateList(int[] ids) {
		// TODO Auto-generated method stub
		for (int id : ids) {
			SysSaleListGoods entity = sysSaleListGoodsMapper.queryObject(id);
			if (entity!=null) {
				entity.setDelflag(1);
				sysSaleListGoodsMapper.update(entity);
			}
		}
	}

	
	

	

	
	
}
