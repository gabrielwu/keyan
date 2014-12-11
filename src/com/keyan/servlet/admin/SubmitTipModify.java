package com.keyan.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyan.javabean.AllCommon_javabean;

public class SubmitTipModify extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1882709095118429200L;

	/**
	 * Constructor of the object.
	 */
	public SubmitTipModify() {
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

		ServletContext application = this.getServletContext(); 
		HttpSession session = request.getSession();
		String tipType = "submitTip" + (String) session.getAttribute("tipType");
		String tip = request.getParameter("tip");
		AllCommon_javabean jb = new AllCommon_javabean("r_conf");
		Map<String, String> data = new HashMap<String, String>();
		data.put("value", tip);
		String whereColumn = "name";
		String whereValue = tipType;
		int flag = jb.modify(data, whereColumn, whereValue);
		if (flag == 1) {
			application.setAttribute(tipType, tip);
		}
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
