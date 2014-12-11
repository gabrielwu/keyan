package com.keyan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyan.javabean.Achievement_javabean;
import com.keyan.javabean.User_javabean;

public class PaperModify extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6057399408754355683L;

	/**
	 * Constructor of the object.
	 */
	public PaperModify() {
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
		HttpSession session = request.getSession();
		Map<String, String> data = new HashMap<String, String>();
		data.put("id", request.getParameter("id"));
		//data.put("user_id", (String)session.getAttribute("login_id"));
		data.put("title", request.getParameter("title"));
		data.put("file_path", request.getParameter("file_path"));
		data.put("link", request.getParameter("link"));
		data.put("leader_id", request.getParameter("leader_id"));
		data.put("type_id", request.getParameter("type_id"));
		data.put("type2013_id", request.getParameter("type2013_id"));
		data.put("area_id", request.getParameter("area_id"));
		data.put("a_value", request.getParameter("a_value"));
		data.put("publication", request.getParameter("publication"));
		data.put("date_publish", request.getParameter("date_publish"));
		data.put("keywords", request.getParameter("keywords"));
		data.put("abstract", request.getParameter("_abstract"));
		data.put("abstract_en", request.getParameter("_abstract_en"));
		data.put("remark", request.getParameter("remark"));
		data.put("number", request.getParameter("number"));
		data.put("factor", request.getParameter("factor"));
		data.put("citiations", request.getParameter("citiations"));
		data.put("authors", request.getParameter("authors"));
		data.put("j_volume", (request.getParameter("j_volume").equals(""))?"":request.getParameter("j_volume"));
		data.put("j_issue", (request.getParameter("j_issue").equals(""))?"":request.getParameter("j_issue"));
		data.put("j_page", (request.getParameter("j_page").equals(""))?"":request.getParameter("j_page"));
		data.put("c_date", (request.getParameter("c_date").equals(""))?null:request.getParameter("c_date"));
		data.put("c_location", (request.getParameter("c_location").equals(""))?"":request.getParameter("c_location"));
		
		String members = request.getParameter("members");
		User_javabean mjb = new User_javabean();
	    ArrayList<Map<String, String>> memberList = mjb.membersStringToList(members); 
	    Achievement_javabean jb = new Achievement_javabean("1", "r_paper");
	    String exist = jb.exist(data.get("title"), data.get("id"));
	    if (!exist.equals("")) {
			out.print(exist);
	    } else {
			int flag = jb.modify(data, memberList);
			out.print(""+flag);
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
