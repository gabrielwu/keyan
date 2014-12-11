package com.keyan.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyan.javabean.Achievement_javabean;

public class PatentView extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8771805355298025620L;

	/**
	 * Constructor of the object.
	 */
	public PatentView() {
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
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String q = request.getParameter("q");
		request.setAttribute("passOrView", q);
		if (session.getAttribute("login_type").equals("0")) {
			request.setAttribute("passOrView", "0");
		}
		String r_table = "5";
		String r_table_name = "r_patent";
		Achievement_javabean jb = new Achievement_javabean(r_table, r_table_name, id);
		Map<String, Object> map = jb.view();
        Map<String, String> data = (Map<String, String>) map.get("data");
        ArrayList<Map<String, String>> members = (ArrayList<Map<String, String>>) map.get("members");
		request.setAttribute("data", data);
		request.setAttribute("members", members);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/patentView.jsp"); 
		dispatcher.forward(request, response); 
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
