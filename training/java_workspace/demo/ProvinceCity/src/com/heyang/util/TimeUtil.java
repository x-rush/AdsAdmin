package com.heyang.util;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * ��������ʱ�䴦��Ĺ�����
 * @author sitinspring
 *
 */
public final class TimeUtil {
	private TimeUtil() {

	}
	
	/**
	 * ȡ�õ�ǰ����ʱ��
	 */
	public static String getShortCurrDateTime() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		return formatter.format(date);
	}
	
	/**
	 * ȡ�õ�ǰ����ʱ��
	 */
	public static String getCurrDateTime() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy��MM��dd��HHʱmm��ss��");
		return formatter.format(date);
	}

 
	/**
	 * ȡ�õ�ǰ����
	 */
	public static String getCurrentDate() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy.MM.dd");
		return formatter.format(date);
	}
	
	/**
	 * ȡ�õ�ǰ���+�·�
	 */
	public static String getCurrentYearMonth() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy.MM");
		return formatter.format(date);
	}
	
	/**
	 * ȡ�õ�ǰ����
	 */
	public static String getCurrDate() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy��MM��dd��");
		return formatter.format(date);
	}

	/**
	 * ȡ�õ�ǰʱ��
	 */
	public static String getCurrTime() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("HHʱmm��ss��");
		return formatter.format(date);
	}

	/**
	 * ȡ�õ�ǰ����
	 */
	public static String getCurrMonth() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy��MM��");
		return formatter.format(date);
	}

	/**
	 * �����µĻ����ϼ��ϻ��ȥ�·ݵõ�������
	 */
	@SuppressWarnings("deprecation")
	public static String getChangedDate(String strMonth,int monthCount) {
		SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy.MM");

		try {
			java.util.Date date = myFormatter.parse(strMonth);
			date.setMonth(date.getMonth()+monthCount);
						
			Format formatter = new SimpleDateFormat("yyyy.MM");
			return formatter.format(date);
		} catch (Exception ex) {
			return null;
		}
	}

	/**
	 * ȡ��һ�������ж�����
	 * 
	 * @param strMonth
	 * @return
	 */
	public static int getDaysInAMonth(String strMonth) {
		String[] arr=strMonth.split("[.]");
		Calendar cal = new GregorianCalendar(Integer.parseInt(arr[0]),Integer.parseInt(arr[1])-1, 1);
		int days = cal.getActualMaximum(Calendar.DAY_OF_MONTH); 
		return days;
	}
	
	/**
	 * ȡ��ÿ���µĵ�һ�����ܼ�
	 * @param strMonth
	 * @return
	 */
	public static int getWeekOfFirstDay(String strMonth){
		String[] arr=strMonth.split("[.]");
		
		Calendar xmas = new GregorianCalendar(Integer.parseInt(arr[0]),Integer.parseInt(arr[1])-1, 1);
	    int dayOfWeek = xmas.get(Calendar.DAY_OF_WEEK)-1;    
	    return dayOfWeek;
	}
}