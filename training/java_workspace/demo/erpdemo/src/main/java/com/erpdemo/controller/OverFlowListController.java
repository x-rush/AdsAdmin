 package com.erpdemo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.OverFlowListEntity;
import com.erpdemo.service.OverFlowListService;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;


/**
 * 商品报溢单
 * 
 */
@RestController
@RequestMapping("/sys/overflowlist")
public class OverFlowListController {

	@Autowired
	private OverFlowListService overFlowListService;
	
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> param) {
		Query query = new Query(param);

		List<OverFlowListEntity> list_OverFlowList = overFlowListService.queryList(query);
		int total = overFlowListService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(list_OverFlowList, total, query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}

	// 物理删除
//	@RequestMapping("/delete")
//	public boolean delete(@RequestBody Long[] id) {
//		
//		boolean boo=overFlowListService.delete(id);
//		if(boo) {
//			return true;	
//		}
//		return false;
//	}
	
	//逻辑删除
	@RequestMapping("/delete")
	public boolean delete(@RequestBody Long[] id) {
		boolean boo=overFlowListService.updateList(id);
		if(boo) {
			return true;	
		}
		return false;
}
	
	// 添加
		@RequestMapping("/save")
		public R save(
				@RequestParam Map<String,String> param) {
			
			String overflownumber = param.get("overflownumber");
			String remarks = param.get("remarks");
			String userid = param.get("userid");
			String delflag = "0";
			OverFlowListEntity entity = new OverFlowListEntity();
			
			entity.setOverflownumber(overflownumber);
			entity.setRemarks(remarks);
			entity.setUserid(Integer.parseInt(userid));
			entity.setDelflag(Integer.parseInt(delflag));
			
			int count = overFlowListService.add(entity);
			
//			Map<String,Object> map = new HashMap<String,Object>();		
//			map.put("code", 0);
			
			return R.ok();
		}
		
		// 根据ID查找信息
		@RequestMapping("/update")
		public R findOne(@RequestParam Map<String,String> param) {
			
			String id = param.get("id");
			
			OverFlowListEntity entity =  overFlowListService.queryObject(Integer.parseInt(id));
			
//			Map<String,Object> map = new HashMap<String,Object>();		
//			map.put("code", 0);		
//			map.put("entity", entity);		
//			return map ;
			
			return R.ok().put("entity", entity);
		}
		
		//修改
		@RequestMapping("/doupdate")
		public R doupdate(
				@RequestParam Map<String,String> param) {

			String id = param.get("id");
			String overflownumber = param.get("overflownumber");
			String remarks = param.get("remarks");
			String userid = param.get("userid");
			String delflag = "0";
			
			OverFlowListEntity entity = new OverFlowListEntity();
			
			entity.setId(Integer.parseInt(id));
			entity.setOverflownumber(overflownumber);
			entity.setRemarks(remarks);
			entity.setUserid(Integer.parseInt(userid));
			entity.setDelflag(Integer.parseInt(delflag));
			
			int count = overFlowListService.update(entity);
			
//			Map<String,Object> map = new HashMap<String,Object>();	
//			map.put("code", 0);
//			return map;
			
			return R.ok();
		}
}
