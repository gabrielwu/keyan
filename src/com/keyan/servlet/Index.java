package com.keyan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyan.javabean.Achievement_javabean;

public class Index extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -981936909570742591L;

	/**
	 * Constructor of the object.
	 */
	public Index() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action = "include/main.jsp";
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("login_id");
		ArrayList<Map<String, String>> list1;
		ArrayList<Map<String, String>> list2;
		ArrayList<Map<String, String>> list3;
		ArrayList<Map<String, String>> list4;
		ArrayList<Map<String, String>> list5;
		ArrayList<Map<String, String>> list6;
		Map<String, ArrayList<Map<String, String>>> map;
		Achievement_javabean jb = new Achievement_javabean();
		String login_type = (String) session.getAttribute("login_type");
		String t = request.getParameter("t");
		if (login_type.equals("1") && t.equals("1")) { // 管理员，首页显示未审核或未通过的成果
			map = jb.getIndexList();
		} else {
			map = jb.getIndexList(user_id);
		}
	    list1 = (ArrayList<Map<String, String>>)map.get("list1");
	    list2 = (ArrayList<Map<String, String>>)map.get("list2");
	    list3 = (ArrayList<Map<String, String>>)map.get("list3");
	    list4 = (ArrayList<Map<String, String>>)map.get("list4");
	    list5 = (ArrayList<Map<String, String>>)map.get("list5");
	    list6 = (ArrayList<Map<String, String>>)map.get("list6");
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("list5", list5);
		request.setAttribute("list6", list6);
		request.setAttribute("login_type", login_type);
		System.out.println(list1.size());
		System.out.println(list2.size());
		System.out.println(list3.size());
		System.out.println(list4.size());
		System.out.println(list5.size());
		System.out.println(list6.size());
		RequestDispatcher dispatcher = request.getRequestDispatcher(action); 
		dispatcher .forward(request, response);
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
