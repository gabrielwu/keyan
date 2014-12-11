package com.keyan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyan.javabean.Awards_javabean;
import com.keyan.javabean.Lab_javabean;
import com.keyan.javabean.Type_javabean;
import com.keyan.javabean.User_javabean;
import com.keyan.tool.MapTool;

public class AwardsList extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8499512556729931043L;

	/**
	 * Constructor of the object.
	 */
	public AwardsList() {
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
        //sMap.put("number", request.getParameter("s_number"));
        sMap.put("level", request.getParameter("s_level"));
        sMap.put("department", request.getParameter("s_department"));
        
        sMapRange.put("date_pass", request.getParameter("s_date_pass"));
        sMapRange.put("date_pass_2", request.getParameter("s_date_pass_2"));
        sMapRange.put("date_commit", request.getParameter("s_date_commit"));
        sMapRange.put("date_commit_2", request.getParameter("s_date_commit_2"));
        sMapRange.put("date", request.getParameter("s_date"));
        sMapRange.put("date_2", request.getParameter("s_date_2"));

        sMapEq.put("pass", request.getParameter("s_pass"));
        sMapEq.put("lab_id", request.getParameter("s_lab_id"));
        sMapEq.put("user_id", user_id);
        sMapEq.put("leader_id", request.getParameter("s_leader_id"));
        sMapEq.put("type_id", request.getParameter("s_type_id"));
        sMapEq.put("type2013_id", request.getParameter("s_type2013_id"));
        System.out.println("2013:" + sMapEq.get("type2013_id"));
        sMapEq.put("a.a_value", request.getParameter("s_a_value"));
        sMapEq.put("isAwarded", request.getParameter("s_isAwarded"));
        
        sMapSpec.put("member_id", request.getParameter("s_member_id"));
        sMapSpec.put("category", request.getParameter("s_category"));
		
        MapTool mt = new MapTool();
		sMap = mt.nullValueParse(sMap);
		sMapRange = mt.nullValueParse(sMapRange);
		sMapSpec = mt.nullValueParse(sMapSpec);
		sMapEq = mt.nullValueParse(sMapEq);
		Awards_javabean jb = new Awards_javabean();
		ArrayList<Map<String, String>> list = jb.getList(sMap, sMapEq, sMapRange, sMapSpec);
		
		// 类型列表
		Type_javabean tjb = new Type_javabean();
		String r_table = "4";
		ArrayList<Map<String, String>> typeList1 = tjb.getTypeList(r_table, 1);
		ArrayList<Map<String, String>> typeList2 = tjb.getTypeList(r_table, 2);
		request.setAttribute("typeList1", typeList1);
		request.setAttribute("typeList2", typeList2);
		// 用户成员列表
		User_javabean ujb = new User_javabean();
		ArrayList<Map<String, String>> memberList = ujb.getUserList();
		request.setAttribute("memberList", memberList);
		// 实验室列表
		Lab_javabean ljb = new Lab_javabean();
		ArrayList<Map<String, String>> labList = ljb.getList();
		request.setAttribute("labList", labList);

		request.setAttribute("list", list);
		request.setAttribute("sMap", sMap);
		request.setAttribute("sMapRange", sMapRange);
		request.setAttribute("sMapEq", sMapEq);
		request.setAttribute("sMapSpec", sMapSpec);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/awardsList.jsp"); 
		dispatcher.forward(request, response); 
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
