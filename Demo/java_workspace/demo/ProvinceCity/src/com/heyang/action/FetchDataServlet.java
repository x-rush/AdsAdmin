package com.heyang.action;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.heyang.action.base.BaseServlet;
import com.heyang.domain.Area;
import com.heyang.exception.database.CannotConnectToDBException;
import com.heyang.exception.database.CannotFindRecordByIdException;
import com.heyang.exception.database.OneIdMultiRecordException;
import com.heyang.exception.family.DuplicationNameException;
import com.heyang.service.AreaService;

/**
 * 用于取得省市信息的Servlet
 * @author baogy
 *
 * @since 2008-8-13 下午02:48:07
 * @version 1.00
 */
public class FetchDataServlet extends BaseServlet {
	private static final long serialVersionUID = 56890894234786L;

	public void process(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, java.io.IOException, DuplicationNameException, CannotConnectToDBException, SQLException,  OneIdMultiRecordException, CannotFindRecordByIdException {
		response.setCharacterEncoding("UTF-8");
		
		AreaService service=new AreaService();
		
		// 取得省信息
		List<Area> provinces=service.getProvinces();
		request.setAttribute("provinces", provinces);
		
		// 取得第一个省下的市信息
		List<Area> cities=service.getCitiesBy(provinces.get(0).getId());
		request.setAttribute("cities", cities);
			
		// 转向ShowTodoesServlet
		RequestDispatcher dispatcher = request.getRequestDispatcher("/web/page/login.jsp");
		dispatcher.forward(request, response);
		return;
	}
}
