package com.yangfulai.pojo;
import java.io.Serializable;
/**
 * 
 * TODO<员工表实体类>
 * @author  杨福来
 * @date  2019年8月23日 下午1:43:14
 * @version  V1.0
 */
public class Admin implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3319740045673687801L;
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Admin [username=" + username + ", password=" + password + "]";
	}
	public Admin(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public Admin() {
		super();
	}
	
	
	
	
}
