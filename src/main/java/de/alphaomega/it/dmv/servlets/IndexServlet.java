package de.alphaomega.it.dmv.servlets;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;

@WebServlet("/")
public class IndexServlet extends HttpServlet {
	
	public IndexServlet() {
	
	}
    
    @SneakyThrows
    @Override
    protected void doGet(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        httpServletRequest.getRequestDispatcher("/index.jsp").forward(httpServletRequest, httpServletResponse);
    }
    
    @Override
    protected void doPost(final HttpServletRequest httpServletRequest, final HttpServletResponse httpServletResponse) {
        doGet(httpServletRequest, httpServletResponse);
    }
}