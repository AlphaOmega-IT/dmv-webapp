package de.alphaomega.it.dmv;

import de.alphaomega.it.dmv.database.daos.UserDao;
import de.alphaomega.it.dmv.database.entities.User;
import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@ApplicationPath("")
public class RESTManager extends Application {
	
	private final Set<Object> singletons = new HashSet<>();
	
	public RESTManager() {}
	
	private void addSingleton(Object singletonObj) {
		singletons.add(singletonObj);
	}
	
	@Override
	public Set<Object> getSingletons() {
		return singletons;
	}
}