package com.keyan.util;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class SimpleExcelReport {@SuppressWarnings({ "deprecation", "unchecked" })
	public boolean excelReportLab(String filePath, ArrayList<Map<String, Object>> list){
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet; 
		HSSFRow row;
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		//int doubleIndex[] = {9, 5, 6, 8, 10, 7, 1};
		HSSFDataFormat format = wb.createDataFormat();
		//style.setDataFormat(format.getFormat("0.00000"));
		HSSFCell cell;  
		int n = 0;
		for (Map<String, Object> map:list) {
			sheet = wb.createSheet((String) map.get("sheet"));
			ArrayList<ArrayList<String>> listContent = 
				(ArrayList<ArrayList<String>>) map.get("content");
			for (int i = 0; i < listContent.size(); i++) {
				row = sheet.createRow(i);
				ArrayList<String> rowCurrent = listContent.get(i);
				for (int j = 0; j < rowCurrent.size(); j++) {
					cell = row.createCell((short) j);
					String value = rowCurrent.get(j);
					style = wb.createCellStyle();
					if (NumberTool.isNum(value)) {
						float valueF = Float.parseFloat(value);
						if (valueF < 1000) {
							if (valueF == 0) {
								style.setDataFormat(format.getFormat("0"));
							} else {
								style.setDataFormat(format.getFormat("0.0000"));
							}
							cell.setCellType(cell.CELL_TYPE_NUMERIC);
							cell.setCellValue((Double.parseDouble(value)));
						} else {
							cell.setCellType(cell.CELL_TYPE_STRING);
							cell.setCellValue(value);
						}
					} else {
						cell.setCellType(cell.CELL_TYPE_STRING);
						cell.setCellValue(value);
					}
					/*
					if (j >= doubleIndex[n] && i > 0) {
						style.setDataFormat(format.getFormat("0.0000"));
						cell.setCellValue((Double.parseDouble(value)));
					} else {
					    cell.setCellValue(value);
					}*/
					/*
					if (NumberTool.isNum(value)) {
						if (Float.parseFloat(value) != 0f) {
							cell.setCellType(Cell.CELL_TYPE_NUMERIC);
							cell.setCellValue((Double.parseDouble(value)));
						} else {
						}
					} else {
						cell.setCellType(Cell.CELL_TYPE_STRING);
						cell.setCellValue(value);
					}
					*/
					cell.setCellStyle(style);
				}
			}
			n++;
		}
		try {
			FileOutputStream fout = new FileOutputStream(filePath);
			wb.write(fout);
			fout.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
    @SuppressWarnings({ "deprecation", "static-access" })
	public boolean generalExcel(String filePath, ArrayList<ArrayList<String>> list){
		HSSFWorkbook wb = new HSSFWorkbook(); // 第一步，创建一个webbook，对应一个Excel文件
		HSSFSheet sheet = wb.createSheet("sheet1"); // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
		HSSFRow row = sheet.createRow((int) 0); // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short	
		HSSFCellStyle style = wb.createCellStyle(); // 第四步，创建单元格，并设置值表头 设置表头居中
		//style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
		//HSSFDataFormat format = wb.createDataFormat();
		//style.setDataFormat(format.getFormat("0.00000"));
		HSSFCell cell; 
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i);
			ArrayList<String> rowCurrent = list.get(i);
			for (int j = 0; j < rowCurrent.size(); j++) {
				cell = row.createCell((short) j);
				String value = rowCurrent.get(j);
				//cell.setCellValue(value);
				if (NumberTool.isNum(value)) {
					cell.setCellType(cell.CELL_TYPE_NUMERIC);
					cell.setCellValue((Double.parseDouble(value)));
				} else {
					cell.setCellType(cell.CELL_TYPE_STRING);
					cell.setCellValue(value);
				}
				cell.setCellStyle(style);
			}
		}
		try {
			FileOutputStream fout = new FileOutputStream(filePath);
			wb.write(fout);
			fout.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    }
    @SuppressWarnings({ "deprecation", "unchecked" })
	public boolean excelReportAll2(String filePath, ArrayList<Map<String, Object>> list){
		HSSFWorkbook wb = new HSSFWorkbook(); // 第一步，创建一个webbook，对应一个Excel文件
		HSSFSheet sheet = wb.createSheet("sheet1"); // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
		HSSFRow row = sheet.createRow((int) 0); // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short	
		HSSFCellStyle style = wb.createCellStyle(); // 第四步，创建单元格，并设置值表头 设置表头居中
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
		HSSFDataFormat format = wb.createDataFormat();
		style.setDataFormat(format.getFormat("0.00000"));
		HSSFCell cell; 
		cell = row.createCell((short) 0);
		cell.setCellValue("姓名");
		cell.setCellStyle(style);
		cell = row.createCell((short) 1);
		cell.setCellValue("论文奖励");
		cell.setCellStyle(style);
		cell = row.createCell((short) 2);
		cell.setCellValue("项目奖励");
		cell.setCellStyle(style);
		cell = row.createCell((short) 3);
		cell.setCellValue("著作奖励");
		cell.setCellStyle(style);
		cell = row.createCell((short) 4);
		cell.setCellValue("奖项奖励");
		cell.setCellStyle(style);
		cell = row.createCell((short) 5);
		cell.setCellValue("专利奖励");
		cell.setCellStyle(style);
		cell = row.createCell((short) 6);
		cell.setCellValue("软件著作权奖励");
		cell.setCellStyle(style);
		cell = row.createCell((short) 7);
		cell.setCellValue("备注");
		cell.setCellStyle(style);
		cell = row.createCell((short) 8);
		cell.setCellValue("A值总计");
		cell.setCellStyle(style);
		cell = row.createCell((short) 9);
		cell.setCellValue("人民币(元)");
		cell.setCellStyle(style);
		cell = row.createCell((short) 10);
		cell.setCellValue("实验室A值总计");
		cell.setCellStyle(style);
		cell = row.createCell((short) 11);
		cell.setCellValue("实验室人民币（元）总计");
		cell.setCellStyle(style);
		cell = row.createCell((short) 12);
		cell.setCellValue("实验室");
		cell.setCellStyle(style);
		
		int rowIndex = 1;
		int rmbRatio = 1000;
		int i;
		for (i = 0; i < list.size() - 1; i++) { // 最后一个对象是总计
			Map<String, Object> map = list.get(i);
			ArrayList<Map<String, String>> userList = (ArrayList<Map<String, String>>) map.get("users");
			Map<String, String> labInfo = (Map<String, String>) map.get("labInfo");
			for (Map<String, String> user: userList) {
				row = sheet.createRow((int) rowIndex);
				row.createCell((short) 0).setCellValue(user.get("name"));
				cell = row.createCell((short) 1);
				cell.setCellType(cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(Double.parseDouble(user.get("a1")));
				cell = row.createCell((short) 2);
				cell.setCellType(cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(Double.parseDouble(user.get("a2")));
				cell = row.createCell((short) 3);
				cell.setCellType(cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(Double.parseDouble(user.get("a3")));
				cell = row.createCell((short) 4);
				cell.setCellType(cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(Double.parseDouble(user.get("a4")));
				cell = row.createCell((short) 5);
				cell.setCellType(cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(Double.parseDouble(user.get("a5")));
				cell = row.createCell((short) 6);
				cell.setCellType(cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(Double.parseDouble(user.get("a6")));

				cell = row.createCell((short) 8);
				cell.setCellType(cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(Double.parseDouble(user.get("a_total")));
				cell = row.createCell((short) 9);
				cell.setCellType(cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(rmbRatio * Double.parseDouble(user.get("a_total")));
				rowIndex++;
			}
			if (userList.size() > 0) {
				cell = row.createCell((short) 10);
				cell.setCellType(cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(Double.parseDouble(labInfo.get("a_total")));
				cell = row.createCell((short) 11);
				cell.setCellType(cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(rmbRatio * Double.parseDouble(labInfo.get("a_total")));
				cell = row.createCell((short) 12);
				cell.setCellValue(labInfo.get("name"));
			}
		}
		Map<String, Object> map = list.get(i);
		row = sheet.createRow((int) rowIndex);
		cell = row.createCell((short) 0);
		cell.setCellValue("合计");
		cell = row.createCell((short) 1);
		cell.setCellType(cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(Double.parseDouble((String) map.get("a1")));
		cell = row.createCell((short) 2);
		cell.setCellType(cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(Double.parseDouble((String) map.get("a2")));
		cell = row.createCell((short) 3);
		cell.setCellType(cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(Double.parseDouble((String) map.get("a3")));
		cell = row.createCell((short) 4);
		cell.setCellType(cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(Double.parseDouble((String) map.get("a4")));
		cell = row.createCell((short) 5);
		cell.setCellType(cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(Double.parseDouble((String) map.get("a5")));
		cell = row.createCell((short) 6);
		cell.setCellType(cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(Double.parseDouble((String) map.get("a6")));
		cell = row.createCell((short) 8);
		cell.setCellType(cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(Double.parseDouble((String) map.get("a_total")));
		cell = row.createCell((short) 9);
		cell.setCellType(cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(rmbRatio * Double.parseDouble((String) map.get("a_total")));
		cell = row.createCell((short) 10);
		cell.setCellType(cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(Double.parseDouble((String) map.get("a_total")));
		cell = row.createCell((short) 11);
		cell.setCellType(cell.CELL_TYPE_NUMERIC);
		cell.setCellValue(rmbRatio * Double.parseDouble((String) map.get("a_total")));

		try {
			FileOutputStream fout = new FileOutputStream(filePath);
			wb.write(fout);
			fout.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
    }
    
}
