package de.alphaomega.it.dmv.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;

@WebFilter("/")
public class AuthenticationFilter implements Filter {
	
	public AuthenticationFilter() {
	
	}
	
	@Override
	public void init(final FilterConfig filterConfig) throws ServletException {
		
		Filter.super.init(filterConfig);
	}
	
	@Override
	public void doFilter(final ServletRequest request, final ServletResponse response, final FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest  req     = (HttpServletRequest) request;
		HttpServletResponse res     = (HttpServletResponse) response;
		HttpSession         session = req.getSession(false);
		
		boolean isLoggedIn  = (session != null && session.getAttribute("loggedUser") != null);
		String  loginURI    = req.getContextPath() + "/login.jsp";
		String  indexURI    = req.getContextPath() + "/index.jsp";
		String  categoryURI = req.getContextPath() + "/category.jsp";
		
		boolean isLoginRequest = req.getRequestURI().equals(loginURI);
		boolean isIndexRequest = req.getRequestURI().equals(indexURI);
		Object  userObject     = req.getSession().getAttribute("loggedUser");
		boolean isAdmin        = userObject != null && userObject.toString().contains("username='admin'");
		
		if (isLoggedIn && isLoginRequest) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login/category.jsp");
			requestDispatcher.forward(request, response);
		}
		else if (isAdmin && (req.getRequestURI().equals("/dmv/login/adminpanel.jsp") || req.getRequestURI().equals("/dmv/login/user/usercreation.jsp"))) {
			chain.doFilter(request, response);
		}
		else if (isLoggedIn || isLoginRequest || isIndexRequest) {
			if (!isAdmin && (req.getRequestURI().equals("/dmv/login/adminpanel.jsp") ||
			                 req.getRequestURI().equals("/dmv/login/user/usercreation.jsp"))) res.sendRedirect("/dmv/login/category.jsp");
			else chain.doFilter(request, response);
		}
		else if (req.getRequestURI().equals("/dmv/login")) {
			chain.doFilter(request, response);
		}
		else {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
			res.sendRedirect(indexURI);
		}
	}
	
	@Override
	public void destroy() {
		
		Filter.super.destroy();
	}
}