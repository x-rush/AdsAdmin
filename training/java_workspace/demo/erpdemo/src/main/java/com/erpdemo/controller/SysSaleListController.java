package com.erpdemo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.SysSaleList;
import com.erpdemo.service.SysSaleListService;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;
import com.erpdemo.utils.validator.ValidatorUtils;
import com.erpdemo.utils.validator.group.UpdateGroup;

@RestController
@RequestMapping("/sys/salelist")
public class SysSaleListController {

	@Autowired
	private SysSaleListService sysSaleListService;
	
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params) {

		// 查询列表数据
		Query query = new Query(params);
		List<SysSaleList> salelist = sysSaleListService.queryList(query);
		int total = sysSaleListService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(salelist, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}
	
	@RequestMapping("/save")
	public R save(@RequestBody SysSaleList entity) {

		sysSaleListService.save(entity);

		return R.ok();
	}
	
	@RequestMapping("/selectOne")
	public R selectOne(String id) {		
		//System.out.println(id);
		SysSaleList sysSaleList = sysSaleListService.queryObject(Integer.parseInt(id));
		//System.out.println(sysSaleList);
		return R.ok().put("salelist", sysSaleList);
	}
	
	@RequestMapping("/update")
	public R update(@RequestBody SysSaleList entity) {
		ValidatorUtils.validateEntity(entity, UpdateGroup.class);
		// 通过主键到数据库中 获取该条记录 对象
		//日期转换成字符串
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Integer id = entity.getId();
		Float amountpaid = entity.getAmountpaid();
		Float amountpayable = entity.getAmountpayable();
		//String saledate = sdf.format(entity.getSaledate());
		String salenum = entity.getSalenum();
		Integer state = entity.getState();
		Integer customerid = entity.getCustomerid();
		Integer userid = entity.getUserid();
		Date addtime = entity.getAddtime();
		String remarks = entity.getRemarks(); 
		
		SysSaleList entity_db = sysSaleListService.queryObject(id);
		
		// 将页面的新的信息封装到 对象中(entity)
		// 将新的数据 通过 set方法 设置到 旧的对象中
		entity_db.setAmountpaid(amountpaid);
		entity_db.setAmountpayable(amountpayable);
		//entity_db.setSaledate(sdf.parse(saledate));
		entity_db.setSalenum(salenum);
		entity_db.setState(state);
		entity_db.setCustomerid(customerid);
		entity_db.setUserid(userid);
		entity_db.setAddtime(addtime);
		entity_db.setRemarks(remarks);

		// 调用 update方法更新数据 (对象是旧的)
		sysSaleListService.update(entity_db);
	
		return R.ok();
	}
	
	@RequestMapping("/delete")
	public R delete(@RequestBody int[] ids) {
	
		// 更新的有可能是多个
		
		sysSaleListService.updateList(ids);


		return R.ok();
	}
}
