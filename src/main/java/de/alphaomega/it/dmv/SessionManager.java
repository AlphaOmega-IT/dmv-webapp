package de.alphaomega.it.dmv;

import de.alphaomega.it.dmv.database.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Properties;


public class SessionManager {
  
  private Configuration configuration;
  
  public SessionManager() {
  
    try {
      Properties properties = new Properties();
      
      properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
      properties.setProperty("connection.driver_class", "com.mysql.cf.jdbc.Driver");
      properties.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/dmvimage?useUnicode=true");
      properties.setProperty("hibernate.connection.username", "root");
      properties.setProperty("hibernate.connection.password", "");
      properties.setProperty("hibernate.hbm2ddl.auto", "update");
      properties.setProperty("current_session_context_class", "thread");
      
      this.configuration = new Configuration().addAnnotatedClass(User.class).addProperties(properties);
    } catch (final Exception exception) {
      exception.printStackTrace();
    }
  }
  
  public SessionFactory build() {
  
    if (this.configuration == null) return null;
    return this.configuration.buildSessionFactory();
  }
}