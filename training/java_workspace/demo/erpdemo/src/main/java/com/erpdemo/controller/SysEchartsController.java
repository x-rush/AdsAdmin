package com.erpdemo.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.SysUserEntity;
import com.erpdemo.service.SysUserService;
import com.erpdemo.utils.Constant;
import com.erpdemo.utils.R;

/**
 * 系统用户
 * 
 */
@RestController
@RequestMapping("/sys/echarts")
public class SysEchartsController extends AbstractController{
	
	
	@Autowired
	private SysUserService sysUserService;
	
	/**
	 * 所有用户列表
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params){
		//只有超级管理员，才能查看所有管理员列表
		if(getUserid() != Constant.SUPER_ADMIN){
//			params.put("createUserId", getUserid());
		}
		
		return R.ok();
	}
	
	
	
	@RequestMapping("/select")
	public R info(){
		
//		String x = "['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']";
		List<String> list_x = new LinkedList<String>();
		list_x.add("Mon");
		list_x.add("Tue");
		list_x.add("Wed");
		list_x.add("Thu");
		list_x.add("Fri");
		list_x.add("Sat");
		list_x.add("Sun");
		
//		String s = "[820, 932, 901, 934, 1290, 1330, 1320]";
		
		List<String> list_s = new LinkedList<String>();
		list_s.add("820");
		list_s.add("932");
		list_s.add("901");
		list_s.add("934");
		list_s.add("1290");
		list_s.add("1330");
		list_s.add("1320");
		
		List<SysUserEntity> list = sysUserService.queryByMonth(null);
		
		
		
		
		R r = R.ok(); 

		r.put("xAxisData", list_x);
		r.put("seriesData", list_s);
		
		return r;
	}
	
}
