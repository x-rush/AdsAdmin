package com.yangfulai.service;

import java.util.List;

import com.yangfulai.pojo.Position;
/**
 * 
 * TODO<职位表的业务层接口>
 * @author  杨福来
 * @date  2019年8月23日 下午2:06:47
 * @version  V1.0
 */
public interface PositionService {

			/**
			 * 
			 * TODO<职位表的添加方法>
			 * @param Position
			 * @return
			 */
			boolean add(Position Position);
			/**
			 * 
			 * TODO<职位表的修改方法>
			 * @param Position
			 * @return
			 */
			boolean edit(Position Position);
			/**
			 * 
			 * TODO<职位表的删除方法>
			 * @param positionId
			 * @return
			 */
			boolean remove(int positionId);
			/**
			 * 
			 * TODO<根据主键查询一条数据（一个对象）>
			 * @param positionId职位ID
			 * @return
			 */
			Position selectOne(int positionId);
			/**
			 * 
			 * TODO<统计记录个数的方法（搜索条件：按照名字模糊查询、）>
			 * @param positionName职位名称
			 * @return
			 */
			int getCount(String positionName);
			/**
			 * 
			 * TODO<分页集合（名字搜索）>
			 * @param positionName职位名称
			 * @param page页码
			 * @param rows每页的记录数
			 * @return
			 */
			List<Position>  selectAll(String positionName,int page,int rows);
			/**
			 * 
			 * TODO<求页数的方法>
			 * @param name总记录数
			 * @param page每页的个数	每页的记录数
			 * @return
			 */
			int findPageCount(String name,int page);
	
	
}
