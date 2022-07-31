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
 * TodoDao类
 * @author baogy
 *
 * @since 2008-10-10 上午09:59:06
 * @version 1.00
 */
public class AreaDao extends BaseDao{
	private static Logger logger = Logger.getLogger(AreaDao.class);
	
	public void create(BaseDomainObj obj) throws CannotConnectToDBException,SQLException{
		// 本例中用不到
	}
	
	public void update(BaseDomainObj obj) throws CannotConnectToDBException,SQLException{
		// 本例中用不到
	}

	public void delete(BaseDomainObj obj) throws CannotConnectToDBException,SQLException{
		// 本例中用不到
	}
	
	/**
	 * 查询
	 * @param sql
	 * @return
	 */
	public List<BaseDomainObj> search(String sql) throws CannotConnectToDBException,SQLException{
		List<BaseDomainObj> ls=new ArrayList<BaseDomainObj>();
		ResultSet rs=null;
		
		try{
			conn=getConnection();
			logger.info("将执行的SQL语句为"+sql);
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
			logger.error("无法连接到数据库,请检查驱动类,url,user,pswd四项是否被正确设置了");
			throw ex;
		}
		catch(SQLException se){
			try{
				logger.error("执行 SQl语句:"+sql+"发生异常");
				conn.rollback();
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
			
			throw new SQLException("执行 SQl语句:"+sql+"发生异常,原因是"+se.getMessage());
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