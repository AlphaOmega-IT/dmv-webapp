package de.alphaomega.it.dmv.servlets;

import de.alphaomega.it.dmv.database.daos.UserDao;
import de.alphaomega.it.dmv.database.entities.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;

import java.util.ArrayList;
import java.util.List;

@WebServlet("/createuser")
public class CreateUserServlet extends HttpServlet {
	
	public CreateUserServlet() {
	
	}
	
	@SneakyThrows
	@Override
	protected void doGet(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
		final RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/login/user/usercreation.jsp");
		requestDispatcher.forward(httpServletRequest, httpServletResponse);
	}
	
	@SneakyThrows
	@Override
	protected void doPost(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
		final String username = httpServletRequest.getParameter("username");
		final String password = httpServletRequest.getParameter("password");
		final List<String> permissions = httpServletRequest.getParameterValues("permissionSelector") != null ? List.of(httpServletRequest.getParameterValues("permissionSelector")) : new ArrayList<>();
		
		final UserDao userDao = new UserDao();
		
		final User tempUser = userDao.findByName(username);
		if (tempUser != null) {
			httpServletRequest.setAttribute("errorMessage", "400");
			final RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/login/user/usercreation.jsp");
			requestDispatcher.forward(httpServletRequest, httpServletResponse);
			return;
		}
		
		final User user = new User(username, password, permissions);
		userDao.create(user);
		
		httpServletRequest.setAttribute("errorMessage", null);
		httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login/adminpanel.jsp");
	}
	
	@Override
	public void destroy() {
		
		super.destroy();
	}
	
	@Override
	public void init() throws ServletException {
		
		super.init();
	}
}