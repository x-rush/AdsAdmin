package com.erpdemo.entity;

import java.io.File;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import com.erpdemo.utils.validator.group.AddGroup;
import com.erpdemo.utils.validator.group.UpdateGroup;

/**
 * 系统用户
 * 
 */
public class SysUserEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;

	/**
	 * 用户ID
	 */
	private Long userid;

	/**
	 * 用户名
	 */
	@NotBlank(message = "用户名不能为空", groups = { AddGroup.class, UpdateGroup.class })
	private String username;

	/**
	 * 密码
	 */
	@NotBlank(message = "密码不能为空", groups = AddGroup.class)
	private transient String password;

	/**
	 * 邮箱
	 */
	@NotBlank(message = "邮箱不能为空", groups = { AddGroup.class, UpdateGroup.class })
	@Email(message = "邮箱格式不正确", groups = { AddGroup.class, UpdateGroup.class })
	private String email;

	/**
	 * 手机号
	 */
	private String mobile;

	/**
	 * 状态 0：禁用 1：正常
	 */
	private Integer status;

	/**
	 * 角色ID列表
	 */
	private List<Long> roleIdList;

	/**
	 * 创建者ID
	 */
	private Long createUserId;

	/**
	 * 创建时间
	 */
	private Date createTime;
	

	

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	/**
	 * 设置：用户名
	 * 
	 * @param username 用户名
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * 获取：用户名
	 * 
	 * @return String
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * 设置：密码
	 * 
	 * @param password 密码
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 获取：密码
	 * 
	 * @return String
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * 设置：邮箱
	 * 
	 * @param email 邮箱
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * 获取：邮箱
	 * 
	 * @return String
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * 设置：手机号
	 * 
	 * @param mobile 手机号
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * 获取：手机号
	 * 
	 * @return String
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * 设置：状态 0：禁用 1：正常
	 * 
	 * @param status 状态 0：禁用 1：正常
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 获取：状态 0：禁用 1：正常
	 * 
	 * @return Integer
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * 设置：创建时间
	 * 
	 * @param createTime 创建时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取：创建时间
	 * 
	 * @return Date
	 */
	public Date getCreateTime() {
		return createTime;
	}

	public List<Long> getRoleIdList() {
		return roleIdList;
	}

	public void setRoleIdList(List<Long> roleIdList) {
		this.roleIdList = roleIdList;
	}

	public Long getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}

	

}
