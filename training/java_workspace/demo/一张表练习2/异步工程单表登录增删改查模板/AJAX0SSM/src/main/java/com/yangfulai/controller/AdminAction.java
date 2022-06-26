package com.yangfulai.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yangfulai.pojo.Admin;
import com.yangfulai.service.AdminService;
import com.yangfulai.util.MD5Util;
/**
 * 
 * TODO<员工表的控制器>
 * @author  杨福来
 * @date  2019年8月23日 下午2:10:09
 * @version  V1.0
 * 传递JSON数据的注解-@ResponseBody
 * 整个类的方法都传递JSON数据的注解-@RestController
 * 入口路径的注解-@RequestMapping("/a")
 * //添加日志信息
		log.trace("调试等级信息");
		log.debug("debug等级信息");
		log.info("info等级信息");
		log.warn("警告等级信息");
		log.error("错误等级信息");
 */
@RestController//每个方法都会加一个@ResponseBody	注解
@RequestMapping("/a")
public class AdminAction {

	@Autowired
	private AdminService service;

	//日志记录器											//类名做记录器名字
	private static final Logger log = LoggerFactory.getLogger(AdminAction.class);
	
	
	

//	@ResponseBody	//传递JSON数据
//改成@RestController每个方法都默认传递JSON数据
	/**
	 * 登录的控制器
	 * TODO<用jQuery做登录/AJAX>
	 * @param username用户名
	 * @param password密码
	 * @return	成功or失败
	 */
	@RequestMapping("/login")
	public boolean login(String username,String password) {
		List<Admin> list=service.findAll2();
		
		//加密的工具类	
		String md5 = MD5Util.getMD5(password);
		
		
		
		for(Admin a:list) {
			if(a.getUsername().equals(username)&& a.getPassword().equals(md5)) {
				log.error(username+"登陆成功");
				return true;
			}
		}
		log.error(username+"登陆失败");
		return false;
	}
	
	/**
	 * 
	 * TODO<用户表查询的控制器>
	 * @param serachName搜索条件
	 * @param currentPage页码
	 * @param pageSize每页的记录数
	 * @return	map集合
	 */
	@RequestMapping("/table")
	public Map<String,Object> table(String serachName,Integer currentPage,Integer pageSize) {
		
		
		Map<String,Object> map=new HashMap<String,Object>();
//	System.out.println(serachName);
//	System.out.println(currentPage);
//	System.out.println(pageSize);
		//1.存储用户集合	传到前端前端遍历
		map.put("list", service.findAll(serachName, currentPage, pageSize));
		//2.总页数
		map.put("pageCount", service.findPageCount(serachName, pageSize));
		
//		System.out.println(service.findPageCount(serachName, pageSize));
		 
		//3.总记录数
		map.put("totalCount", service.getCount(serachName));

		//4.当前页页码	
		map.put("currentPage", currentPage);
		return map;
		
	}
	
	

	/**
	 * 
	 * TODO<修改添加的控制器>
	 * @param username用户名
	 * @param password密码
	 * @return
	 */
	@RequestMapping("/addAndUpdate")
	public boolean addAndUpdate( String username,String password) {
		
		//加密的工具类	把密码传进来封装一个对象添加这个对象
		String md5 = MD5Util.getMD5(password);
		
		Admin admin=new Admin();
		admin.setUsername(username);
		admin.setPassword(md5);
		
		
		if(service.findOne(admin.getUsername())!=null) {
			
			//修改
			log.error(admin+"修改成功");
			return service.edit(admin);
		}
		//添加
		log.error(admin+"添加成功");
		return service.add(admin);
	}
	
	
	
		/**
		 * 
		 * TODO<删除记录的控制器>
		 * @param username用户名
		 * @return
		 */
		@RequestMapping("/delete")
		public boolean delete( String username) {
			System.out.println(username);

			
			log.error(username+"删除成功");
			return service.remove(username);
		}
	
}
