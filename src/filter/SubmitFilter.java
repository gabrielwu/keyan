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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SubmitFilter implements Filter {

	public void init(FilterConfig arg0) throws ServletException {
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;   
		HttpServletResponse res = (HttpServletResponse) response;   
		HttpSession session = req.getSession(true);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		ServletContext application = req.getSession().getServletContext();
		String canSubmit = (String)application.getAttribute("canSubmit");
		String type = (String) session.getAttribute("login_type");
        if (!type.equals("1") && !canSubmit.equals("1")) {
            out.println("<script>");
            out.println("alert('提交成果功能未开启！');");
            out.println("</script>");
            out.close();
        } else {
    		chain.doFilter(request, response);
        }
	}
	public void destroy() {
	}
}

