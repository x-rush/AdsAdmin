package com.heyang.util;

import javax.servlet.http.HttpServletRequest;

/**
 * ����Request��ش����ʵ�ù�����
 * @author baogy
 *
 * @since 2008-8-13 ����11:32:49
 * @version 1.00
 */
public final class ReqUtil{
	private ReqUtil(){
		
	}
	
	/**
	 * ��ҳ�����ȡ���ֶβ�ת��
	 * ����Jsp
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
	 * ��Ajax��ʽ�ύ��URL����ȡ������
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
			// �м���ISO-8859-1����
			byte[] b = retval.getBytes("8859_1");

			// ת����GB2312�ַ�
			retval = new String(b, "GB2312");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return retval;
	}
}