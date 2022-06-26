package com.erpdemo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.erpdemo.entity.ReturnListEntity;

public interface ReturnListEntityMapper extends BaseDao<ReturnListEntity>{

	List<ReturnListEntity> queryGoods(Map<String, Object> map);

	List<ReturnListEntity> querySearch(@Param("id") String id);
   
	
	
}