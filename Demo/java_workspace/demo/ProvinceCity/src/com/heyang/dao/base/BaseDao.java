package com.heyang.dao.base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.heyang.domain.base.BaseDomainObj;
import com.heyang.exception.database.CannotConnectToDBException;
import com.heyang.util.DBUtil;

/**
 * 各个DAO类的基类
 * Do not repeat yourself
 * @author baogy
 *
 * @since 2008-8-15 上午11:50:42
 * @version 1.00
 */
public abstract class BaseDao{
	protected Connection conn;
	protected PreparedStatement ps;	
	protected String sql;	
	
	/************************************
	 * 下面定义了CRUD四大方法
	 ************************************/
	
	/**
	 * 取得数据库连接
	 * @return
	 * @throws CannotConnectToDBException
	 */
	public Connection getConnection()throws CannotConnectToDBException{
		// 这是直接获得到数据库的连接方案,简单但速度慢,适于单机编程测试
		return DBUtil.getConnection();
		
		// 这是从数据源获得连接的方案,复杂但速度快,消耗资源少,适于在公网上运行程序
//		ConnectionPool pool=new ConnectionPool();
//		return pool.getConnection();
	}
	
	/**
	 * 向数据库中创建一个对象
	 * @param obj
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public abstract void create(BaseDomainObj obj) throws CannotConnectToDBException,SQLException;
	
	/**
	 * 从数据库中查询一个对象
	 * @param sql
	 * @return
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public abstract List<BaseDomainObj> search(String sql) throws CannotConnectToDBException,SQLException;
	
	/**
	 * 得出执行Sql语句将得到的记录数目
	 * @param sql
	 * @return
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public int getRecordCount(String sql) throws CannotConnectToDBException,SQLException{
		String newSql="select count(*) from ("+sql+") t1 ";
		
		conn=getConnection();
		ps=conn.prepareStatement(newSql);
		ResultSet rs=ps.executeQuery();
		rs.next();
		
		return rs.getInt(1);
	}
	
	/**
	 * 更新一个对象
	 * @param obj
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public abstract void update(BaseDomainObj obj) throws CannotConnectToDBException,SQLException;
	
	/**
	 * 删除一个对象
	 * @param obj
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public abstract void delete(BaseDomainObj obj) throws CannotConnectToDBException,SQLException;

}