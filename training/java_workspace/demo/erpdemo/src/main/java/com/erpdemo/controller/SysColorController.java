package com.erpdemo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.erpdemo.entity.GoodsColorEntity;
import com.erpdemo.entity.SysRoleEntity;
import com.erpdemo.service.GoodsColorService;
import com.erpdemo.utils.Constant;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;
import com.erpdemo.utils.annotation.SysLog;
import com.erpdemo.utils.validator.ValidatorUtils;
import com.erpdemo.vo.ColorVO;
@RestController
@RequestMapping("/sys/color")
public class SysColorController {
	@Autowired
	private GoodsColorService goodsColorService;
	

	
//	// 查询列表
//			@RequestMapping("/list")
//			public Object list() {
//				List<GoodsColorEntity> list_colorList = goodsColorService.findAll();
//			
//				Map<String, Object> map = new HashMap<String, Object>();
//				map.put("list_colorList", list_colorList);
//				return map;
//			}

	
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> param) {
		Query query = new Query(param);

		List<GoodsColorEntity> list_colorList = goodsColorService.queryList(query);
		int total = goodsColorService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(list_colorList, total, query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}

	

	@RequestMapping("/save")//添加
	public Map<String,Object> insert(@RequestParam Map<String,String> param) {
        System.out.println(param);
		String tid=param.get("tid");
		String name = param.get("name");
		String price = param.get("price");
		String userid = param.get("userid");
		String delflag = "0";
		
		GoodsColorEntity record = new GoodsColorEntity();
		
		record.setTid(Integer.parseInt(tid));
		record.setName(name);
		record.setPrice(Double.parseDouble(price));
		record.setUserid(Integer.parseInt(userid));
		record.setDelflag(Integer.parseInt(delflag));
		int count = goodsColorService.insert(record);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("code", 0);
		
		return map;
	}
	

	

	@RequestMapping("/update")
	public Map<String,Object> findOne(@RequestParam Map<String,String> param) {
		
		String id = param.get("id");
//		System.out.println(id);
		
		GoodsColorEntity entity =  goodsColorService.selectByPrimaryKey(Integer.parseInt(id));
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("code", 0);
		
		map.put("entity", entity);
		
		return map ;
	}
	
	
	
	
	@RequestMapping("/doupdate")
	public Map<String,Object> doupdate(@RequestParam Map<String,String> param) {
		
		String id=param.get("id");
		String tid=param.get("tid");
		String name = param.get("name");
		String price = param.get("price");
		String userid = param.get("userid");
		String delflag = "0";
		
		GoodsColorEntity entity = new GoodsColorEntity();
		
		entity.setId(Integer.parseInt(id));
		entity.setTid(Integer.parseInt(tid));
		entity.setName(name);
		entity.setPrice(Double.parseDouble(price));
		entity.setUserid(Integer.parseInt(userid));
		entity.setDelflag(Integer.parseInt(delflag));
		
		int count = goodsColorService.update(entity);
		System.out.println(entity);
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("code", 0);
		
		return map;
	}
	
	@RequestMapping("/page")
	@ResponseBody
	public  Map<String,Object> page(String currPage) {
        int index = 0;
		
		int count = 5;
		
		int total = 0;
		
		total = goodsColorService.findForCount();
		
		int totalPage = 0 ;
		
		if( total%count == 0) {
			totalPage = total / count ;
		}
		else {
			totalPage = total / count + 1;
		}
		
		index = (Integer.parseInt(currPage) -1 ) * count ;
		
		Map<String,String> param = new HashMap<String,String>();

		List<GoodsColorEntity> list_colorList = goodsColorService.findForSearch(param,index,count);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list_colorList", list_colorList);
		
		map.put("totalPage", totalPage);
		
		return map;
	}
	
	

	@RequestMapping("/dels")
	public boolean dels(@RequestBody Long[] id) {
		
		boolean boo=goodsColorService.deleteByPrimaryKey(id);
		if(boo) {
			return true;
		}else {
			return false;
		}
	}
	
	
	@RequestMapping("/search")
	public  Map<String,Object> search( @RequestBody ColorVO colorVO) {

		String name = colorVO.getName();
		
		Map<String,String> param = new HashMap<String,String>();

		param.put("name", name);
		List<GoodsColorEntity> list_colorList = goodsColorService.findForSearch(param, 0, 10);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list_colorList", list_colorList);
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
