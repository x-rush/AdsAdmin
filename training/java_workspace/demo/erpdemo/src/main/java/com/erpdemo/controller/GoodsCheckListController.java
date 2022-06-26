package com.erpdemo.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.erpdemo.entity.GoodsCheckEntity;
import com.erpdemo.entity.GoodsCheckListEntity;
import com.erpdemo.service.GoodsCheckListService;
import com.erpdemo.service.GoodsCheckService;
import com.erpdemo.vo.GoodsCheckListVO;
import com.erpdemo.vo.GoodsCheckVO;

@RestController
@RequestMapping("/GoodsCheckList")
public class GoodsCheckListController {
	@Autowired
	private GoodsCheckListService goodsCheckListService;
	
	/**
	 * 查询所有
	 */
	@RequestMapping("/showAll")
	public Map<String,Object> showAll(){
		
		Map<String,Object>map=new HashMap<>();
		List<GoodsCheckListEntity> list = goodsCheckListService.showAll();
		if(list!=null) {
			map.put("code",1);
			map.put("list", list);
		}else {
			map.put("code", 0);
		}
		return map;
	}
	
	/**
	 * 分页查询所有
	 * @param pageNumber
	 * @param pageCount
	 * @return
	 */
	@RequestMapping("/showAllByPage")
	public Map<String,Object>showAllByPage(@RequestBody Map<String,String>param){
		System.out.println(param.get("pageCount"));
		System.out.println(param.get("pageNumber"));
		String pageCount=param.get("pageCount");
		String pageNumber=param.get("pageNumber");
		Map<String,Object>map=new HashMap<>();
		List<GoodsCheckListEntity>list=goodsCheckListService.getPage(Integer.parseInt(pageNumber), Integer.parseInt(pageCount));
		if(list!=null) {
			map.put("code",1);
			map.put("list", list);
		}else {
			map.put("code",0);
		}
		return map;
	}
	
	/**
	 * 获得总页码数以及总记录数
	 * @param pageCount
	 * @return
	 */
	@RequestMapping("/getTotalPageNumber")
//	public Map<String,Object>getTotalPageNumber(@RequestBody String pageCount){
	public Map<String,Object>getTotalPageNumber(String pageCount){
		System.out.println("pageCount:"+pageCount);
		Map<String,Object>map=new HashMap<>();
		int num=goodsCheckListService.getTotalPageNumber(Integer.parseInt(pageCount));
		int totalNumber=goodsCheckListService.getTotalNumber();
		if(num>0) {
			map.put("code", 1);
			map.put("pageTotalNumber", num);
			map.put("totalNumber", totalNumber);
		}else {
			map.put("code",0);
		}
		return map;
	}
	
	/**
	 * 保存数据
	 * @param param
	 * @return
	 */
	@RequestMapping("save")
//	public Map<String,Object> save(@RequestBody Map<String,String>param){
//		System.out.println(param);
//		
//		GoodsCheckEntity record=new GoodsCheckEntity();
//		record.setChecknum(Integer.parseInt(param.get("checknum")));
//		record.setChecknumber(param.get("checknumber"));
//		record.setMemo(param.get("memo"));
//		record.setResult(param.get("result"));
//		record.setStocknum(Integer.parseInt(param.get("stocknum")));
//		record.setUserid(Integer.parseInt(param.get("userid")));
	public Map<String,Object> save(@RequestBody GoodsCheckListEntity record){
		System.out.println(record);
		Map<String,Object>map=new HashMap<>();
		boolean flag=false;
		if(record.getId()!=null) {
			//修改--保存
			GoodsCheckListEntity rec = goodsCheckListService.getOneById(record.getId());
			if(!rec.getCode().equals(record.getCode())) {
				rec.setCode(record.getCode());
			}
			if(!rec.getGoodsid().equals(record.getGoodsid())) {
				rec.setGoodsid(record.getGoodsid());
			}
			if(!rec.getModel().equals(record.getModel())) {
				rec.setModel(record.getModel());
			}
			if(!rec.getName().equals(record.getName())) {
				rec.setName(record.getName());
			}
			if(!rec.getNum().equals(record.getNum())) {
				rec.setNum(record.getNum());
			}
			if(!rec.getMarketnum().equals(record.getMarketnum())) {
				rec.setMarketnum(record.getMarketnum());
			}
			if(!rec.getReturnnum().equals(record.getReturnnum())) {
				rec.setReturnnum(record.getReturnnum());
			}
			if(!rec.getStocknum().equals(record.getStocknum())) {
				rec.setStocknum(record.getStocknum());
			}
			if(!rec.getUnit().equals(record.getUnit())) {
				rec.setUnit(record.getUnit());
			}
			if(!rec.getTypeid().equals(record.getTypeid())) {
				rec.setTypeid(record.getTypeid());
			}
			if(!rec.getUserid().equals(record.getUserid())) {
				rec.setUserid(record.getUserid());
			}
			if(!rec.getResult().equals(record.getResult())) {
				rec.setResult(record.getResult());
			}
			if(!rec.getMemo().equals(record.getMemo())) {
				rec.setMemo(record.getMemo());
			}
			if(!rec.getGoodscheckid().equals(record.getGoodscheckid())) {
				rec.setGoodscheckid(record.getGoodscheckid());
			}
			
			flag=goodsCheckListService.update(rec);
		}else {
			//添加--保存
			flag=goodsCheckListService.save(record);
		}
		if(flag) {
			map.put("code", 1);
		}else {
			map.put("code",0);
		}
		return map;
	}
	
	/**
	 * 修改数据之提取数据
	 * @param id
	 * @return
	 */
	@RequestMapping("/update")
	public Map<String,Object> update(String id){
		System.out.println(id);
		
		Map<String,Object>map=new HashMap<>();
		GoodsCheckListEntity record = goodsCheckListService.getOneById(Integer.parseInt(id));
		if(record!=null) {
			map.put("code", 1);
			map.put("record", record);
		}else {
			map.put("code", 0);
		}
		return map;
	}
	
	/**
	 * 删除（隐藏）数据
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	public Map<String,Object> delete(@RequestBody String[]ids){
		System.out.println(Arrays.toString(ids));
		
		Map<String,Object>map=new HashMap<>();
		boolean flag =false;
		StringBuffer sb=new StringBuffer();
		for(int i=0;i<ids.length;i++) {
			flag = goodsCheckListService.delete(Integer.parseInt(ids[i]));
			
			if(!flag) {
				
				sb.append(ids[i]).append(" ");
			}
		}
		if(sb.length()>0) {
			map.put("code",0);
			map.put("index", sb);
		}else {
			map.put("code",1);
		}
		
		
		return map;
	}
	
	@RequestMapping("/search")
	public Map<String,Object>search(@RequestBody GoodsCheckListVO goodsCheckListVO){
		System.out.println(goodsCheckListVO);
		Map<String,Object>map=new HashMap<>();
		List<GoodsCheckListEntity> list = goodsCheckListService.search(goodsCheckListVO);
		if(list!=null) {
			map.put("code", 1);
			map.put("list", list);
		}else {
			map.put("code",0);
		}
		return map;
	}
	
	@RequestMapping("/getPage")
	public Map<String,Object>getPage(@RequestBody String pageNumber){
		System.out.println(pageNumber);
		Map<String,Object>map=new HashMap<>();
//		goodsCheckService.
		
		return map;
	}
	
}
