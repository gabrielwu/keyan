/**
 * 
 */
package filter;

/**
 * @author
 *
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AdminFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;   
		HttpServletResponse res = (HttpServletResponse) response;   
		HttpSession session = req.getSession(true);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		String login_type = (String)session.getAttribute("login_type");
		if (login_type == null || !login_type.equals("1")) {
            out.println("<script>");
            out.println("alert('没有权限！');");
            //out.println("window.location.href='"+req.getContextPath()+"/login.jsp';");
            out.println("</script>");
			//out.print("没有权限！");
			System.out.println("no!");
		} else {
			System.out.println("yes!");
			chain.doFilter(request,response);
		}
		
	}

	public void init(FilterConfig arg0) throws ServletException {
	}
}

