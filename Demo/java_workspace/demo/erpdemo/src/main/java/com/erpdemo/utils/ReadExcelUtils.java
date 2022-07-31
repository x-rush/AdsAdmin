package com.erpdemo.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class ReadExcelUtils {

	private Logger logger = Logger.getLogger(ReadExcelUtils.class);

	private Workbook wb;

	private Sheet sheet;

	private Row row;
	
	private static String spliteStr = "#";
	

	public ReadExcelUtils(String filepath) {
		if (filepath == null) {
			return;
		}
		String ext = filepath.substring(filepath.lastIndexOf("."));
		try {
			InputStream is = new FileInputStream(filepath);
			if (".xls".equals(ext)) {
				wb = new HSSFWorkbook(is);
			} else if (".xlsx".equals(ext)) {
				wb = new XSSFWorkbook(is);
			} else {
				wb = null;
			}
		} catch (FileNotFoundException e) {
			logger.error("FileNotFoundException", e);
		} catch (IOException e) {
			logger.error("IOException", e);
		}
	}

	/**
	 * 读取Excel表格表头的内容
	 * 
	 * @param InputStream
	 * @return String 表头内容的数组
	 * @author
	 */
	public String[] readExcelTitle() throws Exception {
		if (wb == null) {
			throw new Exception("Workbook对象为空！");
		}
		sheet = wb.getSheetAt(0);
		row = sheet.getRow(0);
		// 标题总列数
		int colNum = row.getPhysicalNumberOfCells();
		System.out.println("colNum:" + colNum);
		String[] title = new String[colNum];
		for (int i = 0; i < colNum; i++) {
			// title[i] = getStringCellValue(row.getCell((short) i));
			title[i] = row.getCell(i).getCellFormula();
		}
		return title;
	}

	/**
	 * 读取Excel数据内容 
	 * 无参数 默认读取一个sheet页
	 * 从第二行开始读取
	 * @return
	 * @throws Exception
	 */
	public Map<Integer, Map<Integer, Object>> readExcelContent()
			throws Exception {
		return readExcelContent(0,1);
	}

	/**
	 * 读取Excel数据内容
	 *           
	 * @param sheetindex  按照下标读取sheet页 第一个为0
	 * @param rowindex 默认从sheet页的第二行开始读取 下标为1
	 * @return Map 包含单元格数据内容的Map对象
	 * @throws Exception
	 */
	public Map<Integer, Map<Integer, Object>> readExcelContent(int sheetindex,int rowindex)
			throws Exception {
		if (wb == null) {
			throw new Exception("Workbook对象为空！");
		}
		Map<Integer, Map<Integer, Object>> content = new HashMap<Integer, Map<Integer, Object>>();

		sheet = wb.getSheetAt(sheetindex);
		// 得到总行数
		int rowNum = sheet.getLastRowNum();
		row = sheet.getRow(0);
		int colNum = row.getPhysicalNumberOfCells();
		// 正文内容应该从第二行开始,第一行为表头的标题
		for (int i = rowindex; i <= rowNum; i++) {
			row = sheet.getRow(i);
			int j = 0;
			Map<Integer, Object> cellValue = new HashMap<Integer, Object>();
			while (j < colNum) {
				Object obj = getCellFormatValue(row.getCell(j));
				cellValue.put(j, obj);
				j++;
			}
			content.put(i, cellValue);
		}
		return content;
	}

	/**
	 * 
	 * 根据Cell类型设置数据
	 * 
	 * @param cell
	 * @return
	 * @author
	 */
	private Object getCellFormatValue(Cell cell) {
		Object cellvalue = "";
		if (cell != null) {
			// 判断当前Cell的Type
			switch (cell.getCellType()) {
			case Cell.CELL_TYPE_NUMERIC:// 如果当前Cell的Type为NUMERIC
			case Cell.CELL_TYPE_FORMULA: {
				// 判断当前的cell是否为Date
				if (DateUtils.isCellDateFormatted(cell)) {
					// 如果是Date类型则，转化为Data格式
					// data格式是带时分秒的：2013-7-10 0:00:00
					// cellvalue = cell.getDateCellValue().toLocaleString();
					// data格式是不带带时分秒的：2013-7-10
					Date date = cell.getDateCellValue();
					cellvalue = date;
				} else {// 如果是纯数字

					// 取得当前Cell的数值
					cellvalue = String.valueOf(cell.getNumericCellValue());
				}
				break;
			}
			case Cell.CELL_TYPE_STRING:// 如果当前Cell的Type为STRING
				// 取得当前的Cell字符串
				cellvalue = cell.getRichStringCellValue().getString();
				break;
			default:// 默认的Cell值
				cellvalue = "";
			}
		} else {
			cellvalue = "";
		}
		return cellvalue;
	}

	
	public static Map<String,Integer> check(Map<Integer, Map<Integer, Object>> map){
		
		Map<String,Integer> map_check = new HashMap<String,Integer>();
		
		for(Integer key : map.keySet()){
			
			Map<Integer, Object> map_temp = map.get(key);
			
			// 名称为重复交验的关键列
			
			String value = (String)map_temp.get(3);
			
//			String value06 = (String)map_temp.get(6);
			
//			String str = value03 + spliteStr + value06;
			
			if(map_check.containsKey(value)){
				
				int count = map_check.get(value);
				
				count = count + 1;
				
				map_check.put(value, count);
			}
			else{
				map_check.put(value, 1);
			}
		}
		
		return map_check;
	}
	
	
	public static Map<String,Integer> checkFromDB(Map<Integer, Map<Integer, Object>> map,Map<String,Object> map_db){
		
		for(Integer key : map.keySet()){
			
			Map<Integer, Object> map_temp = map.get(key);
			
			// 名称为重复交验的关键列
			
			String value = (String)map_temp.get(3);
			
			if(map_db.containsKey(value)){
				
				// 保留 已重复的数据
				
			}
			
		}
		
		return null;
	}
	
	
	
	public static void main(String[] args) {

		try {
			String filepath = "C:/test.xls";
			ReadExcelUtils excelReader = new ReadExcelUtils(filepath);

			// 对读取Excel表格内容测试
			Map<Integer, Map<Integer, Object>> map = excelReader
					.readExcelContent();

			System.out.println("获得Excel表格的内容:");

			for (int i = 1; i <= map.size(); i++) {
				System.out.println(map.get(i));
			}
			
			// 文件内去除重复数据
			Map<String,Integer> map_check = check(map);
			
			
			
			// 数据库中去重
			checkFromDB(map,null);
			
			
			
			
			

		} catch (FileNotFoundException e) {
			System.out.println("未找到指定路径的文件!");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
