package com.keyan.servlet;

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
import javax.servlet.http.HttpSession;

import com.keyan.javabean.Achievement_javabean;
import com.keyan.javabean.Report_javabean;
import com.keyan.javabean.Software_javabean;
import com.keyan.tool.MapTool;
import com.keyan.util.SimpleExcelReport;
import com.keyan.util.ZipCompressor;

public class SoftwareExport extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4860262395584904587L;

	/**
	 * Constructor of the object.
	 */
	public SoftwareExport() {
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
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("login_id");
		// q: 1,管理员查看；0,自己自己查看(包括管理员自己的)；user_id的不同
		String q = request.getParameter("q");
		if (!session.getAttribute("login_type").equals("1")) { // 当前用户不是管理员，只能查看自己的，q=0
			q = "0";
		} 
		if (q.equals("1")) { // 管理员查看，sMap的user_id由前台输入获得，否则保持session中的值
			user_id = request.getParameter("s_user_id");
		}
		request.setAttribute("q", q);
        Map<String, String> sMap = new HashMap<String, String>();
        Map<String, String> sMapSpec = new HashMap<String, String>(); // 特殊处理
        Map<String, String> sMapRange = new HashMap<String, String>(); // 时间范围
        Map<String, String> sMapEq = new HashMap<String, String>(); // 等值
        sMap.put("title", request.getParameter("s_title"));
        sMap.put("link", request.getParameter("s_link"));
        sMap.put("number", request.getParameter("s_number"));
        sMap.put("press", request.getParameter("press"));
        
        sMapRange.put("date_pass", request.getParameter("s_date_pass"));
        sMapRange.put("date_pass_2", request.getParameter("s_date_pass_2"));
        sMapRange.put("date_commit", request.getParameter("s_date_commit"));
        sMapRange.put("date_commit_2", request.getParameter("s_date_commit_2"));
        sMapRange.put("date_publish", request.getParameter("s_date_publish"));
        sMapRange.put("date_publish_2", request.getParameter("s_date_publish_2"));
        sMapRange.put("date_authorized", request.getParameter("s_date_authorized"));
        sMapRange.put("date_authorized_2", request.getParameter("s_date_authorized_2"));

        sMapEq.put("pass", request.getParameter("s_pass"));
        sMapEq.put("lab_id", request.getParameter("s_lab_id"));
        sMapEq.put("user_id", user_id);
        sMapEq.put("leader_id", request.getParameter("s_leader_id"));
        sMapEq.put("type_id", request.getParameter("s_type_id"));
        sMapEq.put("type2013_id", request.getParameter("s_type2013_id"));
        sMapEq.put("a.a_value", request.getParameter("s_a_value"));
        sMapEq.put("isAwarded", request.getParameter("s_isAwarded"));
        
        sMapSpec.put("member_id", request.getParameter("s_member_id"));
        sMapSpec.put("category", request.getParameter("s_category"));
		
        MapTool mt = new MapTool();
		sMap = mt.nullValueParse(sMap);
		sMapRange = mt.nullValueParse(sMapRange);
		sMapSpec = mt.nullValueParse(sMapSpec);
		sMapEq = mt.nullValueParse(sMapEq);
		Software_javabean jb = new Software_javabean();
		ArrayList<Map<String, String>> list = jb.getList(sMap, sMapEq, sMapRange, sMapSpec);

		if (list.size() == 0) {
			out.print("0");
		} else {
			String r_table = "6";
			String r_table_name = "r_software";
			String module_name = "软件著作权";
			Achievement_javabean ajb = new Achievement_javabean(r_table, r_table_name);
			ArrayList<Map<String, Object>> listAchieve = new ArrayList<Map<String, Object>>();
			for (Map<String, String> map:list) {
				String id = map.get("id");
				Map<String, Object> achieveOri = ajb.view(id);
				Map<String, Object> achieveData = (Map<String, Object>) achieveOri.get("data");
				achieveData.put("membersA", achieveOri.get("membersA"));
				listAchieve.add(achieveData);
			}
	    	Date dt = new Date();   
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");  
	        String dateStr = sdf.format(dt);
	        String filePath = this.getServletContext().getRealPath("/")+"download/";
			String fileNameLast = (String) session.getAttribute("login_id") + module_name+ dateStr+".xls";
			filePath += fileNameLast;
			ServletContext application = request.getSession().getServletContext();
			String aRMBRatioS = (String)application.getAttribute("aRMBRatio");
			float aRMBRatio = Float.parseFloat(aRMBRatioS);
			Report_javabean rjb = new Report_javabean(aRMBRatio);
			SimpleExcelReport ser = new SimpleExcelReport();
			ArrayList<ArrayList<String>> reports = rjb.getReportAchieve(listAchieve, r_table);
			boolean flag = ser.generalExcel(filePath, reports);
			
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
		}
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
