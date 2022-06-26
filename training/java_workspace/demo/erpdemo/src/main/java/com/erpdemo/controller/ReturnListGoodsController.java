package com.erpdemo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.ReturnListGoodsEntity;
import com.erpdemo.service.ReturnListGoodsService;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;
import com.erpdemo.utils.annotation.SysLog;
import com.erpdemo.utils.validator.ValidatorUtils;
import com.erpdemo.utils.validator.group.UpdateGroup;

/**
 * 退货商品详单
 * 
 */
@RestController
@RequestMapping("/sys/returnlistgoods")
public class ReturnListGoodsController extends AbstractController{

	//退货商品详细信息Service
	@Autowired
	private ReturnListGoodsService returnListGoodsService;
	
	/**
	* 所有退货商品列表
	*/
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);
		List<ReturnListGoodsEntity> userList = returnListGoodsService.queryList(query);
		int total = returnListGoodsService.queryTotal(query);
		PageUtils pageUtil = new PageUtils(userList, total, query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}
		
	/**
	* 单一显示退货单详细信息
	*/
	@RequestMapping("/selectOne")
	public R selectOne(Integer id) {
			
		ReturnListGoodsEntity returnlistgoods = returnListGoodsService.queryObject(id);
		return R.ok().put("returnlistgoods", returnlistgoods);
	}

	/**
	* 保存退货单详细信息
	*/
	@SysLog("保存")
	@RequestMapping("/save")
	public R save(@RequestBody ReturnListGoodsEntity entity,
			HttpServletRequest req) {
			
		returnListGoodsService.save(entity);
		return R.ok();
	}

	/**
	* 修改退货信息
	*/
	@RequestMapping("/update")
	public R update(@RequestBody ReturnListGoodsEntity entity) {
//		ValidatorUtils.validateEntity(entity, UpdateGroup.class);
//		// 通过主键到数据库中 获取该条记录 对象
//		int id = entity.getId();
//		ReturnListGoodsEntity entity_db = returnListGoodsService.queryObject(id);

		returnListGoodsService.update(entity);
		return R.ok();
	}
	
	/**
	* 删除退货信息--逻辑删除
	*/
	@RequestMapping("/delete")
	public R delete(@RequestBody int[] ids) {
	// 删除的有可能是多个,操作放在业务层执行
		returnListGoodsService.updateList(ids);
		return R.ok();
	}
		
}
