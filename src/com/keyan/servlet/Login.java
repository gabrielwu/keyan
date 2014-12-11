package com.keyan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.keyan.javabean.Login_javabean;

public class Login extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public Login() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		request.setAttribute("username", username);
		String msg = "";
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp"); 
		if (username.equals("")||password.equals("")) {
			msg = "用户名和密码不能为空！";
			request.setAttribute("msg", msg);
			dispatcher.forward(request, response); 
		} else {
			Login_javabean jb = new Login_javabean();
			boolean canLogin = jb.canLogin(username, password);
			if (canLogin) {
				Map<String, String> map = jb.getUser(username);
				Map<String, String> conf = jb.getConf();
				String canSubmit = "";
				String canSubmitText = "";
				String submitTipPaper = "";
				String submitTipProject = "";
				String submitTipBook = "";
				String submitTipAwards = "";
				String submitTipPatent = "";
				String submitTipSoftware = "";
				String aRMBRatio = "";
				if (conf.containsKey("aRMBRatio")) {
					aRMBRatio = conf.get("aRMBRatio");
					System.out.println(aRMBRatio);
				}
				if (conf.containsKey("canSubmit")) {
					canSubmit = conf.get("canSubmit");
					if (canSubmit.equals("1")) {
						canSubmitText = "关闭成果提交";
					} else {
						canSubmitText = "开启成果提交";
					}
				}
				if (conf.containsKey("submitTipPaper")) {
					submitTipPaper = conf.get("submitTipPaper");
				}
				if (conf.containsKey("submitTipProject")) {
					submitTipProject = conf.get("submitTipProject");
				}
				if (conf.containsKey("submitTipBook")) {
					submitTipBook = conf.get("submitTipBook");
				}
				if (conf.containsKey("submitTipAwards")) {
					submitTipAwards = conf.get("submitTipAwards");
				}
				if (conf.containsKey("submitTipPatent")) {
					submitTipPatent = conf.get("submitTipPatent");
				}
				if (conf.containsKey("submitTipSoftware")) {
					submitTipSoftware = conf.get("submitTipSoftware");
				}
				ServletContext application = this.getServletContext(); 
				application.setAttribute("aRMBRatio", aRMBRatio);
				application.setAttribute("canSubmitText", canSubmitText);
				application.setAttribute("canSubmit", canSubmit);
				application.setAttribute("submitTipPaper", submitTipPaper);
				application.setAttribute("submitTipProject", submitTipProject);
				application.setAttribute("submitTipBook", submitTipBook);
				application.setAttribute("submitTipAwards", submitTipAwards);
				application.setAttribute("submitTipPatent", submitTipPatent);
				application.setAttribute("submitTipSoftware", submitTipSoftware);
				HttpSession session = request.getSession();
				session.setAttribute("login", "1");
				session.setAttribute("login_username", username);
				session.setAttribute("login_id", map.get("id"));
				session.setAttribute("login_name", map.get("name"));
				session.setAttribute("login_lab_id", map.get("lab_id"));
				session.setAttribute("login_type", map.get("type"));
				RequestDispatcher dispatcher2 = request.getRequestDispatcher("index.jsp"); 
				dispatcher2.forward(request, response);
			} else {
				msg = "用户名或密码错误！";
				request.setAttribute("msg", msg);
				dispatcher.forward(request, response);
			}
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
