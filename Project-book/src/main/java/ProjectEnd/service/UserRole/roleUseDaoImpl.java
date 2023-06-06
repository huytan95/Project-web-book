package ProjectEnd.service.UserRole;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ProjectEnd.entities.User;
import ProjectEnd.entities.User_role;
@Repository
public class roleUseDaoImpl implements roleUserDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean insertRoleUser(User_role userRole) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(userRole);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public User_role getUserRoleById(Long id) {
		Session session = sessionFactory.openSession();
		try {
			User_role userRole = session.get(User_role.class, id);
			return userRole;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean updateRoleUser(User_role userRole) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(userRole);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public Set<User_role> getUserRoleByUser(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		try {
			CriteriaBuilder builder = session.getCriteriaBuilder();
		    CriteriaQuery<User_role> query = builder.createQuery(User_role.class);
		    Root<User_role> root = query.from(User_role.class);
		    query.select(root).where(builder.equal(root.get("user"), user));
		    List<User_role> userRoles = session.createQuery(query).getResultList();
		    return new HashSet<>(userRoles);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean deleteAllRolesByUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("DELETE FROM User_role WHERE user = :user");
			query.setParameter("user", user);
			query.executeUpdate();
			transaction.commit();
			return true;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}
}
