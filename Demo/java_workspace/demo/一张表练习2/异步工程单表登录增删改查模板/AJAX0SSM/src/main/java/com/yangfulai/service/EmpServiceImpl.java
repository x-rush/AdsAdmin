package com.yangfulai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yangfulai.dao.EmpDAO;
import com.yangfulai.pojo.Employee;
/**
 * 
 * TODO<员工业务层接口实现类>
 * @author  杨福来
 * @date  2019年8月23日 下午2:29:56
 * @version  V1.0
 */
@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpDAO dao;
	
	@Override
	public boolean add(Employee emp) {
		if(dao.insert(emp)==1) {
			return true;
		}
		return false;
	}
	@Override
	public boolean edit(Employee emp) {
		if(dao.update(emp) == 1) {
			return true;
		}
		return false;
	}
	@Override
	public boolean remove(String employeeNo) {
		if(dao.delete(employeeNo) == 1) {
			return true;
		}
		return false;
	}
	@Override
	public Employee selectOne(String employeeNo) {
		
		return dao.selectOne(employeeNo);
	}
	@Override
	public int getCount(String name) {
		
		return dao.getCount(name);
	}
	@Override
	public List<Employee> selectAll(String name, int page, int rows) {
		
		return dao.selectAll(name, (page-1)*rows, rows);
	}

	/**
	 * 
	 * 重载方法
		/求页数/页码的方法
	 * @param name总记录数
	 * @param rows每页的个数
	 * @return 页码数
	 */
	//求页数/页码的方法
	@Override	//rows每页的个数	name总记录数
	public int findPageCount(String name, int rows) {
		//总页数=p
		int p = dao.getCount(name);
		if(p%rows ==0) {
			return p/rows;			//总记录数 / 每页记录数= 总页数
		}else{
			
			return p/rows+1;
		}

	}
	
	
}
