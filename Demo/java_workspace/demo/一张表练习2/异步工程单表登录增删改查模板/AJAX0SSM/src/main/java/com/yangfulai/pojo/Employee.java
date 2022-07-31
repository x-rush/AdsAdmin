package com.yangfulai.pojo;
import java.io.Serializable;
/**
 * 
 * TODO<员工表实体类>
 * @author  杨福来
 * @date  2019年8月23日 下午1:44:29
 * @version  V1.0
 */
public class Employee implements  Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7954412421475863916L;
	private String employeeNo;
	private Integer positionObj;
	private String name;
	private String sex;
	private String employeePhoto;
	private String birthday;
	private String schoolRecord;
	private String employeeDesc;
	
	private Position position;

	public String getEmployeeNo() {
		return employeeNo;
	}

	public void setEmployeeNo(String employeeNo) {
		this.employeeNo = employeeNo;
	}

	public Integer getPositionObj() {
		return positionObj;
	}

	public void setPositionObj(Integer positionObj) {
		this.positionObj = positionObj;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmployeePhoto() {
		return employeePhoto;
	}

	public void setEmployeePhoto(String employeePhoto) {
		this.employeePhoto = employeePhoto;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getSchoolRecord() {
		return schoolRecord;
	}

	public void setSchoolRecord(String schoolRecord) {
		this.schoolRecord = schoolRecord;
	}

	public String getEmployeeDesc() {
		return employeeDesc;
	}

	public void setEmployeeDesc(String employeeDesc) {
		this.employeeDesc = employeeDesc;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	@Override
	public String toString() {
		return "Employee [employeeNo=" + employeeNo + ", positionObj=" + positionObj + ", name=" + name + ", sex=" + sex
				+ ", employeePhoto=" + employeePhoto + ", birthday=" + birthday + ", schoolRecord=" + schoolRecord
				+ ", employeeDesc=" + employeeDesc + ", position=" + position + "]";
	}

	public Employee(String employeeNo, Integer positionObj, String name, String sex, String employeePhoto,
			String birthday, String schoolRecord, String employeeDesc, Position position) {
		super();
		this.employeeNo = employeeNo;
		this.positionObj = positionObj;
		this.name = name;
		this.sex = sex;
		this.employeePhoto = employeePhoto;
		this.birthday = birthday;
		this.schoolRecord = schoolRecord;
		this.employeeDesc = employeeDesc;
		this.position = position;
	}

	public Employee() {
		super();
	}
	
	
	
	
	
	
}
