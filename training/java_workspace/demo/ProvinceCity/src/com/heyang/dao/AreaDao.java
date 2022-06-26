package com.heyang.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.heyang.dao.base.BaseDao;
import com.heyang.domain.Area;
import com.heyang.domain.base.BaseDomainObj;
import com.heyang.exception.database.CannotConnectToDBException;

/**
 * TodoDao��
 * @author baogy
 *
 * @since 2008-10-10 ����09:59:06
 * @version 1.00
 */
public class AreaDao extends BaseDao{
	private static Logger logger = Logger.getLogger(AreaDao.class);
	
	public void create(BaseDomainObj obj) throws CannotConnectToDBException,SQLException{
		// �������ò���
	}
	
	public void update(BaseDomainObj obj) throws CannotConnectToDBException,SQLException{
		// �������ò���
	}

	public void delete(BaseDomainObj obj) throws CannotConnectToDBException,SQLException{
		// �������ò���
	}
	
	/**
	 * ��ѯ
	 * @param sql
	 * @return
	 */
	public List<BaseDomainObj> search(String sql) throws CannotConnectToDBException,SQLException{
		List<BaseDomainObj> ls=new ArrayList<BaseDomainObj>();
		ResultSet rs=null;
		
		try{
			conn=getConnection();
			logger.info("��ִ�е�SQL���Ϊ"+sql);
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();			
			
			while(rs.next()){
				Area area=new Area();

				area.setId(rs.getString("id"));
				area.setPid(rs.getString("pid"));
				area.setName(rs.getString("name"));
				
				ls.add(area);
			}
		}
		catch(CannotConnectToDBException ex){
			logger.error("�޷����ӵ����ݿ�,����������,url,user,pswd�����Ƿ���ȷ������");
			throw ex;
		}
		catch(SQLException se){
			try{
				logger.error("ִ�� SQl���:"+sql+"�����쳣");
				conn.rollback();
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
			
			throw new SQLException("ִ�� SQl���:"+sql+"�����쳣,ԭ����"+se.getMessage());
		}
		finally{
			try{
				rs.close();
				ps.close();
				conn.close();
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
		}
		
		return ls;
	}	
}