package com.yangfulai.pojo;
import java.io.Serializable;
/**
 * 
 * TODO<职位表实体类>
 * @author  杨福来
 * @date  2019年8月23日 下午1:45:00
 * @version  V1.0
 */
public class Position implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5181190668302449224L;
	private Integer positionId;
	private String departmentObj;
	private String positionName;
	private Float baseSalary;
	private String sellPercent;
	
	private Department department;

	public Integer getPositionId() {
		return positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

	public String getDepartmentObj() {
		return departmentObj;
	}

	public void setDepartmentObj(String departmentObj) {
		this.departmentObj = departmentObj;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public Float getBaseSalary() {
		return baseSalary;
	}

	public void setBaseSalary(Float baseSalary) {
		this.baseSalary = baseSalary;
	}

	public String getSellPercent() {
		return sellPercent;
	}

	public void setSellPercent(String sellPercent) {
		this.sellPercent = sellPercent;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "Position [positionId=" + positionId + ", departmentObj=" + departmentObj + ", positionName="
				+ positionName + ", baseSalary=" + baseSalary + ", sellPercent=" + sellPercent + ", department="
				+ department + "]";
	}

	public Position(Integer positionId, String departmentObj, String positionName, Float baseSalary, String sellPercent,
			Department department) {
		super();
		this.positionId = positionId;
		this.departmentObj = departmentObj;
		this.positionName = positionName;
		this.baseSalary = baseSalary;
		this.sellPercent = sellPercent;
		this.department = department;
	}

	public Position() {
		super();
	}
	
	
}
