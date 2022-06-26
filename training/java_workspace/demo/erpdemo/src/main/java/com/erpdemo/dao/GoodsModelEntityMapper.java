package com.erpdemo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.erpdemo.entity.GoodsModelEntity;

public interface GoodsModelEntityMapper {
    
    int insert(GoodsModelEntity record);

    boolean deleteByPrimaryKey(Long[] id);
    
    int update(GoodsModelEntity record);
    
    GoodsModelEntity selectByPrimaryKey(Integer id);
    
    List<GoodsModelEntity> queryList(Map<String, Object> map);
	
    int queryTotal(Map<String, Object> map);
	
    void save(GoodsModelEntity record);

    GoodsModelEntity queryObject(int id);
	 
    List<GoodsModelEntity> findForSearch(
    		@Param("param") Map<String,String> param,
    		@Param("index") int index,
    		@Param("count") int count);
    
    int findForCount();
    
}