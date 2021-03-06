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

public class AwardsAddInput extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1222621059110740213L;

	/**
	 * Constructor of the object.
	 */
	public AwardsAddInput() {
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
		String r_table = "4";
		ArrayList<Map<String, String>> typeList1 = tjb.getTypeList(r_table, 1);
		ArrayList<Map<String, String>> typeList2 = tjb.getTypeList(r_table, 2);
		request.setAttribute("typeList1", typeList1);
		request.setAttribute("typeList2", typeList2);
		// 用户成员列表
		User_javabean ujb = new User_javabean();
		ArrayList<Map<String, String>> memberList = ujb.getUserList();
		request.setAttribute("memberList", memberList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/awardsAddInput.jsp"); 
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
