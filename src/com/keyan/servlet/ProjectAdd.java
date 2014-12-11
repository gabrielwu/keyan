package com.keyan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyan.javabean.Achievement_javabean;
import com.keyan.javabean.User_javabean;

public class ProjectAdd extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1987741792308842485L;

	/**
	 * Constructor of the object.
	 */
	public ProjectAdd() {
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
		Map<String, String> data = new HashMap<String, String>();
		data.put("user_id", (String)session.getAttribute("login_id"));
		data.put("title", request.getParameter("title"));
		data.put("file_path", request.getParameter("file_path"));
		data.put("remark", request.getParameter("remark"));
		data.put("link", request.getParameter("link"));
		data.put("leader_id", request.getParameter("leader_id"));
		data.put("type_id", request.getParameter("type_id"));
		data.put("type2013_id", request.getParameter("type2013_id"));
		data.put("card", request.getParameter("card"));
		data.put("a_value", request.getParameter("a_value"));
		data.put("plan", request.getParameter("plan"));
		data.put("date1", request.getParameter("date1"));
		data.put("date2", request.getParameter("date2"));
		data.put("cost", request.getParameter("cost"));
		data.put("source", request.getParameter("source"));
		data.put("number", request.getParameter("number"));
		data.put("status", request.getParameter("status"));
		data.put("costYears", request.getParameter("costYears"));
		
		String members = request.getParameter("members");
		User_javabean mjb = new User_javabean();
		String r_table = "2";
		String r_table_name = "r_project";
	    ArrayList<Map<String, String>> memberList = mjb.membersStringToList(members); 
	    Achievement_javabean jb = new Achievement_javabean(r_table, r_table_name);
	    String exist = jb.exist(data.get("title"));
	    if (!exist.equals("")) {
			out.print(exist);
	    } else {
			int flag = jb.add(data, memberList);
			out.print(""+flag);
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
