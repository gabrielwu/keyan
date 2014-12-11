package com.keyan.servlet;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.keyan.dbUtil.DB;
import com.keyan.util.MD5Util;

public class UserImport extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3263135302748764207L;

	/**
	 * Constructor of the object.
	 */
	public UserImport() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@SuppressWarnings("deprecation")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try{
			String filePath = this.getServletContext().getRealPath("/")+"download/a.xls";
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(filePath));
			// 创建对工作表的引用。
			// 本例是按名引用（让我们假定那张表有着缺省名"Sheet1"）
			HSSFSheet sheet = workbook.getSheet("Sheet1");
			// 也可用getSheetAt(int index)按索引引用，
			// 在Excel文档中，第一张工作表的缺省索引是0，
			// 其语句为：HSSFSheet sheet = workbook.getSheetAt(0);
			// 读取左上端单元
			HSSFRow row = sheet.getRow(0);
			HSSFCell cell;
			DB db = new DB();
			for (int j = 1; j < sheet.getPhysicalNumberOfRows(); j++) {
				row = sheet.getRow(j);
				cell = row.getCell((short)0);
			    String username = String.valueOf(cell.getNumericCellValue()).substring(0, 6);
				cell = row.getCell((short)1);
			    String name = cell.getStringCellValue();
				cell = row.getCell((short)2);
			    String sex = cell.getStringCellValue();
			    String password = MD5Util.MD5(String.valueOf(username));
			    String sql = "insert into r_user(username, name, password,sex) values('"+username+"','"+name+"','"+password+"','"+sex+"')";
			    db.update(sql);
			}
			db.close();
		}catch(Exception e) {
			System.out.println("已运行xlRead() : " + e );
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
