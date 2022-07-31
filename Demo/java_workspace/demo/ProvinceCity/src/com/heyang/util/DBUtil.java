package com.heyang.util;

import java.sql.Connection;
import java.sql.DriverManager;

import com.heyang.exception.database.CannotConnectToDBException;

/**
 * JDBCֱ�����ӷ�ʽ������ݿ�����
 * @author baogy
 * @version 1.00
 * @since 2008-10-8 ����03:49:20
 *
 */
public class DBUtil{
	private static final String diverClass="org.gjt.mm.mysql.Driver";
	private static final String url="jdbc:mysql://127.0.0.1:3306/test";
	private static final String user="root";
	private static final String pswd="123456";
	
	public static Connection getConnection() throws CannotConnectToDBException{
		Connection conn=null;
		
		try{			
			Class.forName(diverClass);
			conn=DriverManager.getConnection(url, user, pswd);
		}
		catch(Exception ex){
			StringBuffer sb=new StringBuffer();
			
			sb.append("�޷����ӵ����ݿ⣬��������������ݿ����ӡ�\r\n");
			sb.append("<br>����ԭ��һ:"+diverClass+":��Ӧ��������δ�����빤��\r\n");
			sb.append("<br>����ԭ���:url"+url+":��Ϣ���ò���ȷ\r\n");
			sb.append("<br>����ԭ����:user"+user+":����ȷ\r\n");
			sb.append("<br>����ԭ����:password"+pswd+":����ȷ\r\n");
			
			throw new CannotConnectToDBException(sb.toString());
		}
		
		return conn;
	}
}