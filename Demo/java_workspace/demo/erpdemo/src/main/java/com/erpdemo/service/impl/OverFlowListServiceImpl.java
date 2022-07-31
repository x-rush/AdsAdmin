package com.erpdemo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erpdemo.dao.OverFlowListEntityMapper;
import com.erpdemo.entity.OverFlowListEntity;
import com.erpdemo.service.OverFlowListService;

@Service("overFlowListService")
public class OverFlowListServiceImpl implements OverFlowListService {

	@Autowired
	private OverFlowListEntityMapper overFlowListMapper;
	/**
	 * 根据ID，查询
	 * @param id
	 * @return
	 */
	@Override
	public OverFlowListEntity queryObject(int id) {
		
		return overFlowListMapper.selectByPrimaryKey(id);
	}

	/**
	 * 查询列表
	 */
	@Override
	public List<OverFlowListEntity> queryList(Map<String, Object> map) {
		
		return overFlowListMapper.queryList(map);
	}

	/**
	 * 查询总数
	 */
	@Override
	public int queryTotal(Map<String, Object> map) {
		return overFlowListMapper.queryTotal(map);
	}

	/**
	 * 保存
	 */
	@Override
	public void save(OverFlowListEntity entity) {
		// TODO Auto-generated method stub

	}

	/**
	 * 修改
	 */
	@Override
	public int update(OverFlowListEntity entity) {
		return overFlowListMapper.updateByPrimaryKey(entity);

	}


	/**
	 * 删除
	 * @param entity
	 */
	@Override
	public boolean delete(Long[] ids) {

		if(ids.length > 0) {
			overFlowListMapper.delete(ids);	
			return true;
		}
		return false;

	}

	/**
	 * 批量逻辑删除
	 * @param entity
	 */
	@Override
	public boolean updateList(Long [] ids) {
				
			if(ids.length > 0) {
				overFlowListMapper.updateList(ids);	
				return true;
			}
			return false;
	}

	//删除（id）
	@Override
	public void delete(Integer id) {
		overFlowListMapper.deleteByPrimaryKey(id);
		
	}

	//添加
	@Override
	public int add(OverFlowListEntity entity) {
		
		return overFlowListMapper.insert(entity);
	}


}
