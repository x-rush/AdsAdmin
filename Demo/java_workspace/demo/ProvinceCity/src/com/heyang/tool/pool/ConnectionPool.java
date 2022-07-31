package com.heyang.tool.pool;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.heyang.exception.database.CannotConnectToDBException;

/**
 * ���ݿ����ӳ���,���ڴ�Tomcat���ӳ���ȡ������
 * @author baogy
 *
 * @since 2008-8-15 ����10:03:48
 * @version 1.00
 */
public class ConnectionPool{
	
	private String jndiName="jdbc/MyTodoDataSource";

	/**
	 * ��Tomcat��JNDI��ȡ������,�ǵ�Ҫ�ر�
	 */
	public Connection getConnection() throws CannotConnectToDBException{
		// �����Ķ���
		InitialContext ctx;
		
		// ����Դ����
		DataSource ds;
		
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/"+jndiName);
			return ds.getConnection();				
		} catch (Exception e){
			e.printStackTrace();
			throw new CannotConnectToDBException("�޷����ӵ�"+jndiName+"ָ�������ݿ�.ԭ����"+e.getMessage());
		}			
	}

	public String getJndiName() {
		return jndiName;
	}

	public void setJndiName(String jndiName) {
		this.jndiName = jndiName;
	}
}