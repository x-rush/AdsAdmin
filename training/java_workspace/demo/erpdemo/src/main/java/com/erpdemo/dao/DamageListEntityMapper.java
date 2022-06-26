package com.erpdemo.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.erpdemo.entity.DamageListEntity;


public interface DamageListEntityMapper extends BaseDao<DamageListEntity>{
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_damage_list
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_damage_list
     *
     * @mbggenerated
     */
    int insert(DamageListEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_damage_list
     *
     * @mbggenerated
     */
    int insertSelective(DamageListEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_damage_list
     *
     * @mbggenerated
     */
    DamageListEntity selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_damage_list
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(DamageListEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_damage_list
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(DamageListEntity record);
    
    
  List<DamageListEntity> findAll();
  
    
 //List<Product> findForSearch(String name);

 List<DamageListEntity> findForSearch(
  		@Param("param") Map<String,String> param,
  		@Param("index") int index,
  		@Param("count") int count);

   
 int findForCount();
   
  
}