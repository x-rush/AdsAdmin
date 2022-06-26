package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.GoodsModelEntityMapper;
import com.erpdemo.entity.GoodsColorEntity;
import com.erpdemo.entity.GoodsModelEntity;
import com.erpdemo.service.GoodsModelService;
@Service
public class ModelServiceImpl implements GoodsModelService {

	@Autowired
	private GoodsModelEntityMapper modelMapper;

	@Override
	public GoodsModelEntity queryObject(int id) {
		// TODO Auto-generated method stub
		return modelMapper.queryObject(id);
	}

	@Override
	public List<GoodsModelEntity> queryList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return modelMapper.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return modelMapper.queryTotal(map);
	}

	@Override
	public void save(GoodsModelEntity goodsModelEntity) {
		// TODO Auto-generated method stub
		modelMapper.save(goodsModelEntity);
	}

	

//	@Override
//	public void updateList(int[] ids) {
//		// TODO Auto-generated method stub
//		for (int id : ids) {
//			GoodsModelEntity entity = modelMapper.queryObject(id);
//			if (entity!=null) {
//				entity.setDelflag(1);
//				modelMapper.update(entity);
//			}
//		}
//	}

	@Override
	public int insert(GoodsModelEntity record) {
		// TODO Auto-generated method stub
		return modelMapper.insert(record);
	}

	@Override
	public boolean deleteByPrimaryKey(Long[] id) {
		// TODO Auto-generated method stub
		if(id.length>0) {
			modelMapper.deleteByPrimaryKey(id);
			return true;
		}else {
			return false;
		}
	}
	

	@Override
	public GoodsModelEntity selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return modelMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<GoodsModelEntity> findForSearch(Map<String, String> param, int index, int count) {
		// TODO Auto-generated method stub
		return modelMapper.findForSearch(param, index, count);
	}

	@Override
	public int findForCount() {
		// TODO Auto-generated method stub
		return modelMapper.findForCount();
	}

	@Override
	public int update(GoodsModelEntity record) {
		// TODO Auto-generated method stub
		return modelMapper.update(record);
	}

	
	

}
