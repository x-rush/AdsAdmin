package com.erpdemo.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.erpdemo.entity.ReturnListEntity;
import com.erpdemo.entity.ReturnListGoodsEntity;
import com.erpdemo.service.ReturnListGoodsService;
import com.erpdemo.service.ReturnListService;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;
import com.erpdemo.utils.annotation.SysLog;
import com.erpdemo.utils.validator.ValidatorUtils;
import com.erpdemo.utils.validator.group.UpdateGroup;


/**
 * 退货单
 * 
 */
@RestController
@RequestMapping("/sys/returnlist")
public class ReturnListController extends AbstractController{

	//退货单Service
	@Autowired
	private ReturnListService returnListService;
	//退货商品Service
	@Autowired
	private ReturnListGoodsService returnListGoodsService;
	
	/**
	 * 查询
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);
		List<ReturnListEntity> userList = returnListService.queryList(query);
		int total = returnListService.queryTotal(query);
		PageUtils pageUtil = new PageUtils(userList, total, query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}
	
	/**
	 * 查询一条退货单信息
	 */
	@RequestMapping("/selectOne")
//	@RequiresPermissions("sys:user:info")
	public R selectOne(@RequestParam Map<String, Object> params) {
		
	List<ReturnListGoodsEntity> returnlistgoods = returnListGoodsService.queryGoods(params);
	return R.ok().put("returnlistgoods", returnlistgoods);
}

	/**
	 * 保存退货单数据
	 */
	@SysLog("保存")
	@RequestMapping("/save")
//	@RequiresPermissions("sys:news:save")
	public R save(@RequestBody ReturnListEntity entity,
			HttpServletRequest req) {
		
		returnListService.save(entity);
		
		return R.ok();
	}

	/**
	 * 修改退货单信息
	 */
	@RequestMapping("/update")
//	@RequiresPermissions("sys:news:update")
	public R update(@RequestBody ReturnListEntity entity) {
		ValidatorUtils.validateEntity(entity, UpdateGroup.class);
		
		int id = entity.getId();
		ReturnListEntity entity_db = returnListService.queryObject(id);
		returnListService.update(entity_db);
	
		return R.ok();
	}
	
	/**
	 * 删除用户
	 */
	@RequestMapping("/delete")
//	@RequiresPermissions("sys:news:delete")
	public R delete(@RequestBody int[] ids) {
	
		// 删除信息有可能是多个，操作放在业务层执行
		returnListService.updateList(ids);
		return R.ok();
	}
	
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sys:user:info")
	public R info(@PathVariable("id") Integer id){
		
		ReturnListEntity returnList= returnListService.queryObject(id);
		
		return R.ok().put("entity", returnList);
	}
	
}
