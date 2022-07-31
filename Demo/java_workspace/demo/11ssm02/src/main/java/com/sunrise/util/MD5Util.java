package com.sunrise.util;

import java.security.MessageDigest;

public class MD5Util {
	public static void main(String[] args) {
		String pwd = MD5Util.getMD5("123");
		System.out.println(pwd);
	}

	//生成MD5
	public static String getMD5(String message) {
		String md5 = "";
		//创建一个md5算法对象
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageByte = message.getBytes("UTF-8");
			byte[] md5Byte = md.digest(messageByte);
			md5 = bytesToHex(md5Byte);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return md5;
	}
	//二进制转十六进制
	private static String bytesToHex(byte[] md5Byte) {
		StringBuffer hexStr = new StringBuffer();
		int num;
		for(int i=0;i<md5Byte.length;i++) {
			num = md5Byte[i];
			if(num<0) {
				num+=256;
			}
			if(num<16) {
				hexStr.append("0");
			}
			hexStr.append(Integer.toHexString(num));
		}
		return hexStr.toString().toUpperCase();
	}
	
}
