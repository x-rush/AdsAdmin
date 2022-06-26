package com.heyang.service.base;

import java.sql.SQLException;
import java.util.List;

import com.heyang.dao.base.BaseDao;
import com.heyang.domain.base.BaseDomainObj;
import com.heyang.exception.database.CannotConnectToDBException;
import com.heyang.exception.database.CannotFindRecordByIdException;
import com.heyang.exception.database.OneIdMultiRecordException;

/**
 * 服务层诸类基类
 * @author baogy
 *
 * @since 2008-8-15 下午12:53:11
 * @version 1.00
 */
public abstract class BaseService{
	/**
	 * 数据存取对象类
	 */
	protected BaseDao dao;
	
	/**
	 * 领域对象对应的表
	 */
	protected String table;
	
	/**
	 * 按ID取得实例
	 * @return
	 */
	public final BaseDomainObj getById(String id) throws CannotConnectToDBException,SQLException,OneIdMultiRecordException,CannotFindRecordByIdException{
		String sql="select * from "+table+" where id='"+id+"'";
		
		List<BaseDomainObj> objs=search(sql);
		
		if(objs.size()>1){
			// 数量大于一，抛出多用户异常
			throw new OneIdMultiRecordException("ID"+id+"对应了数据库中的多个记录");
		}
		else if(objs.size()==1){
			return objs.get(0);
		}
		else{
			// 找不到用户
			throw new CannotFindRecordByIdException("找不到id为"+id+"的记录");
		}	
	}
	
	
	/**
	 * 按coreSql取得分页记录
	 * @param start
	 * @param end
	 * @param coreSql
	 * @return
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	protected final List<BaseDomainObj> fetchPageRecords(int start,int end,String coreSql) throws CannotConnectToDBException,SQLException{
		StringBuffer sb=new StringBuffer();
		
		// 下面是Oracle的分页
		/*sb.append(" Select                              ");
		sb.append("        *                            ");
		sb.append(" from                                ");
		sb.append("        (                            ");
		sb.append("         Select                      ");
		sb.append("                t01.*,               ");
		sb.append("                rownum as newRowNum  ");
		sb.append("         from                        ");
		sb.append("                (                    ");
		sb.append(coreSql);
		sb.append("                ) t01                ");
		sb.append("         where                       ");
		sb.append("                rownum<='"+end+"'    ");
		sb.append("        )                            ");
		sb.append(" where                               ");
		sb.append("        newRowNum>'"+start+"'        ");*/
		
		// 下面是MySql的分页
		sb.append(coreSql+" limit "+start+","+end);
		
		String sql=sb.toString();		
		return search(sql);
	}
	
	/**
	 * 从数据库删除一个记录
	 * @param id
	 * @return
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 * @throws OneIdMultiRecordException
	 * @throws CannotFindRecordByIdException
	 */
	public final boolean delete(String id) throws CannotConnectToDBException,SQLException,OneIdMultiRecordException,CannotFindRecordByIdException{
		BaseDomainObj obj=getById(id);		
		return delete(obj);
	}
	
	/**
	 * 从数据库删除一个记录
	 * @param obj
	 * @return
	 */
	public final boolean delete(BaseDomainObj obj) throws CannotConnectToDBException,SQLException{
		if(hasId(obj.getId())){
			dao.delete(obj);
			return true;
		}
		else{
			return false;
		}
	}

	/**
	 * 更新一个记录到数据库
	 * @param obj
	 * @return
	 */
	public final boolean update(BaseDomainObj obj) throws CannotConnectToDBException,SQLException{
		if(hasId(obj.getId())){
			dao.update(obj);
			return true;
		}
		else{
			return false;
		}	
	}
	
	/**
	 * 添加一个记录到数据库
	 * @param obj
	 * @return
	 */
	public boolean create(BaseDomainObj obj) throws CannotConnectToDBException,SQLException{
		if(hasId(obj.getId())){
			return false;
		}
		else{
			dao.create(obj);
			return true;
		}		
	}	
	
	/**
	 * 判断Id对应的记录是否存在
	 * @return
	 */
	public final boolean hasId(long id) throws CannotConnectToDBException,SQLException{
		return hasId(String.valueOf(id));
	}
	
	
	/**
	 * 判断Id对应的记录是否存在
	 * @return
	 */
	public final boolean hasId(String id) throws CannotConnectToDBException,SQLException{
		String sql="select * from "+table+" where id='"+id+"'";
		return dao.getRecordCount(sql)>0;
	}
	
	/**
	 * 得到表中现有记录个数
	 * @return
	 */
	public int getCount() throws CannotConnectToDBException,SQLException{
		String sql="select * from "+table;
		return dao.getRecordCount(sql);
	}
	
	/**
	 * 对表进行查询
	 * @param sql
	 * @return
	 */
	public List<BaseDomainObj> search(String sql) throws CannotConnectToDBException,SQLException{
		return dao.search(sql);
	}	
	
	public BaseDao getDao() {
		return dao;
	}

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}	
}