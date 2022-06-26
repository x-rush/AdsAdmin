package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.GoodsMapper;
import com.erpdemo.entity.Goods;
import com.erpdemo.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public List<Goods> queryAll() {
		return goodsMapper.queryAll();
	}

	@Override
	public void deleteBatch(Long[] ids) {
		goodsMapper.deleteBatch(ids);
	}

	@Override
	public int add(Goods goods) {

		return goodsMapper.insert(goods);
	}

	@Override
	public int update(Goods goods) {
		return goodsMapper.updateByPrimaryKey(goods);
	}

	@Override
	public Goods queryById(int id) {
		return goodsMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Goods> queryList(Map<String, Object> map) {
		return goodsMapper.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return goodsMapper.queryTotal(map);
	}

	@Override
	public List<Goods> findForSearch(String name,int index,int count) {
		return goodsMapper.findForSearch(name,index,count);
	}

	

}
