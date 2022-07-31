package com.sunrise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunrise.bean.Emp;
import com.sunrise.service.EmpService;

@Controller
@RequestMapping("/emp")
public class EmpAction {
	@Autowired
	private EmpService service;
	
	@RequestMapping("/add")
	public String add(Emp emp,Model model) {
//		emp.setDeleflg(0);
		boolean boo = service.addEmp(emp);
		if(boo) {
//			model.addAttribute("empList", service.getEmpList());
//			return "emplist";
			return page(1, model);
		}else {
			model.addAttribute("emp_add_err", "员工添加失败");
			return "addEmp";
		}
	}
	
	//选择要更新的信息，并带入更新页面
	@RequestMapping("/edit")
	public String edit(int id, Model model) {
		Emp emp = service.getEmpOne(id);
		model.addAttribute("emp", emp);
		return "updateEmp";
	}
	//保存更新信息
	@RequestMapping("/update")
	public String update(Emp emp, Model model) {
		boolean boo = service.updateEmp(emp);
		if(boo) {
//			model.addAttribute("empList", service.getEmpList());
//			return "emplist";
			return page(1, model);
		}else {
			model.addAttribute("emp_update_err", "员工修改失败");
			return "updateEmp";
		}
	}
	//删除
	@RequestMapping("/delete")
	public String delete(Emp emp, Model model) {
		boolean boo = service.deleteEmp(emp);
		if(boo) {
//			model.addAttribute("empList", service.getEmpList());
//			return "emplist";
			return page(1, model);
		}else {
			model.addAttribute("emp_del_err", "员工删除失败");
			return "emplist";
		}
	}
	//查看
	@RequestMapping("/view")
	public String view(int id, Model model) {
		Emp emp = service.getEmpOne(id);
		model.addAttribute("emp", emp);
		return "viewEmp";
	}
	
	@RequestMapping("/pageList")
	public String page(int page,Model model) {
		int count = service.getCountEmp();
		model.addAttribute("pageCount", count/10+1);
		List<Emp> pageList =service.getListEmp(page, 10);
		model.addAttribute("empList", pageList);
		return "emplist";
	}
	
}
