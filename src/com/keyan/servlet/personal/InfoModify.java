package com.keyan.servlet.personal;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyan.javabean.AllCommon_javabean;

public class InfoModify extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5747174023013453283L;

	/**
	 * Constructor of the object.
	 */
	public InfoModify() {
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
		String id = (String)session.getAttribute("login_id");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", request.getParameter("name"));
		map.put("username", request.getParameter("username"));
		map.put("lab_id", request.getParameter("lab_id"));
		map.put("sex", request.getParameter("sex"));
		map.put("off", request.getParameter("off"));
		System.out.println(request.getParameter("name"));
		String table = "r_user";
		AllCommon_javabean jb = new AllCommon_javabean(table);
		int flag = jb.modify(map);
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
