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

public class PaperModifyInput extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 312754319830167995L;

	/**
	 * Constructor of the object.
	 */
	public PaperModifyInput() {
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
	//@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String login_type = (String) session.getAttribute("login_type");
		String id = request.getParameter("id");
		Achievement_javabean jb = new Achievement_javabean("1", "r_paper", id);
		Map<String, Object> map = jb.view();
        Map<String, String> data = (Map<String, String>) map.get("data");
        ArrayList<Map<String, String>> members = (ArrayList<Map<String, String>>) map.get("members");

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
		request.setAttribute("data", data);
		request.setAttribute("members", members);
		if (data.get("pass").equals("1") && !login_type.equals("1")) {
			out.println("<script>");
            out.println("alert('已通过审核，不能修改！');");
            out.println("</script>");
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/paperModifyInput.jsp"); 
			dispatcher.forward(request, response); 
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
