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


public class LoginFilter implements Filter {

	public void init(FilterConfig arg0) throws ServletException {
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;   
		HttpServletResponse res = (HttpServletResponse) response;   
		HttpSession session = req.getSession(true);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		System.out.println(req.getServletPath());
		if (req.getServletPath().startsWith("/login")) { // 登录页和请求排除
			System.out.println("login");
			chain.doFilter(request, response);
		} else {
            String isLogin = (String) session.getAttribute("login");
			System.out.println(isLogin);
            if (isLogin == null || !isLogin.equals("1")) {
    			System.out.println("nologin");
                out.println("<script>");
                out.println("alert('请先登录！');");
                out.println("window.top.location.href='"+req.getContextPath()+"/login.jsp';");
                out.println("</script>");
                out.close();
    			System.out.println(req.getContextPath() + "/login.jsp");
            } else {
    			chain.doFilter(request, response);
            }
		}
	}
	public void destroy() {
	}


}

