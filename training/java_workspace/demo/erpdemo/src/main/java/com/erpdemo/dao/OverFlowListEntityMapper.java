package com.erpdemo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erpdemo.entity.OverFlowListEntity;

/**
 * 商品报溢单
 * 
 */
public interface OverFlowListEntityMapper extends BaseDao<OverFlowListEntity>{
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_overflow_list
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_overflow_list
     *
     * @mbggenerated
     */
    int insert(OverFlowListEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_overflow_list
     *
     * @mbggenerated
     */
    int insertSelective(OverFlowListEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_overflow_list
     *
     * @mbggenerated
     */
    OverFlowListEntity selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_overflow_list
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(OverFlowListEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_overflow_list
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(OverFlowListEntity record);
	
	//物理删除
	void delete(Object[] ids);
	
	//逻辑删除
	void updateList(Long [] ids);
}