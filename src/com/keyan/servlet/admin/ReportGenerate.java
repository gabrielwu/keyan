package com.keyan.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.keyan.javabean.AllCommon_javabean;
import com.keyan.javabean.Lab_javabean;
import com.keyan.javabean.Report_javabean;
import com.keyan.util.NumberTool;
import com.keyan.util.SimpleExcelReport;
import com.keyan.util.ZipCompressor;

public class ReportGenerate extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7422964375327751751L;

	/**
	 * Constructor of the object.
	 */
	public ReportGenerate() {
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
    	Date dt = new Date();   
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");  
        String dateStr = sdf.format(dt);
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String pass = request.getParameter("pass");
		String aRMBRatioS2 = request.getParameter("aRMBRatio");
		Map<String, String> cMap = new HashMap<String, String>();
		cMap.put("date1", date1);
		cMap.put("date2", date2);
		cMap.put("pass", pass);
		String filePath = this.getServletContext().getRealPath("/")+"download/";
		int type = Integer.parseInt(request.getParameter("type")); // 0:总表，1:实验室 ,2:所有实验室
		ServletContext application = request.getSession().getServletContext();
		String aRMBRatioS = (String)application.getAttribute("aRMBRatio");
		float aRMBRatio = Float.parseFloat(aRMBRatioS);
		if (!aRMBRatioS.equals(aRMBRatioS2)) {
			if (NumberTool.isNum(aRMBRatioS2)) {
				aRMBRatio = Float.parseFloat(aRMBRatioS2);
				application.setAttribute("aRMBRatioS", aRMBRatioS2);
				String column = "name";
				String key = "aRMBRatio";
				Map<String, String> data = new HashMap<String, String>();
				data.put("value", aRMBRatioS2);
				AllCommon_javabean jb = new AllCommon_javabean("r_conf");
				jb.modify(data, column, key);
			}
		}
		Report_javabean rjb = new Report_javabean(aRMBRatio);
		SimpleExcelReport ser = new SimpleExcelReport();
		boolean flag = false;
		String fileNameLast = "";
		Lab_javabean ljb = new Lab_javabean();
		switch (type) {
			case 0: // 汇总表
				fileNameLast = "汇总表"+dateStr+".xls";
				filePath += fileNameLast;
				ArrayList<ArrayList<String>> reportAll = rjb.getReportAll(cMap);
				flag = ser.generalExcel(filePath, reportAll);
				break;
			case 1: // 实验室明细
				String lab_id = request.getParameter("lab_id");
				String labName = ljb.getLabNameById(lab_id);
				fileNameLast = labName +dateStr+ ".xls";
				filePath += fileNameLast;
				ArrayList<Map<String, Object>> list = rjb.getReportLab(cMap, lab_id);
				flag = ser.excelReportLab(filePath, list);
				break;
			case 2:
				filePath += dateStr;
				File dir = new File(filePath);
				dir.mkdir();
				String labs = request.getParameter("labs");
				System.out.println(labs);
				String[] ids = labs.split(",");
				boolean flag2 = false;
				for (int i = 0; i < ids.length; i++) {
					rjb = new Report_javabean(aRMBRatio);
					String id = ids[i];
					String name = ljb.getLabNameById(id);
					String fileName = name+dateStr+".xls";
					ArrayList<Map<String, Object>> listLab = rjb.getReportLab(cMap, id);
					flag2 = ser.excelReportLab(filePath+"/"+fileName, listLab);
					if (!flag2) {
						break;
					}
				}
				if (flag2) {
					flag = true;
				}
				break;
		}
		UUID uuid = UUID.randomUUID();
		String downloadFile = "download/"+uuid.toString()+".zip";
		String zip = this.getServletContext().getRealPath("/")+downloadFile;
		ZipCompressor zipCompressor = new ZipCompressor(zip);
		zipCompressor.compress(filePath);
		if (flag) {
			out.print(downloadFile);
		} else {
			out.print("");
		}
        System.out.println(filePath);
		
		out.flush();
		out.close();
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
