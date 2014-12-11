package com.keyan.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.keyan.javabean.AllCommon_javabean;
import com.keyan.util.MD5Util;

public class UserAdd extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7571140166806754729L;

	/**
	 * Constructor of the object.
	 */
	public UserAdd() {
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
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = MD5Util.MD5(username); // 初始密码同用户名
		String lab_id = request.getParameter("lab_id");
		String sex = request.getParameter("sex");
		String type = request.getParameter("type");
		String off = "0";
		System.out.println(name+" "+username+" "+password+" "+lab_id+" "+sex+" "+type+" "+off);
		Map<String, String> data = new HashMap<String, String>();
		data.put("name", name);
		data.put("username", username);
		data.put("password", password);
		data.put("lab_id", lab_id);
		data.put("sex", sex);
		data.put("type", type);
		data.put("off", off);
		AllCommon_javabean jb = new AllCommon_javabean("r_user");
		int flag = jb.add(data);
		out.print(flag);
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
