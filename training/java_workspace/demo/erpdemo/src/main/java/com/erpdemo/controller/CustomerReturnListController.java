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
import com.erpdemo.service.CustomerReturnListGoodsService;
import com.erpdemo.service.CustomerReturnListService;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;
import com.erpdemo.utils.annotation.SysLog;

/* 商品退货单
*/

@RestController
@RequestMapping("/sys/CustomerReturnList")
public class CustomerReturnListController extends AbstractController {

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
		List<CustomerReturnListEntity> list_product = customerReturnListService.findAll();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list_product", list_product);

		return map;

	}

//	@SysLog("保存退货单")
	@RequestMapping("/save")
//	public Map<String, Object> save(@RequestParam Map<String, String> param) {
	public Map<String, Object> save(@RequestBody CustomerReturnListEntity param) {

		Float amountpaid = param.getAmountpaid();
		Float amountpayable = param.getAmountpayable();
		// String customerreturndate 
		String customerreturnnumber = param.getCustomerreturnnumber();
		String remarks = param.getRemarks();
		Integer state = param.getState();
		Integer customerid = param.getCustomerid();
		Integer userid = param.getUserid();
		// String addtime = param.get("addtime"); // 注册时间
		String delflag = param.getDelflag();

		CustomerReturnListEntity a = new CustomerReturnListEntity();

		a.setAmountpaid(amountpaid);
		a.setAmountpayable(amountpayable);
		a.setCustomerreturnnumber(customerreturnnumber);
		a.setRemarks(remarks);
		a.setState(state);
		a.setCustomerid(customerid);
		a.setUserid(userid);
		a.setDelflag(delflag);

		System.out.println(param);

		int count = customerReturnListService.add(a);

		Map<String, Object> map = new HashMap<>();
		map.put("code", 0);
		return map;
	}

	@RequestMapping("/getOne")
//	public Map<String, Object> getOne(@RequestParam Map<String, String> param) {
//	public Map<String, Object> getOne(@RequestBody String id) {
	public Map<String, Object> getOne(String id) {
//	public Map<String, Object> getOne(@RequestBody CustomerReturnListEntity param) {
		
		
		System.out.println(id);
		
		CustomerReturnListEntity a = customerReturnListService.getOne(id);

		Map<String, Object> map = new HashMap<>();

		map.put("code", 0);

		map.put("list_product", a);

		return map;

	}

	@RequestMapping("/update")
//	public Map<String, Object> save(@RequestParam Map<String, String> param) {
	public Map<String,Object> doupdate(@RequestBody CustomerReturnListEntity param){
		
		
		
		
		int a = customerReturnListService.update(param);

		/*
		 * if (a != null) { a.setAmountpaid(Float.parseFloat(amountpaid));
		 * a.setAmountpayable(Float.parseFloat(amountpayable));
		 * a.setCustomerreturnnumber(customerreturnnumber); a.setRemarks(remarks);
		 * a.setState(Integer.parseInt(state));
		 * a.setCustomerid(Integer.parseInt(customerid));
		 * a.setUserid(Integer.parseInt(userid)); a.setDelflag(delflag);
		 * 
		 * int count = customerReturnListService.update(a); }
		 */

		System.out.println(param);

//		int count = customerReturnListService.add(a);

		Map<String, Object> map = new HashMap<>();
		map.put("code", 0);
		return map;
	}
	
	
	
	@RequestMapping("/search")
//	public Map<String, Object> search(@RequestParam Map<String, Object> param) {
	public Map<String, Object> search(String customerreturnnumber) {
		
//		String w = (String) param.get("q_customerreturnnumber");
		
		System.out.println(customerreturnnumber);
//		System.out.println(w);
		
		
		List<CustomerReturnListEntity> list=customerReturnListService.search(customerreturnnumber);
		
		
//		for (CustomerReturnListEntity zz : list) { System.out.println(zz); }
		 
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("list_product", list);
		
		System.out.println(map);
		
		return map;
	}	
	
	
	
	@RequestMapping("/delete")
	public R del(@RequestBody Long[] ids) {
		
		
		System.out.println(ids);
		
		customerReturnListService.deleteBatch(ids);
		
		return R.ok();
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
