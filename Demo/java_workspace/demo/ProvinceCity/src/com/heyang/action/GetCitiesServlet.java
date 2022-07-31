package com.heyang.action;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

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
import com.heyang.util.ReqUtil;

/**
 * ȡ��ʡ����ĳ��е�Servlet
 * @author baogy
 *
 * @since 2008-8-13 ����02:48:07
 * @version 1.00
 */
public class GetCitiesServlet extends BaseServlet {
	private static final long serialVersionUID = 56890894234786L;

	public void process(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, java.io.IOException, DuplicationNameException, CannotConnectToDBException, SQLException,  OneIdMultiRecordException, CannotFindRecordByIdException {
		// Setup Response 
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setCharacterEncoding("UTF-8");
		
		// ȡ���������
		String pid=ReqUtil.getDecodeParamFromReq("pid",request);
		
		// ȡ�ó���
		AreaService service=new AreaService();
		List<Area> cities=service.getCitiesBy(pid);
		request.setAttribute("cities", cities);
		
		PrintWriter out = response.getWriter();
		
		out.write("");
		
		
		out.println("<response>");
		out.println("<status>ok</status>");
		
		// ����
		for(Area city:cities){
			out.println("<area>");
			out.println("<id>" + city.getId() + "</id>");
			out.println("<pid>" + city.getPid() + "</pid>");
			out.println("<name>" + city.getName() + "</name>");
			out.println("</area>");
		}
		
		out.println("</response>");
	}
}
