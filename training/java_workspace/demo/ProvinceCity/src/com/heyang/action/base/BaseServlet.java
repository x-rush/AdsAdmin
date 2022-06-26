package com.heyang.action.base;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.heyang.exception.database.CannotConnectToDBException;
import com.heyang.exception.database.CannotFindRecordByIdException;
import com.heyang.exception.database.OneIdMultiRecordException;
import com.heyang.exception.family.CannotFindUserInSessionException;
import com.heyang.exception.family.DuplicationNameException;

/**
 * 各个实际业务处理的Servlet的基类
 * @author baogy
 *
 * @since 2008-8-15 下午10:31:48
 * @version 1.00
 */
public abstract class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 32432434327L;
	
	private static Logger logger = Logger.getLogger(BaseServlet.class
			.toString());
	
	/**
	 * 从Session中找出登录用户
	 * @param request
	 * @return
	 * @throws CannotFindUserInSessionException
	 */
	/*protected User getUser(HttpServletRequest request) throws CannotFindUserInSessionException{
		// 从Session中取得用户
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			throw new CannotFindUserInSessionException("在session中找不到用户");
		}
		
		return user;
	}*/

	/**
	 * post请求处理，其中做成而来一个模板方法
	 * 这里是模板方法模式的一次应用
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		request.setCharacterEncoding("UTF-8");
		
		try{
			// 业务处理都在这里
			process(request, response);
		}
		catch(CannotConnectToDBException ex){
			request.setAttribute("title", "无法连接到数据库");
			request.setAttribute("concept", "无法连接到数据库，请查看一下网络配置.");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
			dispatcher.forward(request, response);
			return;
        }
        catch(SQLException ex){
			request.setAttribute("title", "Sql语句执行失败");
			request.setAttribute("concept", "Sql语句执行失败,具体信息为："+ex.getMessage());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
			dispatcher.forward(request, response);
			return;
        }
        catch(CannotFindUserInSessionException ex){
			request.setAttribute("title", "连接超时");
			request.setAttribute("concept", "连接超时,请重新登录.");
        	
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
    		dispatcher.forward(request, response);
    		return;
        }
        catch(OneIdMultiRecordException ex){
        	// 系统发生重大问题，一个用户名对应着多条记录
        	request.setAttribute("title", "系统发生重大问题");
			request.setAttribute("concept", "数据库系统发生重大问题，错误原因为:"+ex.getMessage());
        	
        	logger.info("系统发生重大问题，一个用户名对应着多条记录，进入Result页面");
        	
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
    		dispatcher.forward(request, response);
    		return;
        }        
        catch(DuplicationNameException ex){
        	// 找不到ID对应的记录
        	request.setAttribute("title", "用户名重复");
			request.setAttribute("concept", "用户名重复，错误原因为:"+ex.getMessage()+"，请更换一个用户名后再尝试");
        	
        	logger.info("系统发生重大问题，找不到ID对应的记录，进入Result页面");
        	
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
    		dispatcher.forward(request, response);
    		return;
        } 
        catch(CannotFindRecordByIdException ex){
        	// 找不到ID对应的记录
        	request.setAttribute("title", "数据库系统找不到ID对应的记录");
			request.setAttribute("concept", "数据库系统发生重大问题，错误原因为:"+ex.getMessage());
        	
        	logger.info("系统发生重大问题，找不到ID对应的记录，进入Result页面");
        	
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
    		dispatcher.forward(request, response);
    		return;
        } 
	}
	
	/**
	 * 进行业务处理，子类的工作就是完成这个函数
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public abstract void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException ,DuplicationNameException,CannotConnectToDBException,SQLException,OneIdMultiRecordException,CannotFindRecordByIdException,CannotFindUserInSessionException,OneIdMultiRecordException;

	/**
	 * 让get请求都让doPost处理
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		doPost(request, response);
	}
}
