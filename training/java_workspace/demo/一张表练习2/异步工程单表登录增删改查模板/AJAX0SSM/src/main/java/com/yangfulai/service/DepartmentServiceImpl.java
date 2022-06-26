package com.yangfulai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yangfulai.dao.DepartmentDAO;
import com.yangfulai.pojo.Department;
/**
 * 
 * TODO<部门业务层实现类>
 * @author  杨福来
 * @date  2019年8月23日 下午2:20:46
 * @version  V1.0
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentDAO dao;
	@Override
	public boolean add(Department department) {
		if(dao.insert(department) == 1) {
			return true;
		}
		return false;
	}
	@Override
	public boolean edit(Department department) {
		if(dao.update(department)==1) {
			return true;
		}
		return false;
	}
	@Override
	public boolean remove(String departmentNo) {
		System.out.println(departmentNo);
		if(dao.delete(departmentNo) == 1) {
			return true;
		}
		return false;
	}
	@Override
	public Department selectOne(String departmentNo) {
		
		return dao.selectOne(departmentNo);
	}
	@Override
	public int getCount(String departmentName) {
		
		return dao.getCount(departmentName);
	}
	@Override
	public List<Department> selectAll(String departmentName, int page, int rows) {
		
		return dao.selectAll(departmentName, (page-1)*rows, rows);
	}

	//求页数的方法
		@Override	//rows每页的个数
		public int findPageCount(String name, int rows) {
			int p = dao.getCount(name);
			if(p%rows ==0) {
				return p/rows;
			}else{
				
				return p/rows+1;
			}

		}
		@Override
		public List<Department> GetAll() {
			
			return dao.getAll();
		}
	
	
	
}
