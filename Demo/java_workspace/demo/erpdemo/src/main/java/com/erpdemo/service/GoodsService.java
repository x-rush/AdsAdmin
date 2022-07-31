package com.erpdemo.service;

import java.util.List;
import java.util.Map;

import org.apache.xmlbeans.impl.jam.mutable.MPackage;

import com.erpdemo.entity.Goods;

public interface GoodsService {
	List<Goods> queryAll();
	
	void deleteBatch(Long[] ids);
	
	int add(Goods goods);
	
	int update(Goods goods);
	
	Goods queryById(int id);
	
	List<Goods> queryList(Map<String, Object> map);
	
	//查询总数
	int queryTotal(Map<String, Object> map);
	
	List<Goods> findForSearch(String name,int index,int count);
}
