package filter;
import java.io.IOException;

import javax.persistence.Entity;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Entity
public class LoginFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		// 获得在下面代码中要用的request,response,session对象
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		// 获得用户请求的URI
		String path = servletRequest.getRequestURI();
		String paths=path.substring(path.lastIndexOf("."));
		// 从session里取员工工号信息
		String admin = (String) session.getAttribute("admin");
		// 登陆页面无需过滤
		if(path.indexOf("mglogin.jsp") > -1) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		// 登陆页面action无需过滤
		if(path.indexOf("login.action") > -1) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		 // 判断如果没有取到员工信息,就跳转到登陆页面
		if (admin == null || "".equals(admin)) {;
			//判断用户进入action还是jsp
			if(paths.equals(".action")){
				// 跳转到登陆页面
			    servletResponse.sendRedirect("../mg/mglogin.jsp");
			}else{
				// 跳转到登陆页面
			    servletResponse.sendRedirect("../mg/mglogin.jsp");
			}
		} else {
		// 已经登陆,继续此次请求
		    chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
