package com.erpdemo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.config.WebMvcConfig;
import com.erpdemo.entity.CustomerReturnListEntity;
import com.erpdemo.entity.CustomerReturnListGoodsEntity;
import com.erpdemo.service.CustomerReturnListGoodsService;
import com.erpdemo.service.CustomerReturnListService;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;
import com.erpdemo.utils.annotation.SysLog;

/* 商品退货单
*/

@RestController
@RequestMapping("/sys/CustomerReturnListGoods")
public class CustomerReturnListGoodsController extends AbstractController {

	@Autowired
	private CustomerReturnListService customerReturnListService;

	@Autowired
	private CustomerReturnListGoodsService customerReturnListGoodsService;

	@Autowired
	private WebMvcConfig webMvcConfig;

	/*
	 * 所有商品退货单列表
	 */
	@RequestMapping("/list")
	public Object list() {
		List<CustomerReturnListGoodsEntity> list_product = customerReturnListGoodsService.findAll();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list_product", list_product);

		return map;

	}

//	@SysLog("保存退货单")
	@RequestMapping("/save")
	public Map<String, Object> save(@RequestBody CustomerReturnListGoodsEntity param) {

		String code	= param.getCode();
		Integer goodsid = param.getGoodsid();
		String model = param.getModel();
		String name = param.getName();
		Integer num = param.getNum();
		Float price = param.getPrice();
		Float total = param.getTotal();
		String unit = param.getUnit();
		Integer customerreturnlistid = param.getCustomerreturnlistid();
		Integer typeid = param.getTypeid();
		Integer userid = param.getUserid();
		String delflag = param.getDelflag();

		CustomerReturnListGoodsEntity a = new CustomerReturnListGoodsEntity();
		
		a.setCode(code);
		a.setGoodsid(goodsid);
		a.setModel(model);
		a.setName(name);
		a.setNum(num);
		a.setPrice(price);
		a.setTotal(total);
		a.setUnit(unit);
		a.setCustomerreturnlistid(customerreturnlistid);
		a.setTypeid(typeid);
		a.setUserid(userid);
		a.setDelflag(delflag);

		System.out.println(param);

		int count = customerReturnListGoodsService.add(a);

		Map<String, Object> map = new HashMap<>();
		map.put("code", 0);
		return map;
	}

	@RequestMapping("/getOne")
	public Map<String, Object> getOne(String id) {
		
		
		System.out.println(id);
		
		CustomerReturnListGoodsEntity a = customerReturnListGoodsService.getOne(id);

		Map<String, Object> map = new HashMap<>();

		map.put("code", 0);

		map.put("list_product", a);

		return map;

	}

	@RequestMapping("/update")
	public Map<String,Object> doupdate(@RequestBody CustomerReturnListGoodsEntity param){
		
		
		
		
		int a = customerReturnListGoodsService.update(param);

		
		System.out.println(param);

//		int count = customerReturnListService.add(a);

		Map<String, Object> map = new HashMap<>();
		map.put("code", 0);
		return map;
	}
	
	
	
	@RequestMapping("/search")
	public Map<String, Object> search(String name) {
		
		System.out.println(name);
		
		List<CustomerReturnListGoodsEntity> list=customerReturnListGoodsService.search(name);
		
		
//		for (CustomerReturnListEntity zz : list) { System.out.println(zz); }
		 
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("list_product", list);
		
		System.out.println(map);
		
		return map;
	}	
	
	
	
	@RequestMapping("/delete")
	public R del(@RequestBody Long[] ids) {
		
		
		System.out.println(ids);
		
		customerReturnListGoodsService.deleteBatch(ids);
		
		return R.ok();
		
		
	}
	
	
	
	
	
	
	
	
	
	

}





