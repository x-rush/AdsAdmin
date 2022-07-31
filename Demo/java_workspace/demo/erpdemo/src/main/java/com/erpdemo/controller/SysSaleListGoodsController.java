package com.erpdemo.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.SysSaleList;
import com.erpdemo.entity.SysSaleListGoods;
import com.erpdemo.service.SysSaleListGoodsService;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;
import com.erpdemo.utils.validator.ValidatorUtils;
import com.erpdemo.utils.validator.group.UpdateGroup;


@RestController
@RequestMapping("/sys/salelistgoods")
public class SysSaleListGoodsController {

	@Autowired
	private SysSaleListGoodsService sysSaleListGoodsService;
	
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params) {

		// 查询列表数据
		Query query = new Query(params);
		List<SysSaleListGoods> sysSaleListGoods = sysSaleListGoodsService.queryList(query);
		int total = sysSaleListGoodsService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(sysSaleListGoods, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}
	
	@RequestMapping("/save")
	public R save(@RequestBody SysSaleListGoods entity) {

		sysSaleListGoodsService.save(entity);

		return R.ok();
	}
	
	@RequestMapping("/selectOne")
	public R selectOne(String id) {		
		//System.out.println(id);
		SysSaleListGoods sysSaleListGoods = sysSaleListGoodsService.queryObject(Integer.parseInt(id));
		//System.out.println(sysSaleList);
		return R.ok().put("salelistgoods", sysSaleListGoods);
	}
	
	@RequestMapping("/update")
	public R update(@RequestBody SysSaleListGoods entity) {
		ValidatorUtils.validateEntity(entity, UpdateGroup.class);
		
		Integer id = entity.getId();
		String code = entity.getCode();
		Integer goodsid = entity.getGoodsid();
		String model = entity.getModel();
		String name = entity.getName();
		Integer num = entity.getNum();
		Float price = entity.getPrice();
		Float total = entity.getTotal();
		String unit = entity.getUnit();
		Integer salelistid = entity.getSalelistid();
		Integer typeid = entity.getTypeid();
		Date addtime = entity.getAddtime();
		
		SysSaleListGoods entity_db = sysSaleListGoodsService.queryObject(id);
		entity_db.setCode(code);
		entity_db.setGoodsid(goodsid);
		entity_db.setModel(model);
		entity_db.setName(name);
		entity_db.setNum(num);
		entity_db.setPrice(price);
		entity_db.setTotal(total);
		entity_db.setUnit(unit);
		entity_db.setSalelistid(salelistid);
		entity_db.setTypeid(typeid);
		entity_db.setAddtime(addtime);
		
		sysSaleListGoodsService.update(entity_db);
		
		return R.ok();
	}
	@RequestMapping("/delete")
	public R delete(@RequestBody int[] ids) {
	
		// 更新的有可能是多个
		sysSaleListGoodsService.updateList(ids);

		return R.ok();
	}
}
