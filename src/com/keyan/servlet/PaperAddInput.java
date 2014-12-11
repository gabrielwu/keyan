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

public class PaperAddInput extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6279375749319785898L;

	/**
	 * Constructor of the object.
	 */
	public PaperAddInput() {
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
		// 论文类型列表
		Type_javabean tjb = new Type_javabean();
		ArrayList<Map<String, String>> typeJList = tjb.getTypeListByCategory("1", "1");
		request.setAttribute("typeJList", typeJList);
		ArrayList<Map<String, String>> typeCList = tjb.getTypeListByCategory("1", "2");
		request.setAttribute("typeCList", typeCList);
		ArrayList<Map<String, String>> typeList2 = tjb.getTypeList("1", 2);
		request.setAttribute("typeList2", typeList2);
		ArrayList<Map<String, String>> areaList = tjb.getPaperAreaList();
		request.setAttribute("areaList", areaList);
		// 用户作者列表
		User_javabean ujb = new User_javabean();
		ArrayList<Map<String, String>> memberList = ujb.getUserList();
		request.setAttribute("memberList", memberList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/paperAddInput.jsp"); 
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
