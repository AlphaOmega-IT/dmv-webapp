package de.alphaomega.it.dmv.database.daos;

import de.alphaomega.it.dmv.SessionManager;
import de.alphaomega.it.dmv.init.HibernateSessionListener;
import org.hibernate.Session;
import org.hibernate.query.Query;

public abstract class BaseDao<T> {
    
    protected abstract Class<T> getClassType();
    
    public void create(final T data) {
    
        Session session = openSession();
        try {
            session.clear();
            session.beginTransaction();
            session.persist(data);
            session.getTransaction().commit();
        } catch (final Exception e) {
            if (session.getTransaction() != null && session.getTransaction().isActive())
                session.getTransaction().rollback();
        } finally {
            session.close();
        }
    }
    
    public void update(final T data) {
    
        Session session = openSession();
        try {
            session.clear();
            session.beginTransaction();
            session.merge(data);
            session.flush();
            session.getTransaction().commit();
        } catch (final Exception e) {
            if (session.getTransaction() != null && session.getTransaction().isActive())
                session.getTransaction().rollback();
        } finally {
            session.close();
        }
    }
    
    public void delete(final T data) {
    
        Session session = openSession();
        try {
            session.clear();
            session.beginTransaction();
            session.remove(data);
            session.flush();
            session.getTransaction().commit();
        } catch (final Exception e) {
            if (session.getTransaction() != null && session.getTransaction().isActive())
                session.getTransaction().rollback();
        } finally {
            session.close();
        }
    }
    
    public Query<T> createNamedQuery(String queryName) {
    
        Session session = openSession();
        return session.createNamedQuery(queryName, this.getClassType());
    }
    
    private Session openSession() {
        return new SessionManager().build().openSession();
    }
}