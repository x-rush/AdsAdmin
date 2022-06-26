package com.erpdemo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.ProductEntity;
import com.erpdemo.service.ProductService;
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
@RequestMapping("/sys/product")
public class SysProductController extends AbstractController {
	
	@Autowired
	private ProductService productService;
	
	/**
	 * 所有用户列表
	 */
	@RequestMapping("/list")
//	@RequiresPermissions("sys:news:list")
	public R list(@RequestParam Map<String, Object> params) {
		// 只有超级管理员，才能查看所有管理员列表
		if (getUserid() != Constant.SUPER_ADMIN) {
			params.put("createUserId", getUserid());
		}

		// 查询列表数据
		Query query = new Query(params);
		List<ProductEntity> userList = productService.queryList(query);
		int total = productService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(userList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}



	/**
	 * 保存用户
	 */
	@SysLog("保存")
	@RequestMapping("/save")
//	@RequiresPermissions("sys:news:save")
	public R save(@RequestParam Map<String,String> param, HttpServletRequest req) {

		ProductEntity entity = new ProductEntity();
		
		productService.save(entity);

		return R.ok();
	}

	/**
	 * 修改用户
	 */
	@SysLog("修改用户")
	@RequestMapping("/update")
//	@RequiresPermissions("sys:news:update")
	public R update(@RequestBody ProductEntity entity) {
		ValidatorUtils.validateEntity(entity, UpdateGroup.class);

		// id 密码 性别 QQ

		// 通过主键到数据库中 获取该条记录 对象
		
		int id = entity.getId();
		
		ProductEntity entity_db = productService.queryObject(id);
		
		// 将页面的新的信息封装到 对象中(entity)

		// 将新的数据 通过 set方法 设置到 旧的对象中

		
		

		// 调用 update方法更新数据 (对象是旧的)
		productService.update(entity_db);
	
		return R.ok();
	}

	
	
	
	/**
	 * 删除用户 逻辑删除
	 */
	@SysLog("删除用户")
	@RequestMapping("/delete")
//	@RequiresPermissions("sys:news:delete")
	public R delete(@RequestBody int[] ids) {
	
		// 更新的有可能是多个
		
		productService.updateList(ids);
		
//		for(int id : ids) {
//			
//			ProductEntity entity = productService.queryObject(id);
//		
//			if(entity!=null) {
//				entity.setDelflag(1);
//				c.update(entity);
//			}
//			
//		}
		
		

		return R.ok();
	}
}
