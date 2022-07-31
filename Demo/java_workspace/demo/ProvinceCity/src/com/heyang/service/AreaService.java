package com.heyang.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.heyang.dao.AreaDao;
import com.heyang.domain.Area;
import com.heyang.domain.base.BaseDomainObj;
import com.heyang.exception.database.CannotConnectToDBException;
import com.heyang.service.base.BaseService;

/**
 * ����Todoҵ����ķ�����
 * @author baogy
 *
 * @since 2008-10-16 ����10:43:28
 * @version 1.00
 */
public class AreaService extends BaseService{
	public AreaService(){
		dao=new AreaDao();
		table="provincecity";
	}	
	
	/**
	 * ȡ��ʡ
	 * @return
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public List<Area> getProvinces() throws CannotConnectToDBException, SQLException{
		StringBuffer sb=new StringBuffer();
		
		sb.append(" select * from "+table);
		sb.append(" where ");
		sb.append("   pid='0'  ");
		
		List<BaseDomainObj> records=dao.search(sb.toString());
		
		List<Area> retval=new ArrayList<Area>();
		for(BaseDomainObj obj:records){
			retval.add((Area)obj);
		}
		
		return retval;
	}
	
	/**
	 * ȡ��ĳʡ�������
	 * @param pid
	 * @return
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public List<Area> getCitiesBy(String pid) throws CannotConnectToDBException, SQLException{
		StringBuffer sb=new StringBuffer();
		
		sb.append(" select * from "+table);
		sb.append(" where ");
		sb.append("   pid='"+pid+"' ");
		
		List<BaseDomainObj> records=dao.search(sb.toString());
		
		List<Area> retval=new ArrayList<Area>();
		for(BaseDomainObj obj:records){
			retval.add((Area)obj);
		}
		
		return retval;
	}
}