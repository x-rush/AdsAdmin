package com.heyang.util;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * 用于日期时间处理的工具类
 * @author sitinspring
 *
 */
public final class TimeUtil {
	private TimeUtil() {

	}
	
	/**
	 * 取得当前日期时间
	 */
	public static String getShortCurrDateTime() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		return formatter.format(date);
	}
	
	/**
	 * 取得当前日期时间
	 */
	public static String getCurrDateTime() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
		return formatter.format(date);
	}

 
	/**
	 * 取得当前日期
	 */
	public static String getCurrentDate() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy.MM.dd");
		return formatter.format(date);
	}
	
	/**
	 * 取得当前年度+月份
	 */
	public static String getCurrentYearMonth() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy.MM");
		return formatter.format(date);
	}
	
	/**
	 * 取得当前日期
	 */
	public static String getCurrDate() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy年MM月dd日");
		return formatter.format(date);
	}

	/**
	 * 取得当前时间
	 */
	public static String getCurrTime() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("HH时mm分ss秒");
		return formatter.format(date);
	}

	/**
	 * 取得当前年月
	 */
	public static String getCurrMonth() {
		Date date = new Date();
		Format formatter = new SimpleDateFormat("yyyy年MM月");
		return formatter.format(date);
	}

	/**
	 * 在年月的基础上加上或减去月份得到新年月
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
	 * 取得一个月中有多少天
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
	 * 取得每个月的第一天是周几
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