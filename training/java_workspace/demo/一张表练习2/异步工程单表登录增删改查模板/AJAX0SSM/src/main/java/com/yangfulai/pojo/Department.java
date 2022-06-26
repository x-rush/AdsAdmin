package com.yangfulai.pojo;
import java.io.Serializable;//序列化接口
/**
 * 
 * TODO<部门表实体类>
 * @author  杨福来
 * @date  2019年8月23日 下午1:43:57
 * @version  V1.0
 */
public class Department implements Serializable{

	/**
	 * 类的版本ID,每个类都有一个唯一的版本ID
	 * 如果代码不变类ID不变代码变ID就变
	 */
	private static final long serialVersionUID = 2847212357214222982L;
	
	
	private String departmentNo;
	private String departmentName;
	
	
	
	public String getDepartmentNo() {
		return departmentNo;
	}
	public void setDepartmentNo(String departmentNo) {
		this.departmentNo = departmentNo;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	@Override
	public String toString() {
		return "Department [departmentNo=" + departmentNo + ", departmentName=" + departmentName + "]";
	}
	public Department(String departmentNo, String departmentName) {
		super();
		this.departmentNo = departmentNo;
		this.departmentName = departmentName;
	}
	public Department() {
		super();
	}
	
	
	
	
	
	
}
