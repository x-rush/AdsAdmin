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
 * ����ʵ��ҵ�����Servlet�Ļ���
 * @author baogy
 *
 * @since 2008-8-15 ����10:31:48
 * @version 1.00
 */
public abstract class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 32432434327L;
	
	private static Logger logger = Logger.getLogger(BaseServlet.class
			.toString());
	
	/**
	 * ��Session���ҳ���¼�û�
	 * @param request
	 * @return
	 * @throws CannotFindUserInSessionException
	 */
	/*protected User getUser(HttpServletRequest request) throws CannotFindUserInSessionException{
		// ��Session��ȡ���û�
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			throw new CannotFindUserInSessionException("��session���Ҳ����û�");
		}
		
		return user;
	}*/

	/**
	 * post�������������ɶ���һ��ģ�巽��
	 * ������ģ�巽��ģʽ��һ��Ӧ��
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		request.setCharacterEncoding("UTF-8");
		
		try{
			// ҵ����������
			process(request, response);
		}
		catch(CannotConnectToDBException ex){
			request.setAttribute("title", "�޷����ӵ����ݿ�");
			request.setAttribute("concept", "�޷����ӵ����ݿ⣬��鿴һ����������.");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
			dispatcher.forward(request, response);
			return;
        }
        catch(SQLException ex){
			request.setAttribute("title", "Sql���ִ��ʧ��");
			request.setAttribute("concept", "Sql���ִ��ʧ��,������ϢΪ��"+ex.getMessage());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
			dispatcher.forward(request, response);
			return;
        }
        catch(CannotFindUserInSessionException ex){
			request.setAttribute("title", "���ӳ�ʱ");
			request.setAttribute("concept", "���ӳ�ʱ,�����µ�¼.");
        	
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
    		dispatcher.forward(request, response);
    		return;
        }
        catch(OneIdMultiRecordException ex){
        	// ϵͳ�����ش����⣬һ���û�����Ӧ�Ŷ�����¼
        	request.setAttribute("title", "ϵͳ�����ش�����");
			request.setAttribute("concept", "���ݿ�ϵͳ�����ش����⣬����ԭ��Ϊ:"+ex.getMessage());
        	
        	logger.info("ϵͳ�����ش����⣬һ���û�����Ӧ�Ŷ�����¼������Resultҳ��");
        	
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
    		dispatcher.forward(request, response);
    		return;
        }        
        catch(DuplicationNameException ex){
        	// �Ҳ���ID��Ӧ�ļ�¼
        	request.setAttribute("title", "�û����ظ�");
			request.setAttribute("concept", "�û����ظ�������ԭ��Ϊ:"+ex.getMessage()+"�������һ���û������ٳ���");
        	
        	logger.info("ϵͳ�����ش����⣬�Ҳ���ID��Ӧ�ļ�¼������Resultҳ��");
        	
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
    		dispatcher.forward(request, response);
    		return;
        } 
        catch(CannotFindRecordByIdException ex){
        	// �Ҳ���ID��Ӧ�ļ�¼
        	request.setAttribute("title", "���ݿ�ϵͳ�Ҳ���ID��Ӧ�ļ�¼");
			request.setAttribute("concept", "���ݿ�ϵͳ�����ش����⣬����ԭ��Ϊ:"+ex.getMessage());
        	
        	logger.info("ϵͳ�����ش����⣬�Ҳ���ID��Ӧ�ļ�¼������Resultҳ��");
        	
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/result.jsp");
    		dispatcher.forward(request, response);
    		return;
        } 
	}
	
	/**
	 * ����ҵ��������Ĺ�����������������
	 * @throws CannotConnectToDBException
	 * @throws SQLException
	 */
	public abstract void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException ,DuplicationNameException,CannotConnectToDBException,SQLException,OneIdMultiRecordException,CannotFindRecordByIdException,CannotFindUserInSessionException,OneIdMultiRecordException;

	/**
	 * ��get������doPost����
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		doPost(request, response);
	}
}
