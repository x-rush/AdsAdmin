package com.zhaoyang.enumm;

public enum ReturnCode {
	
	SUCCESS(1, "成功"), ERROR(-1, "失败");
	
	private int code;
	private String name;
	
	private ReturnCode(int code, String name) {
		this.code = code;
		this.name = name;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
