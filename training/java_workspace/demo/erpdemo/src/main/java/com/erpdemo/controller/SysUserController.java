package com.erpdemo.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.erpdemo.config.WebMvcConfig;
import com.erpdemo.entity.SysUserEntity;
import com.erpdemo.service.SysUserRoleService;
import com.erpdemo.service.SysUserService;
import com.erpdemo.utils.Constant;
import com.erpdemo.utils.PageUtils;
import com.erpdemo.utils.Query;
import com.erpdemo.utils.R;
import com.erpdemo.utils.ShiroUtils;
import com.erpdemo.utils.annotation.SysLog;
import com.erpdemo.utils.validator.Assert;
import com.erpdemo.utils.validator.ValidatorUtils;
import com.erpdemo.utils.validator.group.AddGroup;
import com.erpdemo.utils.validator.group.UpdateGroup;

/**
 * 系统用户
 * 
 */
@RestController
@RequestMapping("/sys/user")
public class SysUserController extends AbstractController {
	
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysUserRoleService sysUserRoleService;
	@Autowired
	private WebMvcConfig webMvcConfig;
	
	/**
	 * 所有用户列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:user:list")
	public R list(@RequestParam Map<String, Object> params) {
		// 只有超级管理员，才能查看所有管理员列表
		if (getUserid() != Constant.SUPER_ADMIN) {
			params.put("createUserId", getUserid());
		}

		// 查询列表数据
		Query query = new Query(params);
		List<SysUserEntity> userList = sysUserService.queryList(query);
		int total = sysUserService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(userList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 获取登录的用户信息
	 */
	@RequestMapping("/info")
	public R info() {
		return R.ok().put("user", getUser());
	}

	/**
	 * 修改登录用户密码
	 */
	@SysLog("修改密码")
	@RequestMapping("/password")
	public R password(String password, String newPassword) {
		Assert.isBlank(newPassword, "新密码不为能空");

		// sha256加密
		password = new Sha256Hash(password).toHex();
		// sha256加密
		newPassword = new Sha256Hash(newPassword).toHex();

		// 更新密码
		int count = sysUserService.updatePassword(getUserid(), password, newPassword);
		if (count == 0) {
			return R.error("原密码不正确");
		}

		// 退出
		ShiroUtils.logout();

		return R.ok();
	}

	/**
	 * 所有用户列表
	 */
	@RequestMapping("/selectOne")
	@RequiresPermissions("sys:user:info")
	public R selectOne(String userId) {
		
		SysUserEntity user = sysUserService.queryObject(Long.parseLong(userId));
		
		return R.ok().put("user", user);
	}
	
	
	
	
	/**
	 * 用户信息
	 */
	@RequestMapping("/info/{userId}")
	@RequiresPermissions("sys:user:info")
	public R info(@PathVariable("userId") Long userId) {
		SysUserEntity user = sysUserService.queryObject(userId);

		// 获取用户所属的角色列表
		List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userId);
		user.setRoleIdList(roleIdList);

		return R.ok().put("user", user);
	}

	/**
	 * 保存用户
	 */
	@SysLog("保存用户")
	@RequestMapping("/save")
	@RequiresPermissions("sys:user:save")
	public R save(@RequestBody SysUserEntity user, HttpServletRequest req) {

		
		ValidatorUtils.validateEntity(user, AddGroup.class);
		
		user.setCreateUserId(getUserid());
		sysUserService.save(user);

		return R.ok();
	}

	/**
	 * 修改用户
	 */
	@SysLog("修改用户")
	@RequestMapping("/update")
	@RequiresPermissions("sys:user:update")
	public R update(@RequestBody SysUserEntity user) {
		ValidatorUtils.validateEntity(user, UpdateGroup.class);

		// id 密码 性别 QQ

		// 通过主键到数据库中 获取该条记录 对象
		
		long id = user.getUserid();
		
		SysUserEntity user_db = sysUserService.queryObject(id);
		
		// 将页面的新的信息封装到 对象中(user)

		// 将新的数据 通过 set方法 设置到 旧的对象中

		String password = user.getPassword();
		String mobile = user.getMobile();
		String email = user.getEmail();
		
		
		user_db.setPassword(password);
		user_db.setMobile(mobile);
		user_db.setEmail(email);
		

		// 调用 update方法更新数据 (对象是旧的)
		sysUserService.update(user_db);
	
		return R.ok();
	}

	
	
	
	/**
	 * 删除用户
	 */
	@SysLog("删除用户")
	@RequestMapping("/delete")
	@RequiresPermissions("sys:user:delete")
	public R delete(@RequestBody Long[] ids) {
		if (ArrayUtils.contains(ids, 1L)) {
			return R.error("系统管理员不能删除");
		}

		if (ArrayUtils.contains(ids, getUserid())) {
			return R.error("当前用户不能删除");
		}

		sysUserService.deleteBatch(ids);

		return R.ok();
	}
}
