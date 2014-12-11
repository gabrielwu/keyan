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
import com.keyan.javabean.Type_javabean;
import com.keyan.javabean.User_javabean;

public class BookModifyInput extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5174189611172511344L;

	/**
	 * Constructor of the object.
	 */
	public BookModifyInput() {
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
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String login_type = (String) session.getAttribute("login_type");
		String r_table = "3";
		String r_table_name = "r_book";
		String id = request.getParameter("id");
		// 对应成果内容和成员
		Achievement_javabean jb = new Achievement_javabean(r_table, r_table_name, id);
		Map<String, Object> map = jb.view();
        Map<String, String> data = (Map<String, String>) map.get("data");
        ArrayList<Map<String, String>> members = (ArrayList<Map<String, String>>) map.get("members");
		// 类型列表
		Type_javabean tjb = new Type_javabean();
		ArrayList<Map<String, String>> typeList1 = tjb.getTypeList(r_table, 1);
		ArrayList<Map<String, String>> typeList2 = tjb.getTypeList(r_table, 2);
		// 用户成员列表
		User_javabean ujb = new User_javabean();
		ArrayList<Map<String, String>> memberList = ujb.getUserList();
		// 赋值
		request.setAttribute("data", data);
		request.setAttribute("members", members);
		request.setAttribute("typeList1", typeList1);
		request.setAttribute("typeList2", typeList2);
		request.setAttribute("memberList", memberList);
		if (data.get("pass").equals("1") && !login_type.equals("1")) {
			out.println("<script>");
            out.println("alert('已通过审核，不能修改！');");
            out.println("</script>");
		} else {
			// 跳转jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher("/bookModifyInput.jsp"); 
			dispatcher .forward(request, response); 
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
