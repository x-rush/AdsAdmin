package com.yangfulai.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yangfulai.pojo.Position;
/**
 * 
 * TODO<职位表的数据层接口>
 * @author  杨福来
 * @date  2019年8月23日 下午2:04:54
 * @version  V1.0
 */
public interface PositionDAO {

		/**
		 * 
		 * TODO<职位表添加>
		 * @param position
		 * @return
		 */
		int insert(Position position);
		/**
		 * 
		 * TODO<职位表修改>
		 * @param position
		 * @return
		 */
		int update(Position position);
		/**
		 * 
		 * TODO<职位表删除>
		 * @param positionId职位ID
		 * @return
		 */
		int delete(int positionId);
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
		int getCount(@Param("positionName")String positionName);
		/**
		 * 
		 * TODO<分页集合（名字搜索）>
		 * @param positionName职位名称
		 * @param page起始位置
		 * @param rows每页的记录数
		 * @return
		 */
		List<Position>  selectAll(@Param("positionName")String positionName,@Param("page")int page,@Param("rows")int rows);
		/**
		 * 
		 * TODO<求页数的方法>
		 * @param name总记录数
		 * @param page每页个数
		 * @return
		 */
		int getPageCount(String name,int page);
	
	
	
	
	
	
}
