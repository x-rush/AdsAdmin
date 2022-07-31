package com.heyang.util;

import java.sql.Connection;
import java.sql.DriverManager;

import com.heyang.exception.database.CannotConnectToDBException;

/**
 * JDBC直接连接方式获得数据库连接
 * @author baogy
 * @version 1.00
 * @since 2008-10-8 下午03:49:20
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
			
			sb.append("无法连接到数据库，请检查驱动类或数据库连接。\r\n");
			sb.append("<br>可能原因一:"+diverClass+":对应的驱动类未被载入工程\r\n");
			sb.append("<br>可能原因二:url"+url+":信息配置不正确\r\n");
			sb.append("<br>可能原因三:user"+user+":不正确\r\n");
			sb.append("<br>可能原因四:password"+pswd+":不正确\r\n");
			
			throw new CannotConnectToDBException(sb.toString());
		}
		
		return conn;
	}
}