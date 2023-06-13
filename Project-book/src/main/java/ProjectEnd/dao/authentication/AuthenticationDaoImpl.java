package ProjectEnd.dao.authentication;

import ProjectEnd.entities.Authentication;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthenticationDaoImpl implements AuthenticationDao{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Authentication getAuthenticationCodeById(int id) {
        Session session = sessionFactory.openSession();
        try{
            Authentication authentication = session.get(Authentication.class, id);
            return authentication;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public boolean updateAuthCode(Authentication authCode) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.update(authCode);
            session.getTransaction().commit();
            return true;
        } catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return false;
    }

    @Override
    public boolean insertAuthCode(Authentication authcode) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(authcode);
            session.getTransaction().commit();
            return true;
        } catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return false;
    }

    @Override
    public Authentication getAuthByUserId(long userId) {
        Session session = sessionFactory.openSession();
        try {
            Query<Authentication> query = session.createQuery("SELECT auth FROM Authentication auth WHERE auth.user.id = :userId", Authentication.class);
            query.setParameter("userId", userId);
            Authentication authentication = query.uniqueResult();
            return authentication;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

}
