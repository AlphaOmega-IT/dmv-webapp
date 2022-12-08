package de.alphaomega.it.dmv.database.daos;

import de.alphaomega.it.dmv.database.entities.User;
import de.alphaomega.it.dmv.utils.BCryptUtil;
import org.hibernate.query.Query;

import java.util.List;

public class UserDao extends BaseDao<User>{
    
    @Override
    protected Class<User> getClassType() {
        return User.class;
    }
    
	public UserDao() {
	
	}
    
    public List<User> findAll() {
        Query<User> query = this.createNamedQuery("User.findAll");
        return query.getResultList();
    }
    
    public User findByName(final String username) {
    
        Query<User> query = this.createNamedQuery("User.findByName");
        query.setParameter("username", username);
        return query.getSingleResultOrNull();
    }
    
    public User checkLogin(final String username, final String password) {
        User tempUser = findByName(username);
        if (tempUser == null) return null;
        
        Query<User> query = this.createNamedQuery("User.findByUsernameAndPassword");
        query.setParameter("username", username);
        query.setParameter("password", tempUser.getPassword());
        final User user = query.getSingleResultOrNull();
        if (user == null) return null;
        if (!BCryptUtil.verifyAndUpdateHash(password, tempUser.getPassword())) return null;
        return user;
    }
}