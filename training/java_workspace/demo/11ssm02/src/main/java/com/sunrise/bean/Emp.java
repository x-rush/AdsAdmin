package com.sunrise.bean;

public class Emp {
    private Integer id;

    private String empname;

    private Double salary;

    private Integer job;

    private Integer deleflg;

    private String other;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmpname() {
        return empname;
    }

    public void setEmpname(String empname) {
        this.empname = empname == null ? null : empname.trim();
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public Integer getJob() {
        return job;
    }

    public void setJob(Integer job) {
        this.job = job;
    }

    public Integer getDeleflg() {
        return deleflg;
    }

    public void setDeleflg(Integer deleflg) {
        this.deleflg = deleflg;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other == null ? null : other.trim();
    }

	public Emp(Integer id, String empname, Double salary, Integer job, Integer deleflg, String other) {
		super();
		this.id = id;
		this.empname = empname;
		this.salary = salary;
		this.job = job;
		this.deleflg = deleflg;
		this.other = other;
	}

	public Emp() {
		super();
	}

	@Override
	public String toString() {
		return "Emp [id=" + id + ", empname=" + empname + ", salary=" + salary + ", job=" + job + ", deleflg=" + deleflg
				+ ", other=" + other + "]";
	}
    
}