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
 * 用于初始化系统配置的Servlet
 * @author baogy
 *
 * @since 2008-8-15 上午11:24:41
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
		// 执行一次即可，如果系统重启请取消
		createTables();
	}

	/**
	 * 创建项目需要用到的表和基本数据
	 * 注意这里只要执行一次即可，如果系统重启请取消
	 */
	protected void createTables() {
		Connection conn = null;
		Statement stmt = null;
		String sql = "";

		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();

			// 设置不自动提交
			conn.setAutoCommit(false);

			// 建表
			logger.info("开始创建ProvinceCity表");
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
			logger.info("ProvinceCity表创建完毕");

			// 向表中添加数据
			logger.info("开始向ProvinceCity表添加数据");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '1', '0', '北京' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '11', '1', '海淀区' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '12', '1', '朝阳区' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '13', '1', '西城区' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '2', '0', '辽宁' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '21', '2', '沈阳' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '22', '2', '大连' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '23', '2', '鞍山' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '3', '0', '湖南' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '31', '3', '岳阳' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '32', '3', '长沙' )");
			stmt.executeUpdate("insert into provincecity ( id, pid, name ) values ( '33', '3', '衡阳' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '4', '0', '古代中国' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '41', '4', '长安' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '42', '4', '洛阳' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '43', '4', '大梁' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '44', '4', '金陵' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '45', '4', '幽州' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '46', '4', '邺城' )");
			stmt.executeUpdate(" insert into provincecity ( id, pid, name ) values ( '47', '4', '新郑' )");
			logger.info("向ProvinceCity表添加数据完毕");

			// 提交
			conn.commit();
		} catch (CannotConnectToDBException se) {
			try {
				logger.error("无法连接到数据库");
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		} catch (SQLException se) {
			try {
				logger.error("SQl异常，数据库回滚");
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		} catch (Exception e) {
			try {
				logger.error("异常" + e.getMessage() + "发生,数据库回滚");
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception ex) {
				logger.error("异常" + ex.getMessage() + "发生.");
				ex.printStackTrace();
			}
		}
	}
}
