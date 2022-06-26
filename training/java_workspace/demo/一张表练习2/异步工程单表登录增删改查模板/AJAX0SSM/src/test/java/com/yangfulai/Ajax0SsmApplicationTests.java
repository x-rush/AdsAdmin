package com.yangfulai;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.yangfulai.pojo.Admin;
import com.yangfulai.pojo.Department;
import com.yangfulai.pojo.Employee;
import com.yangfulai.pojo.Position;
import com.yangfulai.service.AdminService;
import com.yangfulai.service.DepartmentService;
import com.yangfulai.service.EmpService;
import com.yangfulai.service.PositionService;
/**
 * 
 * TODO<测试业务层方法的测试类>
 * @author  杨福来
 * @date  2019年8月23日 下午3:04:21
 * @version  V1.0
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@MapperScan(value = "com.yangfulai.dao")
public class Ajax0SsmApplicationTests {

	@Autowired
	private AdminService adminService;
	@Autowired
	private DepartmentService deptService;
	@Autowired
	private PositionService positionService;
	@Autowired EmpService empService;
			
	
	
	
	@Test
	public void contextLoads() {
		
		// 添加
//		Admin admin = new Admin();
//		admin.setUsername("d");
//		admin.setPassword("d");
//		System.out.println("Admin添加："+adminService.add(admin));
		
		//修改
//		Admin admin = adminService.findOne("q");
//		Admin admin = new Admin();
//		admin.setUsername("b");
//		admin.setPassword("b");
//		System.out.println("Admin修改："+ adminService.edit(admin));
//		
		//删除
//		System.out.println("Admin删除：" + adminService.remove("c"));
		

		//根据主键查询一条数据（一个对象）
//		Admin admin = adminService.findOne("aaa");
//		System.out.println(admin);
		
		//统计记录个数的方法（搜索条件：按照名字模糊查询、）
//		System.out.println(adminService.getCount("a"));
		
										//	/(页数-1)*行数=起始位置(下标是从零开始的)
		//分页集合（名字搜索）				//	(null,第几页 , 显示条数)
//		List<Admin> list = adminService.findAll(null, 3, 4);
//		for(Admin a : list) {
//			System.out.println(a);
//		}
		
		//13-1*4
	
		//#####################################################3
		
		//Dept
				//Dept 添加
//				Department dept = new Department();
//				dept.setDepartmentNo("b005");
//				dept.setDepartmentName("经理部");
//				System.out.println("dept添加："+deptService.add(dept));
				
				//dept修改	
//				Department dept = deptService.selectOne("b004");
//				Department dept = new Department();
//				dept.setDepartmentNo("b004");
//				dept.setDepartmentName("人事部");
//				System.out.println("dept修改："+ deptService.edit(dept));
				
				//dept删除
//				System.out.println("dept删除：" + deptService.remove("b004"));
				

				//根据主键查询一条数据（一个对象）
//				Department dept = deptService.selectOne("BM001");
//				System.out.println(dept);
				
				//统计记录个数的方法（搜索条件：按照名字模糊查询、）
//				System.out.println(deptService.getCount("市"));
				
				//分页集合（名字搜索）
//				List<Department> list = deptService.selectAll("部", 1, 2);
//				for(Department d : list) {
//					System.out.println(d);
//				}
		
		
		//###########################################
			
			//position
			//position 添加
//			Position pos = new Position();
//			pos.setDepartmentObj("b005");
//			pos.setPositionName("财务会计2");
//			pos.setBaseSalary(5000.0f);
//			pos.setSellPercent("50%");
//			System.out.println("position添加："+positionService.add(pos));
			
			//position修改
//			Position pos = positionService.selectOne(6);	
//			Position pos = new Position();
//			pos.setPositionName("财务经理");
//			pos.setBaseSalary(5000.0f);
//			pos.setPositionId(6);
//			System.out.println("position修改："+ positionService.edit(pos));
	//		
			//position删除
	//		System.out.println("position删除：" + positionService.remove(6));
			
	
			//根据主键查询一条数据（一个对象）
			Position pos = positionService.selectOne(7);
			System.out.println(pos);
//			System.out.println(pos.getDepartment());
		
		
			//统计记录个数的方法（搜索条件：按照名字模糊查询、）
	//		System.out.println(positionService.getCount("会计"));
			
			//分页集合（名字搜索）
//			List<Position> list = positionService.selectAll(null, 1, 5);
//			for(Position p : list) {
//				System.out.println(p);
//				System.out.println(p.getDepartment());
//			}
	
	
	
	//###########################################
	
	
	//Emp
	//Emp 添加
//	Employee emp = new Employee();
//	emp.setBirthday("2000-11-16");
//	emp.setEmployeeDesc("简介  就是很厉害");
//	emp.setEmployeeNo("EM004");
//	emp.setEmployeePhoto("upload/802350db-0589-46aa-a117-215551565eac.jpg");
//	emp.setName("小杨");
//	emp.setPositionObj(2);
//	emp.setSchoolRecord("本科");
//	emp.setSex("男");
//	System.out.println("Emp添加："+empService.add(emp));
	
	//Emp修改
	//Employee emp = empService.selectOne("a");
	////Employee emp = new Employee();
	//emp.setBirthday("1996-10-07");
	//emp.setEmployeeDesc("简介  就是很厉害");
	//emp.setEmployeeNo("EM003");
	//emp.setName("小王");
	//emp.setPositionObj(5);
	//emp.setSchoolRecord("博士");
	//emp.setSex("男");
	//emp.setEmployeeNo("a");
	//System.out.println("Emp修改："+ empService.edit(emp));
	//
	//Emp删除
//		System.out.println("Emp删除：" + empService.remove("88"));
	
	
	//根据主键查询一条数据（一个对象）
//	Employee emp = empService.selectOne("EM002");
//	System.out.println(emp);
//	System.out.println(emp.getPosition());
//	System.out.println(emp.getPosition().getDepartment());
	
	//统计记录个数的方法（搜索条件：按照名字模糊查询、）
//	System.out.println(empService.getCount("胡"));
	
	//分页集合（名字搜索）
//	List<Employee> list = empService.selectAll(null, 1, 1);
//	for(Employee e : list) {
//		System.out.println(e);
//		System.out.println(e.getPosition());
//		System.out.println(e.getPosition().getDepartment());
//	}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
