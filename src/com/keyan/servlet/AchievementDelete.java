package com.keyan.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyan.javabean.Achievement_javabean;

public class AchievementDelete extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 30914142002589802L;

	/**
	 * Constructor of the object.
	 */
	public AchievementDelete() {
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
        String r_table = request.getParameter("table_id");
        String r_table_name = request.getParameter("table");
        String a_id = request.getParameter("id");
		Achievement_javabean jb = new Achievement_javabean(r_table, r_table_name, a_id);
		Map<String, Object> map = jb.view();
        Map<String, String> data = (Map<String, String>) map.get("data");
        System.out.println(data.get("pass"));
        System.out.println(login_type);
        if (data.get("pass").equals("1") && !login_type.equals("1")) {
			out.print("-1");
		} else {
			String flag = jb.delete(a_id, login_type);
			if (flag.equals("-1") || flag.equals("0")) {
				out.print(flag);
			} else {
				String path = this.getServletContext().getRealPath("/");
				String filePath = path + flag;
				System.out.println(filePath + ":file deleted!");
				File file = new File(filePath);
				if (file.isFile()) {
					file.delete();
					System.out.println("file deleted!");
				}
				out.print("1");
			}
		}
		request.setAttribute("r_table", "");
		request.setAttribute("r_table_name", "");
		request.setAttribute("a_id", "");
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
