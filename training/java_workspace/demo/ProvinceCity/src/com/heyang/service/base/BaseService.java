package com.heyang.service.base;

import java.sql.SQLException;
import java.util.List;

import com.heyang.dao.base.BaseDao;
import com.heyang.domain.base.BaseDomainObj;
import com.heyang.exception.database.CannotConnectToDBException;
import com.heyang.exception.database.CannotFindRecordByIdException;
import com.heyang.exception.database.OneIdMultiRecordException;

/**
 * ������������
 * @author baogy
 *
 * @since 2008-8-15 ����12:53:11
 * @version 1.00
 */
public abstract class BaseService{
	/**
	 * ���ݴ�ȡ������
	 */
	protected BaseDao dao;
	
	/**
	 * ��������Ӧ�ı�
	 */
	protected String table;
	
	/**
	 * ��IDȡ��ʵ��
	 * @return
	 */
	public final BaseDomainObj getById(String id) throws CannotConnectToDBException,SQLException,OneIdMultiRecordException,CannotFindRecordByIdException{
		String sql="select * from "+table+" where id='"+id+"'";
		
		List<BaseDomainObj> objs=search(sql);
		
		if(objs.size()>1){
			// ��������һ���׳����û��쳣
			throw new OneIdMultiRecordException("ID"+id+"��Ӧ�����ݿ��еĶ����¼");
		}
		else if(objs.size()==1){
			return objs.get(0);
		}
		else{
			// �Ҳ����û�
			throw new CannotFindRecordByIdException("�Ҳ���idΪ"+id+"�ļ�¼");
		}	
	}
	
	
	/**
	 * ��coreSqlȡ�÷�ҳ��¼
	 * @param start
	 * @param end
	 * @param coreSql
	 * @return
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	protected final List<BaseDomainObj> fetchPageRecords(int start,int end,String coreSql) throws CannotConnectToDBException,SQLException{
		StringBuffer sb=new StringBuffer();
		
		// ������Oracle�ķ�ҳ
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
		
		// ������MySql�ķ�ҳ
		sb.append(coreSql+" limit "+start+","+end);
		
		String sql=sb.toString();		
		return search(sql);
	}
	
	/**
	 * �����ݿ�ɾ��һ����¼
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
	 * �����ݿ�ɾ��һ����¼
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
	 * ����һ����¼�����ݿ�
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
	 * ���һ����¼�����ݿ�
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
	 * �ж�Id��Ӧ�ļ�¼�Ƿ����
	 * @return
	 */
	public final boolean hasId(long id) throws CannotConnectToDBException,SQLException{
		return hasId(String.valueOf(id));
	}
	
	
	/**
	 * �ж�Id��Ӧ�ļ�¼�Ƿ����
	 * @return
	 */
	public final boolean hasId(String id) throws CannotConnectToDBException,SQLException{
		String sql="select * from "+table+" where id='"+id+"'";
		return dao.getRecordCount(sql)>0;
	}
	
	/**
	 * �õ��������м�¼����
	 * @return
	 */
	public int getCount() throws CannotConnectToDBException,SQLException{
		String sql="select * from "+table;
		return dao.getRecordCount(sql);
	}
	
	/**
	 * �Ա���в�ѯ
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