package com.erpdemo.dao;

import java.util.List;
import java.util.Map;

import com.erpdemo.entity.GoodsColorEntity;

public interface GoodsColorEntityMapper {
    
    int insert(GoodsColorEntity record);
    int insertSelective(GoodsColorEntity record);

    boolean deleteByPrimaryKey(Long[] id);
    
    int update(GoodsColorEntity record);
    int updateByPrimaryKeySelective(GoodsColorEntity record);
    
    GoodsColorEntity selectByPrimaryKey(Integer id);
    List<GoodsColorEntity> findAll();

    
    List<GoodsColorEntity> queryList(Map<String, Object> map);
	int queryTotal(Map<String, Object> map);
	void save(GoodsColorEntity record);

    
	

	 
    
    
}