package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginIndexFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest servletrequest = (HttpServletRequest) request;
		HttpServletResponse servletresponse = (HttpServletResponse) response;
		HttpSession session = servletrequest.getSession();
		Object user = session.getAttribute("User");
		String url = servletrequest.getRequestURI();
		if(!url.contains("/mg/")&&url.contains("dnr.action")||url.contains("dnri.action")){
			System.out.println("不是管理页");
			if (url.contains(".css") || url.contains(".js") || url.contains(".png")
					|| url.contains(".jpg") || url.contains(".flash")
					|| url.contains(".mp4") || url.contains(".swf")
					|| url.contains("isexists")) {
				// 如果发现是css或者js文件，直接放行
				chain.doFilter(request, response);
			} else if (url.contains("login.jsp") || url.contains("login.action")) {
				chain.doFilter(request, response);
				return;
			} else if (user == null || "".equals(user)) {
//				servletresponse.sendRedirect("login.jsp");
				 servletrequest.getRequestDispatcher("login.jsp").forward(request,
				 response);
			} else {
				// 已经登陆,继续此次请求
				chain.doFilter(request, response);
			}
		}else if(url.contains("/mg/")){
			System.out.println("是管理页");
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
