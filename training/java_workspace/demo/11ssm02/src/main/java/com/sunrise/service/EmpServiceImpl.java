package com.sunrise.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sunrise.bean.Emp;
import com.sunrise.bean.EmpExample;
import com.sunrise.bean.EmpExample.Criteria;
import com.sunrise.dao.EmpMapper;

@Service
public class EmpServiceImpl implements EmpService{
	@Autowired
	private EmpMapper dao;
	
	@Override
	public List<Emp> getEmpList() {
		EmpExample example = new EmpExample();
		Criteria c = example.createCriteria();
		c.andDeleflgEqualTo(0); 
		example.setOrderByClause("id asc");
		List<Emp> list = dao.selectByExample(example);
		return list;
	}

	@Override
	public Emp getEmpOne(int id) {
		return dao.selectByPrimaryKey(id);
	}

	@Override
	public boolean addEmp(Emp emp) {
		int count = dao.insert(emp);
		if(count==1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean updateEmp(Emp emp) {
		int count = dao.updateByPrimaryKey(emp);
		if(count==1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteEmp(Emp emp) {
		int i = dao.deleteByPrimaryKey(emp.getId());
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public int getCountEmp() {
		return getEmpList().size();
	}

	@Override
	public List<Emp> getListEmp(int pageNo, int pageSize) {
		EmpExample example = new EmpExample();
		Criteria c = example.createCriteria();
		c.andDeleflgEqualTo(0);
		example.setOrderByClause("id asc");
		
		PageHelper.startPage(pageNo,pageSize);
		List<Emp> list = dao.selectByExample(example);
		PageInfo<Emp> pageInfo = new PageInfo<Emp>(list);
		
		return pageInfo.getList();
	}
	
	
}
