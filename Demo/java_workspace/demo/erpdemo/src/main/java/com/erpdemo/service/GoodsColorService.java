
package com.erpdemo.service;

import java.util.List;
import java.util.Map;
import com.erpdemo.entity.GoodsColorEntity;


public interface GoodsColorService {
	
	
	    int insert(GoodsColorEntity record);
	    
	    boolean deleteByPrimaryKey(Long[] id);
	    
	    int update(GoodsColorEntity record);
	    
	    GoodsColorEntity selectByPrimaryKey(Integer id);
	    List<GoodsColorEntity> findAll();
	    
		List<GoodsColorEntity> queryList(Map<String, Object> map);
		
		int queryTotal(Map<String, Object> map);
		
	
		void save(GoodsColorEntity record);
		
	
		
		 GoodsColorEntity queryObject(int id);
	
		 List<GoodsColorEntity> findForSearch( Map<String,String> param,
					int index, int count) ;


		 int findForCount();

		
		
		
		
		
	}


		
		
	
		

		

		
		
		
	
