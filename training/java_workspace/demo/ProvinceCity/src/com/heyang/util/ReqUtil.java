package com.heyang.util;

import javax.servlet.http.HttpServletRequest;

/**
 * 用于Request相关处理的实用工具类
 * @author baogy
 *
 * @since 2008-8-13 上午11:32:49
 * @version 1.00
 */
public final class ReqUtil{
	private ReqUtil(){
		
	}
	
	/**
	 * 从页面表单中取出字段并转码
	 * 用于Jsp
	 * @param paramName
	 * @param request
	 * @return
	 */
	public static String getFormParam(String paramName,HttpServletRequest request){
		try{
			
			return new String(request.getParameter(paramName).getBytes("ISO-8859-1"),"UTF-8");
		}
		catch(Exception ex){
			return null;
		}
	}
	
	/**
	 * 从Ajax方式提交的URL中提取出中文
	 * @param paramName
	 * @param request
	 * @return
	 */
	public static String getDecodeParamFromReq(String paramName,
			HttpServletRequest request) {
		String retval = request.getParameter(paramName);
		
		if(retval==null){
			return null;
		}
		
		try {
			// 中间用ISO-8859-1过渡
			byte[] b = retval.getBytes("8859_1");

			// 转换成GB2312字符
			retval = new String(b, "GB2312");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return retval;
	}
}