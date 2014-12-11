package com.keyan.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.keyan.javabean.Type_javabean;
import com.keyan.javabean.User_javabean;

public class ProjectAddInput extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5829422207723275157L;

	/**
	 * Constructor of the object.
	 */
	public ProjectAddInput() {
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
		// 类型列表
		Type_javabean tjb = new Type_javabean();
		String r_table = "2";
		ArrayList<Map<String, String>> typeListP = tjb.getTypeListByCategory(r_table, "1");
		request.setAttribute("typeListP", typeListP);
		ArrayList<Map<String, String>> typeListH = tjb.getTypeListByCategory(r_table, "2");
		request.setAttribute("typeListH", typeListH);
		ArrayList<Map<String, String>> typeList2 = tjb.getTypeList(r_table, 2);
		request.setAttribute("typeList2", typeList2);
		// 用户成员列表
		User_javabean ujb = new User_javabean();
		ArrayList<Map<String, String>> memberList = ujb.getUserList();
		request.setAttribute("memberList", memberList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/projectAddInput.jsp"); 
		dispatcher .forward(request, response); 
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
