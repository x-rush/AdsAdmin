package com.heyang.tool.pool;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.heyang.exception.database.CannotConnectToDBException;

/**
 * 数据库连接池类,用于从Tomcat连接池中取得连接
 * @author baogy
 *
 * @since 2008-8-15 上午10:03:48
 * @version 1.00
 */
public class ConnectionPool{
	
	private String jndiName="jdbc/MyTodoDataSource";

	/**
	 * 从Tomcat的JNDI中取得连接,记得要关闭
	 */
	public Connection getConnection() throws CannotConnectToDBException{
		// 上下文对象
		InitialContext ctx;
		
		// 数据源对象
		DataSource ds;
		
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/"+jndiName);
			return ds.getConnection();				
		} catch (Exception e){
			e.printStackTrace();
			throw new CannotConnectToDBException("无法连接到"+jndiName+"指定的数据库.原因是"+e.getMessage());
		}			
	}

	public String getJndiName() {
		return jndiName;
	}

	public void setJndiName(String jndiName) {
		this.jndiName = jndiName;
	}
}