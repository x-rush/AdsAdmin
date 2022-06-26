package com.erpdemo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.erpdemo.entity.ReturnListGoodsEntity;

public interface ReturnListGoodsEntityMapper extends BaseDao<ReturnListGoodsEntity>{
    
	List<ReturnListGoodsEntity> queryGoods(Map<String, Object> map);
	List<ReturnListGoodsEntity> querySearch(@Param("id") String id);
	
}