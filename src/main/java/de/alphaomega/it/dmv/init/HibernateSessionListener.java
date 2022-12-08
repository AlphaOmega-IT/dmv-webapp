package de.alphaomega.it.dmv.init;

import de.alphaomega.it.dmv.SessionManager;
import de.alphaomega.it.dmv.database.daos.UserDao;
import de.alphaomega.it.dmv.database.entities.User;
import lombok.Getter;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;

@Getter
@WebListener
public class HibernateSessionListener implements ServletContextListener {
	
	private SessionFactory sessionFactory;
	private Session session;
	
	public HibernateSessionListener() {
		final UserDao userDao = new UserDao();
		User user = userDao.findByName("admin");
		if (user == null) {
			user = new User("admin", "dmvmysteryadmin", List.of("Kategorie 1", "Kategorie 2", "Kategorie 3", "Kategorie 4", "Kategorie 5", "Kategorie 6"));
			userDao.create(user);
		}
	}
	
	public void contextInitialized(final ServletContextEvent event) {
		
		SessionFactory sessionFactory = new SessionManager().build();
		
		event.getServletContext().setAttribute("SessionFactory", sessionFactory);
		
		if (this.session == null)
			this.session = sessionFactory.openSession();
	}
	
	public void contextDestroyed(final ServletContextEvent event) {
		this.sessionFactory = (SessionFactory) event.getServletContext().getAttribute("SessionFactory");
		if (this.sessionFactory != null && !sessionFactory.isClosed()) sessionFactory.close();
		
		this.session = null;
		this.sessionFactory = null;
	}
	
	public Session getSession() {
		return this.session != null ? sessionFactory.getCurrentSession() : sessionFactory.openSession();
	}
}