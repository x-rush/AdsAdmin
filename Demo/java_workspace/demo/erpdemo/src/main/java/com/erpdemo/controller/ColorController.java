package com.erpdemo.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.GoodsColorEntity;
import com.erpdemo.service.GoodsColorService;
import com.erpdemo.utils.R;
import com.erpdemo.utils.annotation.SysLog;


@RestController
//@RequestMapping("/sys/color")
public class ColorController{

	@Autowired
	private GoodsColorService goodsColorService;

	// 查询列表
	@RequestMapping("/list")
	public Object list() {

		List<GoodsColorEntity> list_colorList = goodsColorService.findAll();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list_colorList", list_colorList);
		return map;
	}

	// 删除
//	@RequestMapping("/delete")
//	@RequiresPermissions("sys:color:delete")
//	public boolean delete(@RequestBody Long[] id) {
//		boolean boo=goodsColorService.delete(id);
//		if(boo) {
//			return true;	
//		}
//		return false;
//	}
	
	
	@SysLog("删除")
	@RequestMapping("/delete")
	@RequiresPermissions("sys:color:delete")
	public R delete(@RequestBody Long[] id){
		//goodsColorService.delete(id);
		
		return R.ok();
	}
	
	
	
	
	
//	// 添加
//		@RequestMapping("/save")
//		public Map<String,Object> save(@RequestParam Map<String,String> param){
//			
//			String overflownumber = param.get("overflownumber");
//			String remarks = param.get("remarks");
//			String userid = param.get("userid");
//			String delflag = "0";
//			OverFlowListEntity entity = new OverFlowListEntity();
////			System.out.println(overflownumber);
////			System.out.println(remarks);
////			System.out.println(userid);
//			entity.setOverflownumber(overflownumber);
//			entity.setRemarks(remarks);
//			entity.setUserid(Integer.parseInt(userid));
//			entity.setDelflag(Integer.parseInt(delflag));
//			
//			int count = overFlowListService.add(entity);
//			
//			Map<String,Object> map = new HashMap<String,Object>();
//			
//			map.put("code", 0);
//			
//			return map ;
//
//		}
}
