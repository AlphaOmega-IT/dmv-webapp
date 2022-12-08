package de.alphaomega.it.dmv.servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	
	public LogoutServlet() {
	
	}
    
    @SneakyThrows
    @Override
    protected void doGet(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        httpServletRequest.getSession().invalidate();
        httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/index.jsp");
    }
    
    @SneakyThrows
    @Override
    protected void doPost(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        super.doGet(httpServletRequest, httpServletResponse);
    }
}