package com.keyan.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyan.javabean.Achievement_javabean;

public class AchievementBatchDelete extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7021255744583707431L;

	/**
	 * Constructor of the object.
	 */
	public AchievementBatchDelete() {
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
		String login_type = (String) session.getAttribute("login_type");
		String idsString = request.getParameter("ids");
		String table = request.getParameter("table");
        String table_id = request.getParameter("table_id");
    	String[] ids = idsString.split(",");
    	Achievement_javabean jb = new Achievement_javabean(table_id, table);
    	ArrayList<String> filePaths = jb.batchDelete(ids, login_type); 
    	int total = ids.length;
    	int totalS = filePaths.size();
    	for (String flag: filePaths) {
    		String path = this.getServletContext().getRealPath("/");
    		String filePath = path + flag;
    		System.out.println(filePath + ":file deleted!");
    		File file = new File(filePath);
    		if (file.isFile()) {
    			file.delete();
    			System.out.println("file deleted!");
    		}
    	}
    	String result;
    	if (total == totalS) {
        	result = "成功删除"+totalS+"条记录！";
    	} else {
    		result = "成功删除"+totalS+"条记录，失败"+(total-totalS)+"条（审核通过的不能删除！）";
    	}
    	out.print(result);
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
