package de.alphaomega.it.dmv.servlets;

import de.alphaomega.it.dmv.database.daos.UserDao;
import de.alphaomega.it.dmv.database.entities.User;
import de.alphaomega.it.dmv.utils.WebUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	public LoginServlet() {
	
	}
    
    @SneakyThrows
    @Override
    protected void doGet(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        final RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/login.jsp");
        requestDispatcher.forward(httpServletRequest, httpServletResponse);
    }
    
    @SneakyThrows
    @Override
    protected void doPost(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        final String username = httpServletRequest.getParameter("username");
        final String password = httpServletRequest.getParameter("password");
        
        final User user = new UserDao().checkLogin(username, password);
        if (user == null) {
            httpServletRequest.setAttribute("errorMessage", 401);
            final RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(httpServletRequest, httpServletResponse);
            return;
        }
        httpServletRequest.setAttribute("errorMessage", null);
        WebUtils.storeLoggedUser(httpServletRequest.getSession(), user);
        httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login/category.jsp");
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