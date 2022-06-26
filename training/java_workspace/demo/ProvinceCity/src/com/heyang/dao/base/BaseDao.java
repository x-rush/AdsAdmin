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
 * ����DAO��Ļ���
 * Do not repeat yourself
 * @author baogy
 *
 * @since 2008-8-15 ����11:50:42
 * @version 1.00
 */
public abstract class BaseDao{
	protected Connection conn;
	protected PreparedStatement ps;	
	protected String sql;	
	
	/************************************
	 * ���涨����CRUD�Ĵ󷽷�
	 ************************************/
	
	/**
	 * ȡ�����ݿ�����
	 * @return
	 * @throws CannotConnectToDBException
	 */
	public Connection getConnection()throws CannotConnectToDBException{
		// ����ֱ�ӻ�õ����ݿ�����ӷ���,�򵥵��ٶ���,���ڵ�����̲���
		return DBUtil.getConnection();
		
		// ���Ǵ�����Դ������ӵķ���,���ӵ��ٶȿ�,������Դ��,�����ڹ��������г���
//		ConnectionPool pool=new ConnectionPool();
//		return pool.getConnection();
	}
	
	/**
	 * �����ݿ��д���һ������
	 * @param obj
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public abstract void create(BaseDomainObj obj) throws CannotConnectToDBException,SQLException;
	
	/**
	 * �����ݿ��в�ѯһ������
	 * @param sql
	 * @return
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public abstract List<BaseDomainObj> search(String sql) throws CannotConnectToDBException,SQLException;
	
	/**
	 * �ó�ִ��Sql��佫�õ��ļ�¼��Ŀ
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
	 * ����һ������
	 * @param obj
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public abstract void update(BaseDomainObj obj) throws CannotConnectToDBException,SQLException;
	
	/**
	 * ɾ��һ������
	 * @param obj
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public abstract void delete(BaseDomainObj obj) throws CannotConnectToDBException,SQLException;

}