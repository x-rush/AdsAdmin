package com.heyang.action.initial;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.heyang.exception.database.CannotConnectToDBException;
import com.heyang.util.DBUtil;

/**
 * ���ڳ�ʼ��ϵͳ���õ�Servlet
 * @author baogy
 *
 * @since 2008-8-15 ����11:24:41
 * @version 1.00
 */
public class InitialSystemServlet extends HttpServlet {
	private static final long serialVersionUID = -7444606086930580188L;

	private static Logger logger = Logger.getLogger(InitialSystemServlet.class);

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		doPost(request, response);
	}

	public void init() throws ServletException {
		// ִ��һ�μ��ɣ����ϵͳ������ȡ��
		createTables();
	}

	/**
	 * ������Ŀ��Ҫ�õ��ı�ͻ�������
	 * ע������ֻҪִ��һ�μ��ɣ����ϵͳ������ȡ��
	 */
	protected void createTables() {
		Connection conn = null;
		Statement stmt = null;
		String sql = "";

		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();

			// ���ò��Զ��ύ
			conn.setAutoCommit(false);

			// ����
			logger.info("��ʼ����ProvinceCity��");
			stmt.executeUpdate("drop table if exists ProvinceCity");
			StringBuffer sb = new StringBuffer();
			sb.append("  ");
			sb.append(" create table ProvinceCity( ");
			sb.append("    id varchar(255) not null primary key, ");
			sb.append("    pid varchar(255),  ");
			sb.append("    name varchar(255)  ");
			sb.append(" )  ");
			sql = sb.toString();
			stmt.executeUpdate(sql);
			logger.info("ProvinceCity�������");

			// ������������
			logger.info("��ʼ��ProvinceCity���������");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '1', '0', '����' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '11', '1', '������' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '12', '1', '������' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '13', '1', '������' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '2', '0', '����' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '21', '2', '����' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '22', '2', '����' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '23', '2', '��ɽ' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '3', '0', '����' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '31', '3', '����' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '32', '3', '��ɳ' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '33', '3', '����' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '4', '0', '�Ŵ��й�' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '41', '4', '����' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '42', '4', '����' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '43', '4', '����' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '44', '4', '����' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '45', '4', '����' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '46', '4', '����' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '47', '4', '��֣' )");
			logger.info("��ProvinceCity������������");

			// �ύ
			conn.commit();
		} catch (CannotConnectToDBException se) {
			try {
				logger.error("�޷����ӵ����ݿ�");
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		} catch (SQLException se) {
			try {
				logger.error("SQl�쳣�����ݿ�ع�");
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		} catch (Exception e) {
			try {
				logger.error("�쳣" + e.getMessage() + "����,���ݿ�ع�");
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception ex) {
				logger.error("�쳣" + ex.getMessage() + "����.");
				ex.printStackTrace();
			}
		}
	}
}
