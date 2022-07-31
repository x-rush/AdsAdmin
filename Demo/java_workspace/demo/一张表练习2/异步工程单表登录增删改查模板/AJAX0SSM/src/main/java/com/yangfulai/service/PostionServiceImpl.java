package com.yangfulai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yangfulai.dao.PositionDAO;
import com.yangfulai.pojo.Position;
/**
 * 
 * TODO<职位业务层接口实现类>
 * @author  杨福来
 * @date  2019年8月23日 下午2:36:13
 * @version  V1.0
 */
@Service
public class PostionServiceImpl implements PositionService {

	@Autowired
	private PositionDAO dao;
	@Override
	public boolean add(Position position) {
		if(dao.insert(position) == 1) {
			return true;
		}
		return false;
	}
	@Override
	public boolean edit(Position position) {
		if(dao.update(position) == 1) {
			return true;
		}
		return false;
	}
	@Override
	public boolean remove(int positionId) {
		if(dao.delete(positionId) == 1) {
			return true;
		}
		return false;
	}
	@Override
	public Position selectOne(int positionId) {
		return dao.selectOne(positionId);
	}
	@Override
	public int getCount(String positionName) {
		return dao.getCount(positionName);
	}
	@Override
	public List<Position> selectAll(String positionName, int page, int rows) {
		return dao.selectAll(positionName, (page-1)*rows, rows);
	}

	
			//求页数的方法
			@Override	//rows每页的个数
			public int findPageCount(String name, int rows) {
				int p = dao.getCount(name);
				if(p%rows ==0) {
					return p/rows;
				}else{
					
					return p/rows+1;
				}

			}

}
