package com.erpdemo.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.SysCategoryEntity;
import com.erpdemo.service.SysCategoryService;
import com.erpdemo.utils.Constant;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;
import com.erpdemo.utils.annotation.SysLog;
import com.erpdemo.utils.validator.ValidatorUtils;
import com.erpdemo.utils.validator.group.AddGroup;
import com.erpdemo.utils.validator.group.UpdateGroup;

/**
 * 系统用户
 * 
 */
@RestController
@RequestMapping("/sys/category")
public class SysCategoryController extends AbstractController{
	
	@Autowired
	private SysCategoryService sysCategoryService;
	
	
	/**
	 * 所有用户列表
	 */
	@RequestMapping("/list")
//	@RequiresPermissions("sys:category:list")
	public R list(@RequestParam Map<String, Object> params){
		//只有超级管理员，才能查看所有管理员列表
		if(getUserid() != Constant.SUPER_ADMIN){
//			params.put("createUserId", getUserid());
		}
		
		//查询列表数据
		Query query = new Query(params);
		List<SysCategoryEntity> userList = sysCategoryService.queryList(query);
		int total = sysCategoryService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(userList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 保存用户
	 */
	@SysLog("保存用户")
	@RequestMapping("/save")
	public R save(@RequestBody SysCategoryEntity category){
		
		ValidatorUtils.validateEntity(category, AddGroup.class);
		
		category.setUserid(getUserid());
		
		sysCategoryService.save(category);
		
		return R.ok();
	}
	
	/**
	 * 修改用户
	 */
	@SysLog("修改用户")
	@RequestMapping("/update")
	public R update(@RequestBody SysCategoryEntity user){
		ValidatorUtils.validateEntity(user, UpdateGroup.class);
		
		user.setUserid(getUserid());
		sysCategoryService.update(user);
		
		return R.ok();
	}
	
	/**
	 * 删除用户
	 */
	@SysLog("删除用户")
	@RequestMapping("/delete")
	public R delete(@RequestBody Long[] userIds){
		if(ArrayUtils.contains(userIds, 1L)){
			return R.error("系统管理员不能删除");
		}
		
		if(ArrayUtils.contains(userIds, getUserid())){
			return R.error("当前用户不能删除");
		}
		
		sysCategoryService.deleteBatch(userIds);
		
		return R.ok();
	}
}
