package com.erpdemo.service.impl;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.erpdemo.dao.GoodsColorEntityMapper;
import com.erpdemo.entity.GoodsColorEntity;
import com.erpdemo.service.GoodsColorService;
@Service
public class GoodsColorServiceImpl implements GoodsColorService {
 @Autowired
	private GoodsColorEntityMapper goodsColorMapper;

@Override
public List<GoodsColorEntity> queryList(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return goodsColorMapper.queryList(map);
}

@Override
public int queryTotal(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return goodsColorMapper.queryTotal(map);
}

@Override
public void save(GoodsColorEntity record) {
	// TODO Auto-generated method stub
	goodsColorMapper.save(record);
}

@Override
public int update(GoodsColorEntity record) {
	// TODO Auto-generated method stub
	
	return goodsColorMapper.update(record);
}


@Override
public List<GoodsColorEntity> findAll() {
	// TODO Auto-generated method stub
	return goodsColorMapper.findAll();
}


@Override
public int insert(GoodsColorEntity record) {
	// TODO Auto-generated method stub
	return goodsColorMapper.insert(record);
}

@Override
public boolean deleteByPrimaryKey(Long[] id) {
	// TODO Auto-generated method stub
	if(id.length>0) {
		goodsColorMapper.deleteByPrimaryKey(id);
		return true;
	}else {
		return false;
	}
}

@Override
public void getOne(int id) {
	// TODO Auto-generated method stub
	
}

@Override
public GoodsColorEntity selectByPrimaryKey(Integer id) {
	// TODO Auto-generated method stub
	return goodsColorMapper.selectByPrimaryKey(id);
}
	
	
 
 
 
 
 
 

}
