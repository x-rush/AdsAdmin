package com.erpdemo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.OverFlowListEntity;
import com.erpdemo.entity.OverFlowListGoodsEntity;
import com.erpdemo.service.OverFlowListGoodsService;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;

@RestController
@RequestMapping("/sys/overflowlistgoods")
public class OverFlowListGoodsController {
	@Autowired
	private OverFlowListGoodsService overFlowListGoodsService;
	
	//查询列表
	@RequestMapping("/list")
	public R list(@RequestParam Map<String,Object> param) {
		
		Query query = new Query(param);
		
		List<OverFlowListGoodsEntity> list_OverFlowListGoods = overFlowListGoodsService.queryList(query);
		
		int total = overFlowListGoodsService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(list_OverFlowListGoods, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
		
	}
	
	//逻辑删除
	@RequestMapping("/delete")
	public boolean delete(@RequestBody Long []id) {
			
		boolean boo = overFlowListGoodsService.updateList(id);
		if(boo) {
			return true;
		}else {
			return false;
		}
			
	}
		
	//添加
	@RequestMapping("/save")
	public R save(@RequestParam Map<String,String> param) {
		String code = param.get("code");
		String goodsid = param.get("goodsid");
		String model = param.get("model");
		String name = param.get("name");
		String num = param.get("num");
		String price = param.get("price");
		String total = param.get("total");
		String unit = param.get("unit");
		String overflowlistid = param.get("overflowlistid");
		String typeid = param.get("typeid");
		String userid = param.get("userid");
		
		OverFlowListGoodsEntity entity = new OverFlowListGoodsEntity();
		
		entity.setCode(code);
		entity.setGoodsid(Integer.parseInt(goodsid));
		entity.setModel(model);
		entity.setName(name);
		entity.setNum(Integer.parseInt(num));
		entity.setPrice(Float.parseFloat(price));
		entity.setTotal(Float.parseFloat(total));
		entity.setUnit(unit);
		entity.setOverflowlistid(Integer.parseInt(overflowlistid));
		entity.setTypeid(Integer.parseInt(typeid));
		entity.setUserid(Integer.parseInt(userid));
		
		int count = overFlowListGoodsService.save(entity);
		
		return R.ok();
	}
	
	//查询列表
	@RequestMapping("/update")
	public R update(@RequestParam Map<String,String> param) {
		String id = param.get("id");
		
		OverFlowListGoodsEntity entity =  overFlowListGoodsService.queryObject(Integer.parseInt(id));
			
		return R.ok().put("entity", entity);
			
	}
	
	//修改
	@RequestMapping("/doupdate")
	public R doupdate(@RequestParam Map<String,String> param) {
		
//		String id = param.get("id");
		String code = param.get("code");
		String goodsid = param.get("goodsid");
		String model = param.get("model");
		String name = param.get("name");
		String num = param.get("num");
		String price = param.get("price");
		String total = param.get("total");
		String unit = param.get("unit");
		String overflowlistid = param.get("overflowlistid");
		String typeid = param.get("typeid");
		String userid = param.get("userid");
			
		OverFlowListGoodsEntity entity = new OverFlowListGoodsEntity();
			
//		entity.setId(Integer.parseInt(id));
		entity.setCode(code);
		entity.setGoodsid(Integer.parseInt(goodsid));
		entity.setModel(model);
		entity.setName(name);
		entity.setNum(Integer.parseInt(num));
		entity.setPrice(Float.parseFloat(price));
		entity.setTotal(Float.parseFloat(total));
		entity.setUnit(unit);
		entity.setOverflowlistid(Integer.parseInt(overflowlistid));
		entity.setTypeid(Integer.parseInt(typeid));
		entity.setUserid(Integer.parseInt(userid));
			
		int count = overFlowListGoodsService.save(entity);
			
		return R.ok();
		}
	
	
	
	
	
	
	
	
	
	
	
	
}
