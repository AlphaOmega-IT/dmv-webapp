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

@WebServlet("/deleteuser/*")
public class DeleteUserServlet extends HttpServlet {
	
	public DeleteUserServlet() {
	
	}
	
	@SneakyThrows
	@Override
	protected void doGet(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
		final RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/login/adminpanel.jsp");
		requestDispatcher.forward(httpServletRequest, httpServletResponse);
	}
	
	@SneakyThrows
	@Override
	protected void doPost(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
		final String username = httpServletRequest.getRequestURI().replaceFirst("/dmv/deleteuser/", "");
		final UserDao userDao = new UserDao();
		
		final User deleteUser = userDao.findByName(username);
		if (deleteUser != null && !deleteUser.getUsername().equals("admin")) {
			userDao.delete(deleteUser);
		}
		
		httpServletRequest.setAttribute("errorMessage", "200");
		final RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/login/adminpanel.jsp");
		requestDispatcher.forward(httpServletRequest, httpServletResponse);
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