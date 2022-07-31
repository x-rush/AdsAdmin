package com.sunrise.service;

import java.util.List;

import com.sunrise.bean.Emp;

public interface EmpService {
	//查询所有员工信息
	List<Emp> getEmpList();
	//根据ID查询某个员工信息
	Emp getEmpOne(int id);
	//添加员工信息
	boolean addEmp(Emp emp);
	//更改员工信息
	boolean updateEmp(Emp emp);
	//删除员工信息
	boolean deleteEmp(Emp emp);
	//统计员工信息条数
	public int getCountEmp();
	//分页查询员工信息
	public List<Emp> getListEmp(int pageNo, int pageSize);
}
