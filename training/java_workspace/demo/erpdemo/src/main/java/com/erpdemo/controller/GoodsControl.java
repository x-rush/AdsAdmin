package com.erpdemo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erpdemo.entity.Goods;
import com.erpdemo.entity.SysUserEntity;
import com.erpdemo.service.impl.GoodsServiceImpl;
import com.erpdemo.utils.Constant;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;
import com.erpdemo.utils.annotation.SysLog;
import com.erpdemo.utils.validator.ValidatorUtils;
import com.erpdemo.utils.validator.group.AddGroup;
import com.erpdemo.utils.validator.group.UpdateGroup;

@Controller
@RequestMapping("/goods")
public class GoodsControl extends AbstractController {
	@Autowired
	private GoodsServiceImpl goodsService;

	@RequestMapping("/show")
	@ResponseBody
	public Object show() {
		List<Goods> list_goods = goodsService.queryAll();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list_goods", list_goods);
		return map;
	}

	@RequestMapping("/del")
	@ResponseBody
	public R delete(@RequestBody Long[] ids) {

		goodsService.deleteBatch(ids);

		return R.ok();
	}

	@RequestMapping("/save")
	@ResponseBody
	public Map<String, Object> save(@RequestParam Map<String, String> param) {
		String typeid = param.get("typeid");
		String code = param.get("code");
		String name = param.get("name");
		String model = param.get("model");
		String unit = param.get("unit");
		String lastpurchasingprice = param.get("lastpurchasingprice");
		String sellingprice = param.get("sellingprice");
		String minnum = param.get("minnum");
		String producter = param.get("producter");

//		String typeid = "12";
//		String code = "123456";
//		String name = "asdaa";
//		String model = "a";
//		String unit = "瓶";
//		String lastpurchasingprice = "100";
//		String sellingprice ="900";
//		String minnum = "13";
//		String producter = "3";

		Goods goods = new Goods();

		goods.setTypeid(Integer.parseInt(typeid));
		goods.setCode(code);
		goods.setName(name);
		goods.setModel(model);
		goods.setUnit(unit);
		goods.setLastpurchasingprice(Float.parseFloat(lastpurchasingprice));
		goods.setSellingprice(Float.parseFloat(sellingprice));
		goods.setMinnum(Integer.parseInt(minnum));
		goods.setProducer(producter);
		int count = goodsService.add(goods);
//		System.out.println(count);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("code", 0);

		return map;
	}

	@RequestMapping("/update")
	@ResponseBody
	public Map<String, Object> update(@RequestBody Map<String,String>param) {

		String id = param.get("id");
		String typeid = param.get("typeid");
		String code = param.get("code");
		String name = param.get("name");
		String model = param.get("model");
		String unit = param.get("unit");
		String lastpurchasingprice = param.get("lastpurchasingprice");
		String sellingprice = param.get("sellingprice");
		String minnum = param.get("minnum");
		String producter = param.get("producter");

		Goods goods = goodsService.queryById(Integer.parseInt(id));

		goods.setTypeid(Integer.parseInt(typeid));
		goods.setCode(code);
		goods.setName(name);
		goods.setModel(model);
		goods.setUnit(unit);
		goods.setLastpurchasingprice(Float.parseFloat(lastpurchasingprice));
		goods.setSellingprice(Float.parseFloat(sellingprice));
		goods.setMinnum(Integer.parseInt(minnum));
		goods.setProducer(producter);
		goodsService.update(goods);
//		System.out.println(goods);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("code", 0);

		return map;
	}

	@RequestMapping("/getOne")
	@ResponseBody
	public Map<String, Object> getOne(String id) {
		Goods goods = goodsService.queryById(Integer.parseInt(id));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("goods", goods);
		return map;
	}

	@RequestMapping("/search")
	@ResponseBody
	public Map<String, Object> search(@RequestParam Map<String, String> param) {
		String name = param.get("name");
		List<Goods> list_goods = goodsService.findForSearch(name,0,5);
		Map<String, Object> map = new HashMap<String, Object>();
		/*
		 * for (Goods goods : list_goods) { System.out.println(goods); }
		 */
		map.put("list_goods", list_goods);
		return map;
	}
	
	@RequestMapping("/page")
	@ResponseBody
	public Map<String, Object> page(@RequestParam Map<String, String> param) {
		String name = param.get("name");
		String pagenum = param.get("pagenum");
		int count = 5;
		int index = (Integer.parseInt(pagenum)-1)*5;
		List<Goods> list_goods = goodsService.findForSearch(name,index,count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list_goods", list_goods);
		return map;
	}


}
